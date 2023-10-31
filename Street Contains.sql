SELECT students.LASTFIRST,
  students.STUDENT_NUMBER,
  students.STREET
FROM students
WHERE students.STREET in '221 Flintlake Rd%'
AND students.ENROLL_STATUS > -1
ORDER BY students.LASTFIRST