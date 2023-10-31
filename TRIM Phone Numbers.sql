-- Check difference of TRIM
SELECT 
    s_sc_stu_contacts_x.cnt1_cphone, LENGTH(s_sc_stu_contacts_x.cnt1_cphone), TRIM(' ' FROM s_sc_stu_contacts_x.cnt1_cphone), LENGTH(TRIM(' ' FROM s_sc_stu_contacts_x.cnt1_cphone)),
    s_sc_stu_contacts_x.cnt2_cphone, TRIM (s_sc_stu_contacts_x.cnt2_cphone),
    s_sc_stu_contacts_x.cnt3_cphone, TRIM (s_sc_stu_contacts_x.cnt3_cphone),
    s_sc_stu_contacts_x.cnt4_cphone, TRIM (s_sc_stu_contacts_x.cnt4_cphone),
    s_sc_stu_contacts_x.cnt5_cphone, TRIM (s_sc_stu_contacts_x.cnt5_cphone),
    s_sc_stu_contacts_x.cnt6_cphone, TRIM (s_sc_stu_contacts_x.cnt6_cphone),
    s_sc_stu_contacts_x.cnt7_cphone, TRIM (s_sc_stu_contacts_x.cnt7_cphone),
    s_sc_stu_contacts_x.cnt8_cphone, TRIM (s_sc_stu_contacts_x.cnt8_cphone),
    s_sc_stu_contacts_x.cnt9_cphone, TRIM (s_sc_stu_contacts_x.cnt9_cphone),
    s_sc_stu_contacts_x.cnt10_cphone, TRIM (s_sc_stu_contacts_x.cnt10_cphone),
    s_sc_stu_contacts_x.cnt1_wphone ,  TRIM (s_sc_stu_contacts_x.cnt1_wphone),
    s_sc_stu_contacts_x.cnt2_wphone ,  TRIM (s_sc_stu_contacts_x.cnt2_wphone),
    s_sc_stu_contacts_x.cnt3_wphone ,  TRIM (s_sc_stu_contacts_x.cnt3_wphone),
    s_sc_stu_contacts_x.cnt4_wphone ,  TRIM (s_sc_stu_contacts_x.cnt4_wphone),
    s_sc_stu_contacts_x.cnt5_wphone ,  TRIM (s_sc_stu_contacts_x.cnt5_wphone),
    s_sc_stu_contacts_x.cnt6_wphone ,  TRIM (s_sc_stu_contacts_x.cnt6_wphone),
    s_sc_stu_contacts_x.cnt7_wphone ,  TRIM (s_sc_stu_contacts_x.cnt7_wphone),
    s_sc_stu_contacts_x.cnt8_wphone ,  TRIM (s_sc_stu_contacts_x.cnt8_wphone),
    s_sc_stu_contacts_x.cnt9_wphone ,  TRIM (s_sc_stu_contacts_x.cnt9_wphone),
    s_sc_stu_contacts_x.cnt10_wphone ,  TRIM (s_sc_stu_contacts_x.cnt10_wphone),
    s_sc_stu_contacts_x.cnt1_hphone ,  TRIM (s_sc_stu_contacts_x.cnt1_hphone),
    s_sc_stu_contacts_x.cnt2_hphone ,  TRIM (s_sc_stu_contacts_x.cnt2_hphone),
    s_sc_stu_contacts_x.cnt3_hphone ,  TRIM (s_sc_stu_contacts_x.cnt3_hphone),
    s_sc_stu_contacts_x.cnt4_hphone ,  TRIM (s_sc_stu_contacts_x.cnt4_hphone),
    s_sc_stu_contacts_x.cnt5_hphone ,  TRIM (s_sc_stu_contacts_x.cnt5_hphone),
    s_sc_stu_contacts_x.cnt6_hphone ,  TRIM (s_sc_stu_contacts_x.cnt6_hphone),
    s_sc_stu_contacts_x.cnt7_hphone ,  TRIM (s_sc_stu_contacts_x.cnt7_hphone),
    s_sc_stu_contacts_x.cnt8_hphone ,  TRIM (s_sc_stu_contacts_x.cnt8_hphone),
    s_sc_stu_contacts_x.cnt9_hphone ,  TRIM (s_sc_stu_contacts_x.cnt9_hphone),
    s_sc_stu_contacts_x.cnt10_hphone ,  TRIM (s_sc_stu_contacts_x.cnt10_hphone)
FROM s_sc_stu_contacts_x
WHERE studentsdcid in (select dcid from students where enroll_status = 0)
and (
s_sc_stu_contacts_x.cnt1_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt2_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt3_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt4_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt5_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt6_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt7_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt8_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt9_cphone not like '___-___-____'
OR s_sc_stu_contacts_x.cnt10_cphone not like '___-___-____'
)
;
-- UPDATE Cell Phone
UPDATE s_sc_stu_contacts_x
SET
    s_sc_stu_contacts_x.cnt1_cphone = TRIM (s_sc_stu_contacts_x.cnt1_cphone),
    s_sc_stu_contacts_x.cnt2_cphone = TRIM (s_sc_stu_contacts_x.cnt2_cphone),
    s_sc_stu_contacts_x.cnt3_cphone = TRIM (s_sc_stu_contacts_x.cnt3_cphone),
    s_sc_stu_contacts_x.cnt4_cphone = TRIM (s_sc_stu_contacts_x.cnt4_cphone),
    s_sc_stu_contacts_x.cnt5_cphone = TRIM (s_sc_stu_contacts_x.cnt5_cphone),
    s_sc_stu_contacts_x.cnt6_cphone = TRIM (s_sc_stu_contacts_x.cnt6_cphone),
    s_sc_stu_contacts_x.cnt7_cphone = TRIM (s_sc_stu_contacts_x.cnt7_cphone),
    s_sc_stu_contacts_x.cnt8_cphone = TRIM (s_sc_stu_contacts_x.cnt8_cphone),
    s_sc_stu_contacts_x.cnt9_cphone = TRIM (s_sc_stu_contacts_x.cnt9_cphone),
    s_sc_stu_contacts_x.cnt10_cphone = TRIM (s_sc_stu_contacts_x.cnt10_cphone)
;
---- UPDATE Work Phone
UPDATE s_sc_stu_contacts_x
SET
    s_sc_stu_contacts_x.cnt1_wphone = TRIM (s_sc_stu_contacts_x.cnt1_wphone),
    s_sc_stu_contacts_x.cnt2_wphone = TRIM (s_sc_stu_contacts_x.cnt2_wphone),
    s_sc_stu_contacts_x.cnt3_wphone = TRIM (s_sc_stu_contacts_x.cnt3_wphone),
    s_sc_stu_contacts_x.cnt4_wphone = TRIM (s_sc_stu_contacts_x.cnt4_wphone),
    s_sc_stu_contacts_x.cnt5_wphone = TRIM (s_sc_stu_contacts_x.cnt5_wphone),
    s_sc_stu_contacts_x.cnt6_wphone = TRIM (s_sc_stu_contacts_x.cnt6_wphone),
    s_sc_stu_contacts_x.cnt7_wphone = TRIM (s_sc_stu_contacts_x.cnt7_wphone),
    s_sc_stu_contacts_x.cnt8_wphone = TRIM (s_sc_stu_contacts_x.cnt8_wphone),
    s_sc_stu_contacts_x.cnt9_wphone = TRIM (s_sc_stu_contacts_x.cnt9_wphone),
    s_sc_stu_contacts_x.cnt10_wphone = TRIM (s_sc_stu_contacts_x.cnt10_wphone)
;
-- UPDATE Home Phone
UPDATE s_sc_stu_contacts_x
SET
	s_sc_stu_contacts_x.cnt1_hphone = TRIM (s_sc_stu_contacts_x.cnt1_hphone),
    s_sc_stu_contacts_x.cnt2_hphone = TRIM (s_sc_stu_contacts_x.cnt2_hphone),
    s_sc_stu_contacts_x.cnt3_hphone = TRIM (s_sc_stu_contacts_x.cnt3_hphone),
    s_sc_stu_contacts_x.cnt4_hphone = TRIM (s_sc_stu_contacts_x.cnt4_hphone),
    s_sc_stu_contacts_x.cnt5_hphone = TRIM (s_sc_stu_contacts_x.cnt5_hphone),
    s_sc_stu_contacts_x.cnt6_hphone = TRIM (s_sc_stu_contacts_x.cnt6_hphone),
    s_sc_stu_contacts_x.cnt7_hphone = TRIM (s_sc_stu_contacts_x.cnt7_hphone),
    s_sc_stu_contacts_x.cnt8_hphone = TRIM (s_sc_stu_contacts_x.cnt8_hphone),
    s_sc_stu_contacts_x.cnt9_hphone = TRIM (s_sc_stu_contacts_x.cnt9_hphone),
    s_sc_stu_contacts_x.cnt10_hphone = TRIM (s_sc_stu_contacts_x.cnt10_hphone)
    
    ;
select 
    (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as "School", 
    to_char(students.STUDENT_NUMBER), 
    students.LASTFIRST, 'Contact 1 Cell' as "Error Location", 
    s_sc_stu_contacts_x.cnt1_cphone, 
    REGEXP_REPLACE(s_sc_stu_contacts_x.cnt1_cphone,'(^[[:space:]]*|[[:space:]]*$)'), 
    cnt1_lname || ', ' || cnt1_fname, 
    LENGTH(s_sc_stu_contacts_x.cnt1_cphone) as "Length"
from  students 
inner join s_sc_stu_contacts_x on students.dcid = s_sc_stu_contacts_x.studentsdcid 
where s_sc_stu_contacts_x.cnt1_cphone not like '___-___-____' and schoolid not in (999999, 43) and grade_level <> 13 and Enroll_Status = 0 order by 1, 3;

-- UPDATE to remove whitespace before or after -- cell phone
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt1_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt1_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt2_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt2_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt3_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt3_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt4_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt4_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt5_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt5_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt6_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt6_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt7_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt7_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt8_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt8_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt9_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt9_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_cphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt10_cphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt10_cphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 

-- UPDATE to remove whitespace before or after -- work phone
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt1_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt1_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt2_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt2_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt3_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt3_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt4_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt4_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt5_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt5_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt6_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt6_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt7_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt7_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt8_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt8_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt9_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt9_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_wphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt10_wphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt10_wphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 

-- UPDATE to remove whitespace before or after -- home phone
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt1_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt1_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt2_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt2_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt3_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt3_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt4_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt4_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt5_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt5_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt6_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt6_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt7_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt7_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt8_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt8_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt9_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt9_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_hphone =  REGEXP_REPLACE(s_sc_stu_contacts_x.cnt10_hphone,'(^[[:space:]]*|[[:space:]]*$)') WHERE s_sc_stu_contacts_x.cnt10_hphone not like '___-___-____'  AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0); 

--Replace -- home phone .
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_hphone = REPLACE(s_sc_stu_contacts_x.cnt1_hphone,'.') WHERE s_sc_stu_contacts_x.cnt1_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_hphone = REPLACE(s_sc_stu_contacts_x.cnt2_hphone,'.') WHERE s_sc_stu_contacts_x.cnt2_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_hphone = REPLACE(s_sc_stu_contacts_x.cnt3_hphone,'.') WHERE s_sc_stu_contacts_x.cnt3_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_hphone = REPLACE(s_sc_stu_contacts_x.cnt4_hphone,'.') WHERE s_sc_stu_contacts_x.cnt4_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_hphone = REPLACE(s_sc_stu_contacts_x.cnt5_hphone,'.') WHERE s_sc_stu_contacts_x.cnt5_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_hphone = REPLACE(s_sc_stu_contacts_x.cnt6_hphone,'.') WHERE s_sc_stu_contacts_x.cnt6_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_hphone = REPLACE(s_sc_stu_contacts_x.cnt7_hphone,'.') WHERE s_sc_stu_contacts_x.cnt7_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_hphone = REPLACE(s_sc_stu_contacts_x.cnt8_hphone,'.') WHERE s_sc_stu_contacts_x.cnt8_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_hphone = REPLACE(s_sc_stu_contacts_x.cnt9_hphone,'.') WHERE s_sc_stu_contacts_x.cnt9_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_hphone = REPLACE(s_sc_stu_contacts_x.cnt10_hphone,'.') WHERE s_sc_stu_contacts_x.cnt10_hphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- home phone (
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_hphone = REPLACE(s_sc_stu_contacts_x.cnt1_hphone,'(') WHERE s_sc_stu_contacts_x.cnt1_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_hphone = REPLACE(s_sc_stu_contacts_x.cnt2_hphone,'(') WHERE s_sc_stu_contacts_x.cnt2_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_hphone = REPLACE(s_sc_stu_contacts_x.cnt3_hphone,'(') WHERE s_sc_stu_contacts_x.cnt3_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_hphone = REPLACE(s_sc_stu_contacts_x.cnt4_hphone,'(') WHERE s_sc_stu_contacts_x.cnt4_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_hphone = REPLACE(s_sc_stu_contacts_x.cnt5_hphone,'(') WHERE s_sc_stu_contacts_x.cnt5_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_hphone = REPLACE(s_sc_stu_contacts_x.cnt6_hphone,'(') WHERE s_sc_stu_contacts_x.cnt6_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_hphone = REPLACE(s_sc_stu_contacts_x.cnt7_hphone,'(') WHERE s_sc_stu_contacts_x.cnt7_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_hphone = REPLACE(s_sc_stu_contacts_x.cnt8_hphone,'(') WHERE s_sc_stu_contacts_x.cnt8_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_hphone = REPLACE(s_sc_stu_contacts_x.cnt9_hphone,'(') WHERE s_sc_stu_contacts_x.cnt9_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_hphone = REPLACE(s_sc_stu_contacts_x.cnt10_hphone,'(') WHERE s_sc_stu_contacts_x.cnt10_hphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- home phone )
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_hphone = REPLACE(s_sc_stu_contacts_x.cnt1_hphone,')') WHERE s_sc_stu_contacts_x.cnt1_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_hphone = REPLACE(s_sc_stu_contacts_x.cnt2_hphone,')') WHERE s_sc_stu_contacts_x.cnt2_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_hphone = REPLACE(s_sc_stu_contacts_x.cnt3_hphone,')') WHERE s_sc_stu_contacts_x.cnt3_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_hphone = REPLACE(s_sc_stu_contacts_x.cnt4_hphone,')') WHERE s_sc_stu_contacts_x.cnt4_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_hphone = REPLACE(s_sc_stu_contacts_x.cnt5_hphone,')') WHERE s_sc_stu_contacts_x.cnt5_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_hphone = REPLACE(s_sc_stu_contacts_x.cnt6_hphone,')') WHERE s_sc_stu_contacts_x.cnt6_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_hphone = REPLACE(s_sc_stu_contacts_x.cnt7_hphone,')') WHERE s_sc_stu_contacts_x.cnt7_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_hphone = REPLACE(s_sc_stu_contacts_x.cnt8_hphone,')') WHERE s_sc_stu_contacts_x.cnt8_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_hphone = REPLACE(s_sc_stu_contacts_x.cnt9_hphone,')') WHERE s_sc_stu_contacts_x.cnt9_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_hphone = REPLACE(s_sc_stu_contacts_x.cnt10_hphone,')') WHERE s_sc_stu_contacts_x.cnt10_hphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- cell phone .
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_cphone = REPLACE(s_sc_stu_contacts_x.cnt1_cphone,'.') WHERE s_sc_stu_contacts_x.cnt1_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_cphone = REPLACE(s_sc_stu_contacts_x.cnt2_cphone,'.') WHERE s_sc_stu_contacts_x.cnt2_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_cphone = REPLACE(s_sc_stu_contacts_x.cnt3_cphone,'.') WHERE s_sc_stu_contacts_x.cnt3_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_cphone = REPLACE(s_sc_stu_contacts_x.cnt4_cphone,'.') WHERE s_sc_stu_contacts_x.cnt4_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_cphone = REPLACE(s_sc_stu_contacts_x.cnt5_cphone,'.') WHERE s_sc_stu_contacts_x.cnt5_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_cphone = REPLACE(s_sc_stu_contacts_x.cnt6_cphone,'.') WHERE s_sc_stu_contacts_x.cnt6_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_cphone = REPLACE(s_sc_stu_contacts_x.cnt7_cphone,'.') WHERE s_sc_stu_contacts_x.cnt7_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_cphone = REPLACE(s_sc_stu_contacts_x.cnt8_cphone,'.') WHERE s_sc_stu_contacts_x.cnt8_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_cphone = REPLACE(s_sc_stu_contacts_x.cnt9_cphone,'.') WHERE s_sc_stu_contacts_x.cnt9_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_cphone = REPLACE(s_sc_stu_contacts_x.cnt10_cphone,'.') WHERE s_sc_stu_contacts_x.cnt10_cphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- cell phone (
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_cphone = REPLACE(s_sc_stu_contacts_x.cnt1_cphone,'(') WHERE s_sc_stu_contacts_x.cnt1_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_cphone = REPLACE(s_sc_stu_contacts_x.cnt2_cphone,'(') WHERE s_sc_stu_contacts_x.cnt2_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_cphone = REPLACE(s_sc_stu_contacts_x.cnt3_cphone,'(') WHERE s_sc_stu_contacts_x.cnt3_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_cphone = REPLACE(s_sc_stu_contacts_x.cnt4_cphone,'(') WHERE s_sc_stu_contacts_x.cnt4_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_cphone = REPLACE(s_sc_stu_contacts_x.cnt5_cphone,'(') WHERE s_sc_stu_contacts_x.cnt5_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_cphone = REPLACE(s_sc_stu_contacts_x.cnt6_cphone,'(') WHERE s_sc_stu_contacts_x.cnt6_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_cphone = REPLACE(s_sc_stu_contacts_x.cnt7_cphone,'(') WHERE s_sc_stu_contacts_x.cnt7_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_cphone = REPLACE(s_sc_stu_contacts_x.cnt8_cphone,'(') WHERE s_sc_stu_contacts_x.cnt8_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_cphone = REPLACE(s_sc_stu_contacts_x.cnt9_cphone,'(') WHERE s_sc_stu_contacts_x.cnt9_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_cphone = REPLACE(s_sc_stu_contacts_x.cnt10_cphone,'(') WHERE s_sc_stu_contacts_x.cnt10_cphone LIKE '%(%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- cell phone )
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_cphone = REPLACE(s_sc_stu_contacts_x.cnt1_cphone,')') WHERE s_sc_stu_contacts_x.cnt1_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_cphone = REPLACE(s_sc_stu_contacts_x.cnt2_cphone,')') WHERE s_sc_stu_contacts_x.cnt2_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_cphone = REPLACE(s_sc_stu_contacts_x.cnt3_cphone,')') WHERE s_sc_stu_contacts_x.cnt3_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_cphone = REPLACE(s_sc_stu_contacts_x.cnt4_cphone,')') WHERE s_sc_stu_contacts_x.cnt4_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_cphone = REPLACE(s_sc_stu_contacts_x.cnt5_cphone,')') WHERE s_sc_stu_contacts_x.cnt5_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_cphone = REPLACE(s_sc_stu_contacts_x.cnt6_cphone,')') WHERE s_sc_stu_contacts_x.cnt6_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_cphone = REPLACE(s_sc_stu_contacts_x.cnt7_cphone,')') WHERE s_sc_stu_contacts_x.cnt7_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_cphone = REPLACE(s_sc_stu_contacts_x.cnt8_cphone,')') WHERE s_sc_stu_contacts_x.cnt8_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_cphone = REPLACE(s_sc_stu_contacts_x.cnt9_cphone,')') WHERE s_sc_stu_contacts_x.cnt9_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_cphone = REPLACE(s_sc_stu_contacts_x.cnt10_cphone,')') WHERE s_sc_stu_contacts_x.cnt10_cphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

--Replace -- work phone .
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_wphone = REPLACE(s_sc_stu_contacts_x.cnt1_wphone,'.') WHERE s_sc_stu_contacts_x.cnt1_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_wphone = REPLACE(s_sc_stu_contacts_x.cnt2_wphone,'.') WHERE s_sc_stu_contacts_x.cnt2_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_wphone = REPLACE(s_sc_stu_contacts_x.cnt3_wphone,'.') WHERE s_sc_stu_contacts_x.cnt3_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_wphone = REPLACE(s_sc_stu_contacts_x.cnt4_wphone,'.') WHERE s_sc_stu_contacts_x.cnt4_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_wphone = REPLACE(s_sc_stu_contacts_x.cnt5_wphone,'.') WHERE s_sc_stu_contacts_x.cnt5_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_wphone = REPLACE(s_sc_stu_contacts_x.cnt6_wphone,'.') WHERE s_sc_stu_contacts_x.cnt6_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_wphone = REPLACE(s_sc_stu_contacts_x.cnt7_wphone,'.') WHERE s_sc_stu_contacts_x.cnt7_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_wphone = REPLACE(s_sc_stu_contacts_x.cnt8_wphone,'.') WHERE s_sc_stu_contacts_x.cnt8_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_wphone = REPLACE(s_sc_stu_contacts_x.cnt9_wphone,'.') WHERE s_sc_stu_contacts_x.cnt9_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_wphone = REPLACE(s_sc_stu_contacts_x.cnt10_wphone,'.') WHERE s_sc_stu_contacts_x.cnt10_wphone LIKE '%.%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

/*--Replace -- work phone (
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_wphone = REPLACE(s_sc_stu_contacts_x.cnt1_wphone,'(') WHERE s_sc_stu_contacts_x.cnt1_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_wphone = REPLACE(s_sc_stu_contacts_x.cnt2_wphone,'(') WHERE s_sc_stu_contacts_x.cnt2_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_wphone = REPLACE(s_sc_stu_contacts_x.cnt3_wphone,'(') WHERE s_sc_stu_contacts_x.cnt3_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_wphone = REPLACE(s_sc_stu_contacts_x.cnt4_wphone,'(') WHERE s_sc_stu_contacts_x.cnt4_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_wphone = REPLACE(s_sc_stu_contacts_x.cnt5_wphone,'(') WHERE s_sc_stu_contacts_x.cnt5_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_wphone = REPLACE(s_sc_stu_contacts_x.cnt6_wphone,'(') WHERE s_sc_stu_contacts_x.cnt6_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_wphone = REPLACE(s_sc_stu_contacts_x.cnt7_wphone,'(') WHERE s_sc_stu_contacts_x.cnt7_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_wphone = REPLACE(s_sc_stu_contacts_x.cnt8_wphone,'(') WHERE s_sc_stu_contacts_x.cnt8_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_wphone = REPLACE(s_sc_stu_contacts_x.cnt9_wphone,'(') WHERE s_sc_stu_contacts_x.cnt9_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_wphone = REPLACE(s_sc_stu_contacts_x.cnt10_wphone,'(') WHERE s_sc_stu_contacts_x.cnt10_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);

Replace -- work phone )
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt1_wphone = REPLACE(s_sc_stu_contacts_x.cnt1_wphone,')') WHERE s_sc_stu_contacts_x.cnt1_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt2_wphone = REPLACE(s_sc_stu_contacts_x.cnt2_wphone,')') WHERE s_sc_stu_contacts_x.cnt2_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt3_wphone = REPLACE(s_sc_stu_contacts_x.cnt3_wphone,')') WHERE s_sc_stu_contacts_x.cnt3_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt4_wphone = REPLACE(s_sc_stu_contacts_x.cnt4_wphone,')') WHERE s_sc_stu_contacts_x.cnt4_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt5_wphone = REPLACE(s_sc_stu_contacts_x.cnt5_wphone,')') WHERE s_sc_stu_contacts_x.cnt5_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt6_wphone = REPLACE(s_sc_stu_contacts_x.cnt6_wphone,')') WHERE s_sc_stu_contacts_x.cnt6_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt7_wphone = REPLACE(s_sc_stu_contacts_x.cnt7_wphone,')') WHERE s_sc_stu_contacts_x.cnt7_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt8_wphone = REPLACE(s_sc_stu_contacts_x.cnt8_wphone,')') WHERE s_sc_stu_contacts_x.cnt8_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt9_wphone = REPLACE(s_sc_stu_contacts_x.cnt9_wphone,')') WHERE s_sc_stu_contacts_x.cnt9_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);
UPDATE s_sc_stu_contacts_x SET s_sc_stu_contacts_x.cnt10_wphone = REPLACE(s_sc_stu_contacts_x.cnt10_wphone,')') WHERE s_sc_stu_contacts_x.cnt10_wphone LIKE '%)%' AND studentsdcid in (select dcid from students where students.dcid = s_sc_stu_contacts_x.studentsdcid AND enroll_status = 0);*/

---- UPDATE Work Phone
UPDATE s_sc_stu_contacts_x
SET
    s_sc_stu_contacts_x.cnt1_wphone = TRIM (s_sc_stu_contacts_x.cnt1_wphone),
    s_sc_stu_contacts_x.cnt2_wphone = TRIM (s_sc_stu_contacts_x.cnt2_wphone),
    s_sc_stu_contacts_x.cnt3_wphone = TRIM (s_sc_stu_contacts_x.cnt3_wphone),
    s_sc_stu_contacts_x.cnt4_wphone = TRIM (s_sc_stu_contacts_x.cnt4_wphone),
    s_sc_stu_contacts_x.cnt5_wphone = TRIM (s_sc_stu_contacts_x.cnt5_wphone),
    s_sc_stu_contacts_x.cnt6_wphone = TRIM (s_sc_stu_contacts_x.cnt6_wphone),
    s_sc_stu_contacts_x.cnt7_wphone = TRIM (s_sc_stu_contacts_x.cnt7_wphone),
    s_sc_stu_contacts_x.cnt8_wphone = TRIM (s_sc_stu_contacts_x.cnt8_wphone),
    s_sc_stu_contacts_x.cnt9_wphone = TRIM (s_sc_stu_contacts_x.cnt9_wphone),
    s_sc_stu_contacts_x.cnt10_wphone = TRIM (s_sc_stu_contacts_x.cnt10_wphone)
;
SELECT last_name, length(last_name), REGEXP_REPLACE(last_name,'(^[[:space:]]*|[[:space:]]*$)'), length(REGEXP_REPLACE(last_name,'(^[[:space:]]*|[[:space:]]*$)'))
FROM students
where student_number = '78924'
