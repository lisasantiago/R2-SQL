SELECT COUNT(*),
  ps.cc.EXPRESSION AS Period,
  (SELECT t.PREFERREDNAME FROM teachers t WHERE t.ID = ps.cc.TEACHERID
  ) Teacher
FROM ps.cc
WHERE ps.cc.SCHOOLID  = 100
AND ps.cc.TERMID     IN (2800, 2801)
AND ps.cc.EXPRESSION IN('1(A)', '1-2(A)')
GROUP BY ps.cc.EXPRESSION,
  ps.cc.COURSE_NUMBER
  || '.'
  || ps.cc.SECTION_NUMBER,
  ps.cc.TEACHERID
ORDER BY Teacher