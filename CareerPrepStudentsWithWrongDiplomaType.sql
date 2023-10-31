SELECT students.STUDENT_NUMBER,
students.LASTFIRST,
  sections.COURSE_NUMBER
  
FROM students
INNER JOIN cc
ON cc.STUDENTID = students.ID
INNER JOIN sections
ON cc.SECTIONID = sections.ID
INNER JOIN PS.S_SC_STU_X
ON students.DCID               = PS.S_SC_STU_X.STUDENTSDCID

WHERE sections.COURSE_NUMBER  IN ('3799J100', '3799J100', '3399J400')
AND students.SCHOOLID          = 100
AND PS.S_SC_STU_X.DIPLOMA_TYPE = 'F'