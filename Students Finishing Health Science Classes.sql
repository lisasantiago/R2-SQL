SELECT
  STUDENT_NUMBER,
  LASTFIRST,
  GRADE_LEVEL
FROM STUDENTS S
JOIN (SELECT STUDENTID
      FROM  STOREDGRADES
      WHERE EARNEDCRHRS=1
      AND COURSE_NUMBER='555000CW') G1
ON S.ID=G1.STUDENTID
JOIN (SELECT STUDENTID
      FROM  STOREDGRADES
      WHERE EARNEDCRHRS=1
      AND COURSE_NUMBER='555100CW') G2
ON S.ID=G2.STUDENTID
WHERE ENROLL_STATUS<1
AND SCHOOLID=100