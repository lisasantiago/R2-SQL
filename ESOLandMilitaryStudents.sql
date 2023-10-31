--Count of ESOL students
SELECT 
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,
   COUNT(*) as "ESOL"
FROM S_SC_STU_X, STUDENTS
WHERE s_sc_stu_x.studentsdcid =  students.dcid
    AND engl_prof NOT IN ('8','9')
    AND students.schoolid NOT IN ('43','999999') 
    AND students.grade_level < 13
    AND enroll_status = 0
GROUP BY ROLLUP (schoolid)
ORDER BY COUNT(*) desc
;
--Count of Hispanic students
SELECT
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,
COUNT(*) as "Hispanic"
FROM
students
WHERE fedethnicity = '1'
    AND students.schoolid NOT IN ('43','999999') 
    AND students.grade_level < 13
    AND enroll_status = 0
GROUP BY ROLLUP (schoolid)
ORDER BY COUNT(*) desc
;
--Count of Spanish speaking students
SELECT 
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,
   COUNT(*) as "Spanish Speakers"
FROM studentcorefields, STUDENTS
WHERE studentcorefields.studentsdcid =  students.dcid
    AND StudentCoreFields.primarylanguage = 'SPN'
    AND students.schoolid NOT IN ('43','999999') 
    AND students.grade_level < 13
    AND enroll_status = 0
GROUP BY ROLLUP (schoolid)
ORDER BY COUNT(*) desc
;
--Count of ESOL/Military students
SELECT 
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,
   COUNT(*) as "ESOL/Military"
FROM S_SC_STU_X, STUDENTS
WHERE s_sc_stu_x.studentsdcid =  students.dcid
    AND engl_prof NOT IN ('8','9')
    AND s_sc_stu_x.parentsmilitarystatus is not null
    AND students.schoolid NOT IN ('43','999999') 
    AND students.grade_level < 13
    AND enroll_status = 0
GROUP BY ROLLUP (schoolid)
ORDER BY COUNT(*) desc
;