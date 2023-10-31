SELECT students.LASTFIRST,
 TO_CHAR(students.STUDENT_NUMBER),
  students.GRADE_LEVEL,
  (select ABBREVIATION from SCHOOLS where students.NEXT_SCHOOL=SCHOOL_NUMBER),
  (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER)
  FROM students
WHERE students.STUDENT_NUMBER IN ('20582',
'23655',
'54968',
'55400',
'55413',
'55401',
'69814',
'52737',
'81469',
'25715')
AND students.NEXT_SCHOOL  <> 92
ORDER BY schoolid,
  students.LASTFIRST
  ;
  select student_number from students where schoolid <> 92 and next_school <> 92