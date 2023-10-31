SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), (select name from gen WHERE Gen.id = u_iepinfo.R_DIS1), students.ethnicity, gender, COUNT(*) 
FROM students
JOIN u_iepinfo on students.dcid = u_iepinfo.studentsdcid
WHERE u_iepinfo.r_svcend is null
GROUP BY ROLLUP (students.schoolid, u_iepinfo.r_dis1, students.ethnicity, gender)
ORDER BY 1, 2, 3
;
SELECT 
DECODE(GROUPING(schoolid),1,'All Schools', ((select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER))) AS School,
DECODE(GROUPING(u_iepinfo.R_DIS1), 1, 'School Total', ((select name from gen WHERE Gen.id = u_iepinfo.R_DIS1))) AS Disability,
DECODE(GROUPING(students.ethnicity),1,'',(students.ethnicity)) AS Ethnicity,
DECODE(GROUPING(gender), 1, 'Ethnicity Total', (gender)) AS Gender,
COUNT(*) 
FROM students
JOIN u_iepinfo on students.dcid = u_iepinfo.studentsdcid
WHERE u_iepinfo.r_svcend is null
GROUP BY ROLLUP (students.schoolid, u_iepinfo.r_dis1, students.ethnicity, gender)
ORDER BY 1
