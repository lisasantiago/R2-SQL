--Pick the fields you want to return
SELECT
  students.STUDENT_NUMBER,
  students.LASTFIRST,
  students.GRADE_LEVEL,
  PS.STOREDGRADES.COURSE_NUMBER,
  PS.STOREDGRADES.TERMID,
  ps.storedgrades.grade,
  PS.STOREDGRADES.EARNEDCRHRS
FROM
  students

--join your tables on the id feild
INNER JOIN PS.STOREDGRADES
ON students.ID = PS.STOREDGRADES.STUDENTID
WHERE
    --subquery to pull students who completed 503100CW and earned a credit
    students.id in 
    (select distinct studentid from ps.storedgrades
    where PS.STOREDGRADES.COURSE_NUMBER = '503100CW'
    AND ps.storedgrades.earnedcrhrs > 0
    and students.schoolid = 69)
  --where statements to pull kids who completed 502300CW OR 503400CW
  AND 
  (PS.STOREDGRADES.COURSE_NUMBER = '502300CW'
  OR
  PS.STOREDGRADES.COURSE_NUMBER = '503400CW')
  AND
  ps.storedgrades.earnedcrhrs > 0
  ;
  