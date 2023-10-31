SELECT students.LASTFIRST,
 TO_CHAR (students.STUDENT_NUMBER),
  students.SCHOOLID,
  students.ENROLL_STATUS,
  PS.CC.SCHOOLID AS SCHOOLID1
FROM students
INNER JOIN PS.CC
ON PS.CC.STUDENTID         = students.ID
WHERE students.SCHOOLID    = '100'
AND students.ENROLL_STATUS < 1
AND PS.CC.SCHOOLID         = '60'