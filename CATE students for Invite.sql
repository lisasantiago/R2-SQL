SELECT ps.students.STUDENT_NUMBER,
  ps.students.FIRST_NAME,
  ps.students.MIDDLE_NAME,
  ps.students.LAST_NAME,
  ps.students.STREET,
  ps.students.CITY,
  ps.students.STATE,
  ps.students.ZIP,
  ps.students.GUARDIANEMAIL,
  ps.classrank.GPAMETHOD,
  ps.classrank.GPA,
  ps.classrank.RANK,
  PS.S_SC_STU_CONTACTS_X.CNT1_LIVING_WITH,
  PS.S_SC_STU_CONTACTS_X.CNT1_EMAIL,
  PS.S_SC_STU_CONTACTS_X.CNT2_EMAIL,
  PS.S_SC_STU_CONTACTS_X.CNT2_LIVING_WITH


FROM ps.students
INNER JOIN ps.classrank
ON ps.classrank.STUDENTID = ps.students.ID
INNER JOIN PS.S_SC_STU_CONTACTS_X
ON PS.S_SC_STU_CONTACTS_X.STUDENTSDCID = ps.students.DCID
INNER JOIN PS.CC
ON PS.CC.STUDENTID = ps.students.ID


WHERE ps.classrank.GPAMETHOD           = 'SC_UGP_4.0'
AND ps.classrank.GPA                   > 2.999
AND (PS.CC.COURSE_NUMBER LIKE '5%'
OR PS.CC.COURSE_NUMBER LIKE '6%')
AND ps.students.SCHOOLID               = 100
AND ps.students.ENROLL_STATUS          = 0
AND ps.students.GRADE_LEVEL            = 11