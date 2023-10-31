SELECT Students.LAST_NAME
  || ', '
  || Students.FIRST_NAME,
  Students.GRADE_LEVEL
FROM Students
WHERE Students.SCHOOLID    = 100
AND Students.ENROLL_STATUS = 0
ORDER BY Students.GRADE_LEVEL,
  Students.LAST_NAME
  || ', '
  || Students.FIRST_NAME