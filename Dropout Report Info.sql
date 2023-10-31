SELECT students.LASTFIRST,
  TO_CHAR(students.STUDENT_NUMBER),
  students.EXITDATE,
  students.EXITCODE,
  students.EXITCOMMENT,
   S_SC_STU_X.MOVED_TO_DISTRICT,
   S_SC_STU_X.MOVED_TO_SCHOOL
FROM students
INNER JOIN S_SC_STU_X
ON S_SC_STU_X.STUDENTSDCID    = students.DCID
WHERE students.SCHOOLID       = 100
and students.ENROLL_STATUS <> 0
and students.EXITDATE > '01-OCT-17'
