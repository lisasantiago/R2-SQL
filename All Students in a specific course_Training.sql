SELECT
  students.STUDENT_NUMBER,
  students.LASTFIRST,
  students.GRADE_LEVEL,
  sections.COURSE_NUMBER
FROM
  students
INNER JOIN cc
ON
  students.ID = cc.STUDENTID
INNER JOIN sections
ON
  sections.ID = cc.SECTIONID
WHERE
  students.SCHOOLID        = 100
AND students.ENROLL_STATUS = 0
AND cc.TERMID like '28%'
--and sections.COURSE_NUMBER = '365100CW'
ORDER BY
  students.LASTFIRST