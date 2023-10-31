--Honor roll list with 7th period teacher
SELECT
  HR.LEVELVALUE,
  STU.STUDENT_NUMBER,
  stu.lastfirst,
  STU.GRADE_LEVEL,
  expression,
  (SELECT t.preferredname FROM teachers t WHERE t.id = cc.teacherid) teacher
FROM STUDENTS STU
    JOIN HONORROLL HR ON STU.ID = HR.STUDENTID
    INNER JOIN cc ON cc.studentid = stu.id
WHERE HR.YEARID = 33 --year of honor roll record
    AND HR.STORECODE = 'Q1' --term of honor roll
    AND stu.schoolid = 100
    AND expression like '%7%' --class period
    AND termid in ('3300','3301') --class termid
ORDER BY
  HR.LEVELVALUE,
  STU.LASTFIRST
  ;
  SELECT * FROM cc