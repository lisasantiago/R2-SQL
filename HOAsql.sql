(select dcid from students where Sched_YearOfGraduation ='2020' and grade_level = 99)
;
SELECT 
storedgrades.SCHOOLNAME,
storedgrades.SCHOOLID,
  students.STUDENT_NUMBER,
  students.LASTFIRST,
  storedgrades.GRADE_LEVEL,
  reenrollments.exitcode,
  storedgrades.TERMID,
  storedgrades.COURSE_NUMBER,
  storedgrades.COURSE_NAME,
  storedgrades.STORECODE,
  storedgrades.GRADE,
  storedgrades.PERCENT,
  storedgrades.TEACHER_NAME,
  sections.EXPRESSION,
  sections.SECTION_NUMBER,
  CC.DATEENROLLED,
  CC.DATELEFT
FROM Students
JOIN storedgrades on students.id = storedgrades.studentid
JOIN CC on students.id=cc.studentid
JOIN sections on sections.id = cc.sectionid
JOIN reenrollments on students.id = reenrollments.studentid
WHERE storedgrades.GRADE_LEVEL > 5
and students.DCID IN (select dcid from students where Sched_YearOfGraduation ='2020' and grade_level = 99)
--AND students.ENROLL_STATUS = 0
ORDER BY storedgrades.SCHOOLNAME,
  students.LASTFIRST,
  storedgrades.COURSE_NAME,
  storedgrades.STORECODE
;
select * from reenrollments
;
(select exitcode from reenrollments where reenrollments.studentid=students.id)
;
select exitcode from reenrollments where exitcode = 'CNV'
;
select value from gen where value = 'CNV'
;
select * from sections;
select * from cc;
select * from storedgrades
