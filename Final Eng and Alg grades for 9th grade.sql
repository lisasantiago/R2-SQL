SELECT S.SCHOOLID "Sch",
  S.STUDENT_NUMBER "Student ID",
  S.LASTFIRST "Student Name",
  S.GRADE_LEVEL "Current GR",
  SG.COURSE_NAME "Course Name",
  SG.COURSE_NUMBER "Course #",
  SG.STORECODE,
  SG.GRADE,
  SG.EARNEDCRHRS,
  SG.TERMID,
  SG.TEACHER_NAME,
  S_SC_STU_X.NINTHGRADECODE
FROM STUDENTS S,
  COURSES C,
  STOREDGRADES SG,
  S_SC_STU_X
WHERE S.ID          = SG.STUDENTID
AND C.COURSE_NUMBER = SG.COURSE_NUMBER
AND S.DCID          = S_SC_STU_X.STUDENTSDCID
AND (SG.COURSE_NUMBER LIKE '4117%'
OR SG.COURSE_NUMBER LIKE '4114%'
OR SG.COURSE_NUMBER LIKE '3024%')
AND SG.STORECODE = 'F1'
AND SG.TERMID LIKE '25%'
--AND S.ENROLL_STATUS              = 0
AND SG.SCHOOLID                  = '100'
AND S_SC_STU_X.NINTHGRADECODE = 16
ORDER BY "Student Name",
  SG.TEACHER_NAME