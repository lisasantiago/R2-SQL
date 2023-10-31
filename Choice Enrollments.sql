-- % of students who are choiced and attending a school other than their zoned school
SELECT TRUNC(((x.choiced/y.alll)*100),2) || '%'
FROM
    (SELECT COUNT(students.student_number) as choiced
    FROM students
    join spenrollments on students.id = spenrollments.studentid
    JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid
    --choice special programs
    where spenrollments.programid in ('1646','1649','1650','1652','1647','1648','1653','1654','1660','1669','1538','1541','1542','1543','1548','1550','1551','1651','4846','4848','5145','5295','4847','10145','11895','14496','14497','14498','14495','27745','21345','35747','23545','21642','21346','31146','31147','31148','30895','31145')
    and spenrollments.enter_date > '01-aug-2021'
    and students.enroll_status = 0
    --school of residence is not school of enrollment
    and SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) <> students.schoolid) x
JOIN
    --total district enrollment
    (select COUNT(student_number) as alll  from students where enroll_status = 0) y
ON 1=1
;
-- % of students who are choiced attending within their zoned school
SELECT TRUNC(((x.choiced/y.alll)*100),2) || '%'
FROM
    (SELECT COUNT(students.student_number) as choiced
    FROM students
    join spenrollments on students.id = spenrollments.studentid
    JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid
    --choice special programs
    where spenrollments.programid in ('1646','1649','1650','1652','1647','1648','1653','1654','1660','1669','1538','1541','1542','1543','1548','1550','1551','1651','4846','4848','5145','5295','4847','10145','11895','14496','14497','14498','14495','27745','21345','35747','23545','21642','21346','31146','31147','31148','30895','31145')
    and spenrollments.enter_date > '01-aug-2021'
    and students.enroll_status = 0
    --school of residence is not school of enrollment
    and SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) = students.schoolid) x
JOIN
    --total district enrollment
    (select COUNT(student_number) as alll  from students where enroll_status = 0) y
ON 1=1
;
-- % of students who are choiced attending within their zoned school - magnet special programs only
SELECT TRUNC(((x.choiced/y.alll)*100),2) || '%'
FROM
    (SELECT COUNT(students.student_number) as choiced
    FROM students
    join spenrollments on students.id = spenrollments.studentid
    JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid
    --choice special programs
    where spenrollments.programid in ('1646','1649','1650','1652','1647','1648','1653','1654','1660','1669','1538','1541','1542','1543','1548','1551','1651','5145','4847','10145','11895','14496','14498','14495','27745','21345','21642','21346')
    and spenrollments.enter_date > '01-aug-2021'
    and students.enroll_status = 0
    --school of residence is not school of enrollment
    and SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) = students.schoolid) x
JOIN
    --total district enrollment
    (select COUNT(student_number) as alll  from students where enroll_status = 0) y
ON 1=1
;
(select COUNT(dcid) from students where enroll_status = 0);


SELECT
  ID,
  Name
FROM Gen
WHERE Lower(Cat)='specprog'
;
SELECT
  Student_Number,
  Last_Name,
  First_Name,
  Grade_Level
FROM (SELECT *
      FROM STUDENTS
      JOIN S_SC_STU_X
      ON DCID=StudentsDCID
      WHERE SchoolRes<>('4002' || SubStr(('0' || SchoolID),-3))
      AND Enroll_Status=0
      AND Grade_Level>-2
      AND McKinney_Vento_Serv IS NULL
      AND (Building NOT Like 'C%' OR Building IS NULL)) S
LEFT JOIN (SELECT DISTINCT StudentID
      FROM SPENROLLMENTS L
      JOIN GEN
      ON GEN.ID=L.PROGRAMID
      WHERE NAME LIKE '(C) X%'
      AND ENTER_DATE>'01-AUG-2021') E
ON S.ID=E.StudentID
WHERE E.StudentID IS NULL
;
SELECT student_number, SUBSTR(S_SC_STU_X.SchoolRes, 5, 3), students.schoolid
FROM students
JOIN spenrollments on students.id = spenrollments.studentid and students.schoolid = spenrollments.schoolid
JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid 
where SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) <> students.schoolid
and students.id IN (select studentid from spenrollments where spenrollments.id in (1646,1649,1650,1652,1647,1648,1653,1654,1660,1669,1538,1541,1542,1543,1548,1550,1551,1651,4846,4848,5145,5295,4847,10145,11895,14496,14497,14498,14495,27745,21345,35747,23545,21642,21346,31146,31147,31148,30895,31145) and spenrollments.enter_date > '01-aug-2021')

;
SELECT * FROM spenrollments;
SELECT SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) FROM S_SC_STU_X;
SELECT * FROM students
join spenrollments on students.id = spenrollments.studentid
where spenrollments.id in (1646,1649,1650,1652,1647,1648,1653,1654,1660,1669,1538,1541,1542,1543,1548,1550,1551,1651,4846,4848,5145,5295,4847,10145,11895,14496,14497,14498,14495,27745,21345,35747,23545,21642,21346,31146,31147,31148,30895,31145)
and spenrollments.enter_date > '01-aug-2021'
;
SELECT count(student_number), students.schoolid
FROM students
JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid 
where SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) <> students.schoolid
GROUP BY rollup (student_number, students.schoolid)
;

SELECT student_number FROM students
join spenrollments on students.id = spenrollments.studentid
where spenrollments.programid = '33995'
and students.enroll_status = 0
SELECT students.schoolid as "Enrolled School", SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) as "School of Residence", students.student_number as StudentID
FROM students
join spenrollments on students.id = spenrollments.studentid
JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid
where spenrollments.programid in ('1646','1649','1650','1652','1647','1648','1653','1654','1660','1669','1538','1541','1542','1543','1548','1550','1551','1651','4846','4848','5145','5295','4847','10145','11895','14496','14497','14498','14495','27745','21345','35747','23545','21642','21346','31146','31147','31148','30895','31145')
and spenrollments.enter_date > '01-aug-2021'
and students.enroll_status = 0
and SUBSTR(S_SC_STU_X.SchoolRes, 5, 3) <> students.schoolid
;