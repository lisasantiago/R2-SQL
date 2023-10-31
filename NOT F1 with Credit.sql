SELECT 
  STUDENT_NUMBER,
  LAST_NAME,
  FIRST_NAME,
  COURSE_NUMBER,
  course_name,
  STORECODE,
  G.LOG
FROM STUDENTS S
JOIN STOREDGRADES G
  ON S.ID=G.STUDENTID
WHERE STORECODE<>'F1'
AND POTENTIALCRHRS>0
AND S.SCHOOLID=100