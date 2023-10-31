WITH Contacts as 
(select
    sca.studentdcid,
    sca.contactpriorityorder,
    (select code from codeset cs where cs.codesetid = sca.currreltypecodesetid) contact_type,
    (select code from codeset cs where cs.codesetid = per.prefixcodesetid) prefix,
    per.firstname,
    per.middlename,
    per.lastname,
    (select code from codeset cs where cs.codesetid = per.suffixcodesetid) suffix,
    pea.emailaddress,
    substr(phn.phonenumber,1,3) || '-' || substr(phn.phonenumber,4,3) || '-' || substr(phn.phonenumber,7,4) phone,
    phn.phonenumberext,
    (select code from codeset cs where cs.codesetid = phn.phonetypecodesetid) phone_type,
    iscustodial,
    isemergency,
    liveswithflg,
    schoolpickupflg,
    receivesmailflg,
    ocm.originalcontacttype
  from person per
  join studentcontactassoc sca 
    on per.id = sca.personid
  join studentcontactdetail scd
    on sca.studentcontactassocid = scd.studentcontactassocid
  left join (
    select
      personid,
      emailaddress
    from personemailaddressassoc pa 
    join emailaddress ema 
      on ema.emailaddressid = pa.emailaddressid
    where isprimaryemailaddress = 1
  ) pea  
    on per.id = pea.personid
  left join(
    select 
      personid,
      phonenumber,
      phonetypecodesetid,
      phonenumberext
    from personphonenumberassoc ppa
    join phonenumber ph 
    on ph.phonenumberid = ppa.phonenumberid
    where ispreferred = 1
  ) phn
    on per.id = phn.personid
  full join originalcontactmap ocm 
    on sca.studentcontactassocid = ocm.studentcontactassocid
  where per.isactive = 1
  and scd.isactive = 1
  AND iscustodial = 1
  AND liveswithflg = 1
  AND emailaddress is not null
)
--SELECT * FROM contacts;
SELECT 
  s.DCID,
  (SELECT ABBREVIATION FROM SCHOOLS WHERE SCHOOL_NUMBER=s.SCHOOLID) school,
  s.STUDENT_NUMBER,
  s.LASTFIRST,
  s.GRADE_LEVEL,
  TO_CHAR(s.DOB,'MM/DD/YY') dob,
  DECODE(IMMUNE_STATUS,NULL,'N/A',IMMUNE_STATUS) immune_status,
  DECODE(DPT,NULL,'N/A',IMMUNE_STATUS) DPT_status,
  firstname ||' ' || lastname || ' '||'('||contact_type||')',
  emailaddress
FROM Contacts
RIGHT JOIN students S on s.dcid =contacts.studentdcid
LEFT JOIN S_SC_STU_MED_IMM_X I
  ON S.DCID = I.STUDENTSDCID
Where Enroll_Status < 1
AND SCHOOLID =  70
--  DECODE(~(curSchoolID),0,SCHOOLID,
--    45,82,50,78,51,98,55,91,~(curSchoolID))
--ORDER BY schoolid, lastfirst
;
SELECT * FROM person