WITH PseudoFirstDate AS
(
	SELECT (CASE WHEN (SELECT Value FROM Prefs WHERE Name = 'lastpromotiondate') IS NOT NULL THEN TO_DATE((SELECT Value FROM Prefs WHERE Name = 'lastpromotiondate'),'mm/dd/yyyy')
		WHEN (SELECT Value FROM Prefs WHERE Name = 'lastpromotiondate') IS NULL AND YearRecord.FirstDay IS NOT NULL THEN YearRecord.FirstDay
		ELSE (SELECT FirstDay FROM Terms WHERE IsYearRec = 1 AND SchoolID = 0 AND YearID = (SELECT MAX(YearID) FROM Terms WHERE SchoolID = 0 AND FirstDay <= SYSDATE))	 
	END) AS PseudoFirstDate   
	FROM Dual
		LEFT JOIN (
		SELECT YearID, FirstDay, LastDay
		FROM Terms
		WHERE IsYearRec = 1
		AND SchoolID = 0
	) YearRecord ON SYSDATE BETWEEN YearRecord.FirstDay AND YearRecord.LastDay
),SuffixCodesetID AS 
(       
    SELECT 
        CS.CodesetID AS CS_CodesetID,
        CS.CodeType AS CS_CodeType,
        CS.Code AS CS_Code, 
        CS.DisplayValue AS CS_DisplayValue
    FROM Codeset CS
    WHERE CS.CodeType = 'Suffix'
        AND CS.IsVisible = '1'
        AND SYSDATE BETWEEN NVL(CS.EffectiveStartDate, SYSDATE) AND NVL(CS.EffectiveEndDate, SYSDATE)
),ContactStudentAssoc AS 
(
	SELECT 
		SCA.PersonID AS SCA_PersonID,
		PER.ID AS PER_ID,
		PER.DCID AS PER_DCID,
		PER.FirstName AS PER_FirstName,
		PER.MiddleName AS PER_MiddleName,
		PER.LastName AS PER_LastName,
		SUFFX.CS_Code AS PER_Suffix,
		((CASE WHEN PER.FirstName IS NOT NULL THEN PER.FirstName || ' ' ELSE NULL END) 
			|| (CASE WHEN PER.MiddleName IS NOT NULL THEN PER.MiddleName || ' ' ELSE NULL END) 
			|| (CASE WHEN PER.LastName IS NOT NULL THEN PER.LastName || ' ' ELSE NULL END) 
			|| SUFFX.CS_Code 
		) AS Contact,
		S.DCID AS S_DCID,
		S.Student_Number,
		S.LastFirst AS S_LastFirst,
		PEAA.PersonID AS PEAA_PersonID,
		EMA.EmailAddressID AS EMA_EmailAddressID,
		EMA.EmailAddress AS EMA_EmailAddress,
		S.SchoolID,
		S.EntryDate,
		S.ExitDate,
		PER.IsActive,
		SCD.StartDate,
		SCD.EndDate,
		S.Enroll_Status,
		StudentCheck.Person_ID,
		G.GuardianID,G.AccountIdentifier,G.LastName,G.FirstName,G.MiddleName,GPA.PersonID,
		PA.PCAS_AccountID,PA.UserName,PA.ISEnabled,PEC.PCAS_EmailContactID,PEC.EmailAddress PCAS_Email,
		(CASE WHEN EMA.EmailAddress IS NULL THEN UPPER(PEC.EmailAddress) 
			ELSE UPPER(EMA.EmailAddress) 
		END) CompareEmail
	FROM Person PER
		LEFT JOIN StudentContactAssoc SCA ON SCA.PersonID = PER.ID
		LEFT JOIN Students S ON S.DCID = SCA.StudentDCID
		LEFT JOIN Students StudentCheck ON StudentCheck.Person_ID = PER.ID
		LEFT JOIN StudentContactDetail SCD ON SCD.StudentContactAssocID = SCA.StudentContactAssocID
		LEFT JOIN PersonEmailAddressAssoc PEAA ON PEAA.PersonID = PER.ID
		LEFT JOIN EmailAddress EMA ON EMA.EmailAddressID = PEAA.EmailAddressID
		LEFT JOIN SuffixCodesetID SUFFX ON SUFFX.CS_CodeSetID = PER.SuffixCodeSetID
		LEFT JOIN GuardianPersonAssoc GPA ON GPA.PersonID = PER.ID
		LEFT JOIN Guardian G ON G.GuardianID = GPA.GuardianID
		LEFT JOIN PCAS_Account PA ON PA.PCAS_AccountToken = G.AccountIdentifier
		LEFT JOIN PCAS_EmailContact PEC ON PEC.PCAS_AccountID = PA.PCAS_AccountID 
	WHERE TRIM(PER.FirstName||PER.MiddleName||PER.LastName) IS NOT NULL
	AND (EMA.EmailAddress IS NOT NULL
		OR PEC.EmailAddress IS NOT NULL
	)
	AND StudentCheck.Person_ID IS NULL
),EmailDupCounts AS 
(
	SELECT CompareEmail,COUNT(*) TotalEmailCount
	FROM 
	(
		SELECT DISTINCT PER_ID,CompareEmail
		FROM ContactStudentAssoc
	)
	GROUP BY CompareEmail
),ActiveContactsPerEmail AS
(
	SELECT CompareEmail,COUNT(*) TotalActiveContacts
	FROM 
	(
		SELECT DISTINCT CompareEmail,PER_ID
		FROM ContactStudentAssoc
		WHERE IsActive = 1
	)
	GROUP BY CompareEmail
),InActiveContactsPerEmail AS
(
	SELECT CompareEmail,COUNT(*) TotalInActiveContacts
	FROM 
	(
		SELECT DISTINCT CompareEmail,PER_ID
		FROM ContactStudentAssoc
		WHERE NVL(IsActive,0) <> 1
	)
	GROUP BY CompareEmail
),ActiveStudentsSchoolList AS
(
	SELECT CompareEmail,LISTAGG(SchoolID,'~' ON OVERFLOW TRUNCATE) WITHIN GROUP (ORDER BY CompareEmail) AS ActiveStudentsSchoolList
	FROM 
	(
		SELECT DISTINCT CompareEmail,SchoolID
		FROM ContactStudentAssoc
		WHERE Enroll_Status = 0
	)
	GROUP BY CompareEmail
),DistinctContactsPerEmail AS 
(
	SELECT CompareEmail,LISTAGG(Contact||' ('||ContactNameCount||')','~' ON OVERFLOW TRUNCATE) WITHIN GROUP (ORDER BY CompareEmail) AS ContactList
	FROM 
	(
		SELECT CompareEmail,Contact,COUNT(*) AS ContactNameCount
		FROM 
		(
			SELECT DISTINCT CompareEmail,PER_ID,Contact
			FROM ContactStudentAssoc
		)
		GROUP BY CompareEmail,Contact
	)
	GROUP BY CompareEmail
),DistinctEmailPerEmail AS 
(
	SELECT CompareEmail,LISTAGG(CompareEmail||' ('||EmailAddressrCount||')','~' ON OVERFLOW TRUNCATE) WITHIN GROUP (ORDER BY CompareEmail) AS EmailCountList
	FROM 
	(
		SELECT CompareEmail,COUNT(*) AS EmailAddressrCount
		FROM 
		(
			SELECT DISTINCT CompareEmail,PER_ID
			FROM ContactStudentAssoc	
		)
		GROUP BY CompareEmail
	)
	GROUP BY CompareEmail
),ContactIDsList AS 
(
	SELECT CompareEmail,LISTAGG(Per_ID,',' ON OVERFLOW TRUNCATE) WITHIN GROUP (ORDER BY CompareEmail) AS ContactIDsList
	FROM 
	(
		SELECT DISTINCT CompareEmail,Per_ID
		FROM ContactStudentAssoc
	)
	GROUP BY CompareEmail
), WebAccessAccounts AS 
(
	SELECT G.GuardianID,G.AccountIdentifier,G.LastName,G.FirstName,G.MiddleName,GPA.PersonID,
		PA.PCAS_AccountID,PA.UserName,PA.ISEnabled,PEC.PCAS_EmailContactID,PEC.EmailAddress
	FROM Guardian G
		JOIN GuardianPersonAssoc GPA ON GPA.GuardianID = G.GuardianID
		JOIN PCAS_Account PA ON PA.PCAS_AccountToken = G.AccountIdentifier
		JOIN PCAS_EmailContact PEC ON PEC.PCAS_AccountID = PA.PCAS_AccountID 
)
SELECT DISTINCT CSA.CompareEmail,DCPE.ContactList,DEPE.EmailCountList,NVL(ACPE.TotalActiveContacts,0) AS TotalActiveContacts,
	NVL(IACPE.TotalInActiveContacts,0) AS TotalInActiveContacts,ASSL.ActiveStudentsSchoolList,CIDs.ContactIDsList
FROM ContactStudentAssoc CSA
	JOIN EmailDupCounts EDC ON EDC.CompareEmail = CSA.CompareEmail
		AND EDC.TotalEmailCount > 1
	JOIN WebAccessAccounts WAA ON UPPER(WAA.EmailAddress) = CSA.CompareEmail
	JOIN DistinctContactsPerEmail DCPE ON DCPE.CompareEmail = CSA.CompareEmail
	JOIN DistinctEmailPerEmail DEPE ON DEPE.CompareEmail = CSA.CompareEmail
	LEFT JOIN ActiveContactsPerEmail ACPE ON ACPE.CompareEmail = CSA.CompareEmail
	LEFT JOIN InActiveContactsPerEmail IACPE ON IACPE.CompareEmail = CSA.CompareEmail
	LEFT JOIN ActiveStudentsSchoolList ASSL ON ASSL.CompareEmail = CSA.CompareEmail
	LEFT JOIN ContactIDsList CIDs ON CIDs.CompareEmail = CSA.CompareEmail
--WHERE (TO_CHAR({SCHOOLID}) IN (SELECT REGEXP_SUBSTR(ASSL.ActiveStudentsSchoolList,''||chr(91)||'^~'||chr(93)||'+', 1, LEVEL) FROM Dual
--				CONNECT BY REGEXP_SUBSTR(ASSL.ActiveStudentsSchoolList,''||chr(91)||'^~'||chr(93)||'+', 1, LEVEL) IS NOT NULL)
--	OR (TO_CHAR({SCHOOLID}) = '%' AND ASSL.ActiveStudentsSchoolList IS NOT NULL)
--)
