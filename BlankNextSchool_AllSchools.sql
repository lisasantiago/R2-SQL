SELECT students.LASTFIRST,
  students.STUDENT_NUMBER,
  students.NEXT_SCHOOL,
  students.SCHOOLID
FROM students
WHERE students.ENROLL_STATUS = 0
and NEXT_SCHOOL = 0
ORDER BY students.SCHOOLID