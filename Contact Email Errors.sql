select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as "School", to_char(students.STUDENT_NUMBER), students.LASTFIRST, 'Contact 1 Email' as "Error Location", s_sc_stu_contacts_x.cnt1_email, cnt1_lname || ', ' || cnt1_fname 
from  students inner join s_sc_stu_contacts_x on students.dcid = s_sc_stu_contacts_x.studentsdcid 
WHERE NOT REGEXP_LIKE (cnt1_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
and schoolid not in (999999, 43) and grade_level <> 13 and Enroll_Status = 0 order by 1, 3 ;

select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as "School", to_char(students.STUDENT_NUMBER), students.LASTFIRST, 'Contact 1 Email' as "Error Location", s_sc_stu_contacts_x.cnt1_email, cnt1_lname || ', ' || cnt1_fname 
from  students inner join s_sc_stu_contacts_x on students.dcid = s_sc_stu_contacts_x.studentsdcid 
WHERE NOT REGEXP_LIKE (TRIM(cnt1_email), '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
and schoolid not in (999999, 43) and grade_level <> 13 and Enroll_Status = 0 order by 1, 3 ;

UPDATE s_sc_stu_contacts_x
SET cnt1_email = TRIM(cnt1_email)
WHERE NOT REGEXP_LIKE (cnt1_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
;

select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER
) as "School", to_char(students.STUDENT_NUMBER), students.LASTFIRST, 'Contact 1 Email' as "Error Location", s_sc_stu_contacts_x.cnt10_email, cnt1_lname || ', ' || cnt1_fname 
from  students inner join s_sc_stu_contacts_x on students.dcid = s_sc_stu_contacts_x.studentsdcid 
WHERE NOT REGEXP_LIKE (cnt10_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
and schoolid not in (999999, 43) and grade_level <> 13 and Enroll_Status = 0 order by 1, 3 ;

UPDATE s_sc_stu_contacts_x
set cnt1_email = TRIM(BOTH(cnt1_email))
where studentsdcid in (select dcid from students where s_sc_stu_contacts_x.studentsdcid=students.dcid and students.enroll_status = 0);

SELECT
   students.dcid, 
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
   students.student_number, 
   CHR(60) || 'a href=/admin/students/state/usa_sc/SC_Student_Contacts.html?frn=' || '001' || DCID || ' target=_blank'  || CHR(62) || students.lastfirst || CHR(60) || '/a'  || CHR(62),
    CASE 
        WHEN s_sc_stu_contacts_x.cnt1_email not like '%@%'
            THEN 'Contact 1' 
        WHEN s_sc_stu_contacts_x.cnt2_email not like '%@%'
            THEN 'Contact 2'  
        WHEN s_sc_stu_contacts_x.cnt3_email not like '%@%'
            THEN 'Contact 3'  
        WHEN s_sc_stu_contacts_x.cnt4_email not like '%@%'
            THEN 'Contact 4'  
        WHEN s_sc_stu_contacts_x.cnt5_email not like '%@%'
            THEN 'Contact 5'  
        WHEN s_sc_stu_contacts_x.cnt6_email not like '%@%'
            THEN 'Contact 6'  
        WHEN s_sc_stu_contacts_x.cnt7_email not like '%@%'
            THEN 'Contact 7'  
        WHEN s_sc_stu_contacts_x.cnt8_email not like '%@%'
            THEN 'Contact 8'  
        WHEN s_sc_stu_contacts_x.cnt9_email not like '%@%'
            THEN 'Contact 9'  
        WHEN s_sc_stu_contacts_x.cnt10_email not like '%@%'
            THEN 'Contact 10' 
    END contact 
FROM s_sc_stu_contacts_x INNER JOIN students ON s_sc_stu_contacts_x.studentsdcid = students.dcid 
WHERE 
    CASE 
        WHEN s_sc_stu_contacts_x.cnt1_email not like '%@%'
            THEN 'Contact 1' 
        WHEN s_sc_stu_contacts_x.cnt2_email not like '%@%'
            THEN 'Contact 2'  
        WHEN s_sc_stu_contacts_x.cnt3_email not like '%@%'
            THEN 'Contact 3'  
        WHEN s_sc_stu_contacts_x.cnt4_email not like '%@%'
            THEN 'Contact 4'  
        WHEN s_sc_stu_contacts_x.cnt5_email not like '%@%'
            THEN 'Contact 5'  
        WHEN s_sc_stu_contacts_x.cnt6_email not like '%@%'
            THEN 'Contact 6'  
        WHEN s_sc_stu_contacts_x.cnt7_email not like '%@%'
            THEN 'Contact 7'  
        WHEN s_sc_stu_contacts_x.cnt8_email not like '%@%'
            THEN 'Contact 8'  
        WHEN s_sc_stu_contacts_x.cnt9_email not like '%@%'
            THEN 'Contact 9'  
        WHEN s_sc_stu_contacts_x.cnt10_email not like '%@%'
            THEN 'Contact 10' 
    END IS NOT NULL 
AND students.schoolid <> '999999' 
AND students.grade_level <> 13 AND students.enroll_status IN (0, -1)
AND students.SchoolID =
  Decode(~(curSchoolID),0,students.SCHOOLID,~(curSchoolID))
ORDER BY students.lastfirst
;
SELECT R_PREF_NAMEGEN from ps.u_studentsuserfields
where R_PREF_NAMEGEN is not null
;

