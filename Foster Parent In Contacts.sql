SELECT PS.STUDENTS.LASTFIRST,
  PS.STUDENTS.STUDENT_NUMBER,
  PS.S_SC_STU_CONTACTS_X.CNT2_REL,
  PS.S_SC_STU_CONTACTS_X.CNT3_REL,
  PS.S_SC_STU_CONTACTS_X.CNT1_REL,
  PS.S_SC_STU_CONTACTS_X.CNT4_REL,
  PS.S_SC_STU_CONTACTS_X.CNT5_REL,
  PS.STUDENTS.SCHOOLID,
  (SELECT SCHOOLS.ABBREVIATION
  FROM SCHOOLS
  WHERE PS.STUDENTS.SCHOOLID = SCHOOLS.SCHOOL_NUMBER
  ),
  (SELECT SCHOOLS.NAME
  FROM SCHOOLS
  WHERE PS.STUDENTS.SCHOOLID = SCHOOLS.SCHOOL_NUMBER
  )
FROM PS.STUDENTS
INNER JOIN PS.S_SC_STU_X
ON PS.S_SC_STU_X.STUDENTSDCID = PS.STUDENTS.DCID
INNER JOIN PS.S_SC_STU_CONTACTS_X
ON PS.S_SC_STU_CONTACTS_X.STUDENTSDCID  = PS.STUDENTS.DCID
WHERE 
(
(PS.S_SC_STU_CONTACTS_X.CNT2_REL = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT3_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT1_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT4_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT5_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT6_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT7_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT8_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT9_REL     = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT10_REL    = 'Foster Mother')
OR (PS.S_SC_STU_CONTACTS_X.CNT2_REL = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT3_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT1_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT4_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT5_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT6_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT7_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT8_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT9_REL     = 'Foster Father')
OR (PS.S_SC_STU_CONTACTS_X.CNT10_REL    = 'Foster Father')
)
AND PS.S_SC_STU_X.FOSTER_HOME          IS NULL
AND PS.STUDENTS.ENROLL_STATUS           = 0
ORDER BY
  (SELECT SCHOOLS.NAME
  FROM SCHOOLS
  WHERE PS.STUDENTS.SCHOOLID = SCHOOLS.SCHOOL_NUMBER
  ),
  PS.STUDENTS.LASTFIRST