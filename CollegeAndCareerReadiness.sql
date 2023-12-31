SELECT to_char(students.STUDENT_NUMBER),
  students.LASTFIRST,
  STUDENTS.GRADE_LEVEL,
  S_SC_STU_X.NINTHGRADECODE,
  students.HOME_ROOM,
  students.ENROLL_STATUS,
  S_SC_STU_X.Advisor
FROM students
INNER JOIN S_SC_STU_X
ON S_SC_STU_X.STUDENTSDCID = students.DCID
WHERE students.SCHOOLID = 100
ORDER BY students.STUDENT_NUMBER