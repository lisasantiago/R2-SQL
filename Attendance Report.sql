SELECT 
  (SELECT Course_Name FROM COURSES WHERE courses.Course_Number = sections.Course_Number) as Course,
  sections.COURSE_NUMBER,
  sections.SECTION_NUMBER,
  DECODE(substr(TERMID,-1), '0', 'All Year', '1', 'Sem 1', '2', 'Sem 2', '3', 'Quarter 1', '4', 'Quarter 2', '5', 'Quarter 3', '6', 'Quarter 4') as Term,
  sections.EXPRESSION as Period,
  sections.GRADE_LEVEL,
  DECODE(sections.EXCLUDE_ADA, 0, 'Include', 1, 'Excluded') AS Attendance,
  ExcludeFromStoredGrades/*,
  (SELECT SCHOOLS.ABBREVIATION   FROM SCHOOLS   
  WHERE sections.SCHOOLID = SCHOOLS.SCHOOL_NUMBER
  )as School*/
FROM SECTIONS
WHERE sections.TERMID LIKE '30%'
ORDER BY
  sections.COURSE_NUMBER