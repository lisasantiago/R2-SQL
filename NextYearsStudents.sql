SELECT students.LASTFIRST,
  TO_CHAR(students.STUDENT_NUMBER) StudentID,
  students.GRADE_LEVEL Grade,
  (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as MS
FROM students
where students.NEXT_SCHOOL      = 100
and students.SCHOOLID != 100
ORDER BY 4,1