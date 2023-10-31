SELECT student_number, u_fis.* FROM u_fis 
JOIN students on u_fis.studentsdcid = students.dcid
WHERE schoolid = 92
ORDER BY whencreated desc;


--UPDATE RECORDS IMPORT
SELECT U_fis.id, studentsdcid, U_fis.whencreated, U_fis.whocreated, r_source FROM u_fis 
JOIN students on u_fis.studentsdcid = students.dcid
WHERE studentsdcid in (56599,89835,92731,131133,131644,139104,141109,146262,148144,148276,149316,150174,150533,150555,150641,151647,153151,158651,165820,175704,189001,193101,214015,216722,268805,274479,285847,285876,288803,293602,294705,311644,313443,313970,314264,314280,314402,324502,357153,369406,372206,376457,395954,405052,415452,451969,452735,466706,469079)
ORDER BY studentsdcid asc
;

select dcid, lastfirst from users
WHERE dcid in (81508,37652,7951,83052,44852,12551,5400,41302,6948)

;

SELECT 
  (select lastfirst from users where u_fis.R_source = users.dcid) source, whocreated, (SELECT lastfirst from users where u_fis.r_source = users.dcid)
--    R_SOURCE_PHN, R_SOURCE_POS
FROM u_fis 
ORDER BY whocreated desc;

UPDATE u_fis
SET whocreated = (SELECT lastfirst from users where u_fis.r_source = users.dcid)
WHERE whocreated is null
;

DELETE FROM U_FIS WHERE id IN ('13440812');


/*Referral Source*/
SELECT id, R_SOURCE_NAME, R_SOURCE_PHN, R_SOURCE_POS FROM u_fis order by whencreated asc;

/*Custodial Parent/Legal Guardian*/
SELECT id, R_GUARDIAN, R_GUARDIAN_EMAIL, R_GUARDIAN_PHN, R_GUARDIAN_REL FROM u_fis order by whencreated asc;

/*Language Preferences*/
SELECT R_LANG_GUARDIAN, R_LANG_STUDENT FROM u_fis order by whencreated asc;

/*Referral Details*/
SELECT R_REASON, R_TYPE, R_DESCRIPTION FROM u_fis order by whencreated asc;

/*Additional Student Information*/
SELECT R_MEDS, R_AGENCY, R_IEP, R_504, R_CSSRS, R_DIAGNOSIS, R_ADDL_INFO FROM u_fis order by whencreated asc;

SELECT dcid, id, cat, name FROM gen where cat = 'R_FIS_Reason';
SELECT dcid, id, cat, name FROM gen where cat = 'R_FIS_Type';

DELETE from u_fis where id != 13242022;

SELECT u_fis.r_reason FROM u_fis;



SELECT dcid FROM gen order by dcid desc;

INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49626', 'R_FIS_Type', 'BA', 'Blythewood Academy');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49627', 'R_FIS_Type', 'HB', 'Hearing Board/Strict Probation Referral');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49628', 'R_FIS_Type', 'INV', 'Intervention Referral');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49629', 'R_FIS_Type', 'HCPD', 'Healthy Choices Positive Decisions');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49630', 'R_FIS_Type', 'P2P', 'Pathways to Promotion');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49631', 'R_FIS_Type', 'VOL', 'Voluntary/LSS Referral');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('49632', 'R_FIS_Type', 'CPY', 'Continuing From Previous Year');

INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46256', 'R_FIS_Reason', 'MNTH', 'Mental Health Concerns');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46257', 'R_FIS_Reason', 'TRAU', 'Known History of Trauma');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46258', 'R_FIS_Reason', 'DVST', 'Developmental Stressors');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46259', 'R_FIS_Reason', 'FREL', 'Family Relationship Problems');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46260', 'R_FIS_Reason', 'SMGR', 'Small Group/Parenting Group');
INSERT INTO PS.GEN (DCID, CAT, NAME, VALUE) VALUES ('46261', 'R_FIS_Reason', 'CPY', 'Continuing From Previous Year');

SELECT * FROM gen where CAT = 'R_FIS_Reason';
SELECT * FROM gen where CAT = 'R_FIS_Type';

SELECT 
id, CASE WHEN id = '~([u_fis]R_FIS_Reason)' THEN 'selected' ELSE '' END, name  
FROM GEN 
WHERE CAT = 'R_FIS_Reason'
ORDER BY id
;
--Active Referrals
SELECT u_fis.id, u_fis.r_reason, r_type, (select abbreviation from schools where students.schoolid = schools.school_number) school, student_number, lastfirst, grade_level, r_intake, u_fis.r_service_start, u_fis.r_service_end  
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE u_fis.r_service_end is null AND u_fis.r_service_start is not null
ORDER BY u_fis.whencreated
;
--All Referrals Count
SELECT COUNT(*)-1
FROM u_fis
;
--Pending Intake
SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, student_number, lastfirst, grade_level, r_intake, u_fis.r_service_start, u_fis.r_service_end
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE u_fis.r_intake is null
ORDER BY u_fis.whencreated
;
--All Referrals
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated, 
    r_intake
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
ORDER BY u_fis.whencreated desc
;

--Pending Referrals 
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE r_intake is null and r_status is null
ORDER BY u_fis.whencreated desc
;

--Bilingual Referrals
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated, 
    r_intake,
    R_LANG_STUDENT, R_LANG_GUARDIAN
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE R_LANG_GUARDIAN != 'ENG' OR R_LANG_STUDENT != 'ENG'
ORDER BY u_fis.whencreated desc
;

--BWA Referrals
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated, 
    r_intake
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE r_type = 49724
ORDER BY u_fis.whencreated desc
;

--HB Referrals
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated, 
    r_intake
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE r_type = 49725
ORDER BY u_fis.whencreated desc
;

--All Referrals
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
   (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    whocreated, 
    r_intake
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
ORDER BY u_fis.whencreated desc
;

--Pending contact tab
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
    (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    (select lastfirst from users where u_fis.R_source = users.dcid), 
    r_intake,
    (select value from gen WHERE Gen.id = u_fis.R_status)
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE r_status in (49777,49799)
ORDER BY whencreated desc
;



SELECT u_fis.id, r_guardian, r_guardian_phn, r_guardian_email
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
;
SELECT lastfirst, spenrollments.* FROM spenrollments
JOIN students on spenrollments.studentid = students.id
WHERE programid = 1539 --AND sp_comment is not null
AND enter_date = '31-JUL-23'
;
SELECT '*Student Program Complete*', lastfirst, gen.name, spenrollments.enter_date
FROM spenrollments
JOIN students on spenrollments.studentid = students.id
JOIN Gen on spenrollments.programid = gen.id
WHERE programid = 1539
AND spenrollments.enter_date > '01-JUL-23'
;
SELECT '*Student Program Complete*', lastfirst, gen.name, spenrollments.enter_date
FROM spenrollments
JOIN students on spenrollments.studentid = students.id
JOIN Gen on spenrollments.programid = gen.id
WHERE programid = 1666
AND spenrollments.enter_date > '01-JUL-23'
;

--Previousl Years Student Programs
SELECT '*Student Program Complete*', lastfirst, gen.name, spenrollments.enter_date
FROM spenrollments
JOIN students on spenrollments.studentid = students.id
JOIN Gen on spenrollments.programid = gen.id
WHERE programid in (1666, 1539)
AND spenrollments.enter_date < '01-JUL-23'
;

SELECT spenrollments.enter_date, gen.name
                  FROM spenrollments
                  JOIN students on spenrollments.studentid = students.id
                  JOIN Gen on spenrollments.programid = gen.id
                  WHERE /*students.dcid = ~(studentrn)
                  AND*/ programid in (1539,1666)
                  AND spenrollments.enter_date < '01-JUL-23'
                  ORDER BY spenrollments.enter_date 
                  ;

SELECT spenrollments.enter_date, gen.name
            FROM spenrollments
            JOIN students on spenrollments.studentid = students.id
            JOIN Gen on spenrollments.programid = gen.id
            JOIN u_fis on u_fis.studentsdcid = students.dcid
            WHERE u_fis.id = ~(gpv.id)
            AND programid in (1539,1666)
            AND spenrollments.enter_date > '01-JUL-23'
            ORDER BY spenrollments.enter_date
;

SELECT * FROM spenrollments;
;

--Import of existing referrals
UPDATE u_fis
SET whencreated = '9-Aug-23 01.01.01.000000000'
WHERE 
studentsdcid in (131133,148144,150533,151647,216722,293602,294705,372206,395954,452735)
;

--Student Detail Header
SELECT 
    lastfirst, 
    student_number, 
    grade_level, 
    dob, 
    (select abbreviation from schools where students.schoolid = schools.school_number) school,  
    DECODE (enroll_status, -2, 'Inactive', -1, 'Pre-registered', 0, 'Active', 1, 'Inactive', 2, 'TransferredOut', 3, 'Graduated', 4, 'Imported') Enroll_Status
FROM students
JOIN u_fis on u_fis.studentsdcid = students.dcid
WHERE u_fis.studentsdcid = ~(studentrn)
;
SELECT CAST(whencreated as DATE) from u_fis
;
--PCG Note
SELECT 'Referral submitted by ' || 
(select lastfirst from users WHERE users.dcid = u_fis.r_source) || 
' (' || (SELECT value FROM GEN WHERE u_fis.r_source_pos = gen.id) || 
') at ' || 
(select abbreviation from schools where students.schoolid = schools.school_number)   ||
'. Referral reason:  ' ||
(select name from gen WHERE Gen.id = u_fis.R_reason) || ' - ' ||
R_DESCRIPTION
FROM u_fis 
JOIN students on u_fis.studentsdcid = students.dcid
--where r_description is null
;

SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
(select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    (select lastfirst from users where u_fis.R_source = users.dcid), 
    r_intake,
    R_LANG_STUDENT, R_LANG_GUARDIAN
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE R_LANG_GUARDIAN != 'ENG' OR R_LANG_STUDENT != 'ENG'
ORDER BY whencreated desc
;
SELECT id, r_contact, r_intake FROM u_fis WHERE R_contact is not null or r_intake is not null
;
SELECT 
    u_fis.id, u_fis.id, 
    whencreated entry, 
(select name from gen WHERE Gen.id = u_fis.R_type) type,
    (select name from gen WHERE Gen.id = u_fis.R_reason) reason,
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number stuid,
    lastfirst, 
    grade_level grade, 
    (select lastfirst from users where u_fis.R_source = users.dcid) source, 
    r_intake intake,
    R_LANG_STUDENT stuLang, R_LANG_GUARDIAN GuarLang
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE R_LANG_GUARDIAN != 'ENG' OR R_LANG_STUDENT != 'ENG'
ORDER BY whencreated desc
;

--Informed Consent Form
SELECT created_on, created_by ||'(' ||
DECODE(response_type,
                                        'G', 'Parent Portal',
                                        'A', 'PowerSchool') ||')'
FROM U_FB_FORM_RESPONSE
JOIN students on U_FB_FORM_RESPONSE.student_id = students.id
LEFT JOIN u_fis on students.dcid = u_fis.studentsdcid
WHERE U_FB_FORM_ID = 7731441
--AND student_id = 126873
ORDER BY created_on desc
;
SELECT U_FB_FORM_RESPONSE.* FROM U_FB_FORM_RESPONSE;

SELECT * FROM students
WHERE student_number = 20750
;
SELECT * FROM gen
WHERE cat = 'R_FIS_Status'
ORDER BY VALUE
;
select to_char ( order_datetime, 'dd Mon yyyy' ),  
       count (*)  
from   co.orders  
where  order_datetime >= date'2019-04-01'  
group  by to_char ( order_datetime, 'dd Mon yyyy' )
;
SELECT to_char(whencreated, 'mm/dd/yyyy'),
COUNT(*) 
                FROM u_fis
                GROUP BY  to_char(whencreated, 'mm/dd/yyyy')
                ORDER BY 1
;
SELECT 
                                u_fis.id, u_fis.id, 
                                whencreated, 
                                (select name from gen WHERE Gen.id = u_fis.R_type),
                                (select name from gen WHERE Gen.id = u_fis.R_reason),
                                (select abbreviation from schools where students.schoolid = schools.school_number) school,
                                student_number,
                                lastfirst, 
                                grade_level, 
                                (select lastfirst from users where u_fis.R_source = users.dcid), 
                                r_intake,
                                (select name from gen WHERE Gen.id = r_status)
                            FROM u_fis
                            JOIN students on u_fis.studentsdcid = students.dcid
;
--Referral type dropdown

SELECT id, value
FROM GEN
WHERE CAT = 'R_FIS_Type' AND (valuet not like '%Only' OR valuet is null) 
ORDER BY value
;
SELECT * FROM gen WHERE cat = 'R_FIS_Type';

--Referral Reason dropdown
SELECT id, value
FROM GEN
WHERE CAT = 'R_FIS_Reason' AND  name not like 'CPY'
ORDER BY value
;
SELECT * FROM gen WHERE cat = 'R_FIS_Reason';

--Status
SELECT * FROM gen WHERE cat = 'R_FIS_Status';
AND id in (49777,49799)
;

--Duplicate referral warning
SELECT DISTINCT studentsdcid, 'Please be mindful of entering a DUPLICATE REFERRAL if the student has a referral within the last 30 days.'
FROM u_fis
WHERE whencreated > sysdate - 35
;
u_fis.studentsdcid = ~(studentrn)
;
SELECT studentsdcid, COUNT(*)
FROM u_fis
GROUP BY studentsdcid
HAVING COUNT(*) > 1
;
SELECT sysdate - 35 FROM dual
;
--*****SQLReports

--Processing Steps
SELECT 
        u_fis.id, student_number, lastfirst,
        DECODE(R_STU_PROG,1,'Yes','No'),
        DECODE(R_PCG_NOTE_REF,1,'Yes','No'),
        DECODE(R_PCG_NOTE_CON,1,'Yes','No'),
        DECODE(R_FAM_CONT,1,'Yes','No'),
        DECODE(R_CONSENT,1,'Yes','No'),
        DECODE(R_SRC_NOTIFIED,1,'Yes','No')
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
where r_processed is not null
;
-- FIS Referrals Bar Chart
SELECT (select value from gen WHERE Gen.id = u_fis.R_type), COUNT(r_type) 
FROM u_fis
WHERE r_type is not null
GROUP BY (r_type)
ORDER BY r_type
;
--Referrals by status
SELECT 
        u_fis.id, student_number, lastfirst,
        (select value from gen WHERE Gen.id = u_fis.R_type),
        (select value from gen WHERE Gen.id = u_fis.R_reason),
        (select value from gen WHERE Gen.id = u_fis.R_status)
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
where r_processed is not null
;
--referrals processed
SELECT COUNT(*) 
FROM u_fis
GROUP BY (r_processed)
;
SELECT
    whencreated, 
    whocreated,
    (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason)
    FROM u_fis
    WHERE
    id = 13261573
--        u_fis.studentsdcid = ~(studentrn)
    ORDER by
        whencreated desc
;
--students with more than 1 referral
SELECT lastfirst, COUNT(*) 
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
GROUP BY (lastfirst)
HAVING COUNT(*) > 1
;
SELECT
student_number, lastfirst,
to_char(whencreated,'mm/dd/yyyy'), 
(SELECT lastfirst from users where u_fis.r_source = users.dcid),
(select name from gen WHERE Gen.id = u_fis.R_type),
(select name from gen WHERE Gen.id = u_fis.R_reason),
r_description
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid   
WHERE studentsdcid in (select studentsdcid from u_fis GROUP BY studentsdcid HAVING COUNT(studentsdcid) > 1)
ORDER by lastfirst
;
SELECT 
    u_fis.id, u_fis.id, 
    whencreated, 
    (select name from gen WHERE Gen.id = u_fis.R_type),
    (select name from gen WHERE Gen.id = u_fis.R_reason),
    (select abbreviation from schools where students.schoolid = schools.school_number) school,
    student_number,
    lastfirst, 
    grade_level, 
    (select lastfirst from users where u_fis.R_source = users.dcid), 
    r_intake,
    (select value from gen WHERE Gen.id = u_fis.R_status)
FROM u_fis
JOIN students on u_fis.studentsdcid = students.dcid
WHERE r_status in (49777,49799)
ORDER BY whencreated desc
;