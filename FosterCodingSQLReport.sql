SELECT 
PS.S_SC_STU_X.FOSTER_HOME,
PS.STUDENTS.LASTFIRST,
  PS.STUDENTS.STUDENT_NUMBER,
  PS.S_SC_STU_CONTACTS_X.CNT1_REL,
  PS.S_SC_STU_CONTACTS_X.CNT2_REL,
  PS.S_SC_STU_CONTACTS_X.CNT3_REL,
  PS.S_SC_STU_CONTACTS_X.CNT4_REL,
  PS.S_SC_STU_CONTACTS_X.CNT5_REL,
  PS.S_SC_STU_CONTACTS_X.CNT6_REL,
  PS.S_SC_STU_CONTACTS_X.CNT7_REL,
  PS.S_SC_STU_CONTACTS_X.CNT8_REL,
  PS.S_SC_STU_CONTACTS_X.CNT9_REL,
  PS.S_SC_STU_CONTACTS_X.CNT10_REL

FROM PS.STUDENTS
INNER JOIN PS.S_SC_STU_X
ON PS.S_SC_STU_X.STUDENTSDCID = PS.STUDENTS.DCID
INNER JOIN PS.S_SC_STU_CONTACTS_X
ON PS.S_SC_STU_CONTACTS_X.STUDENTSDCID  = PS.STUDENTS.DCID

WHERE
((PS.S_SC_STU_CONTACTS_X.CNT1_REL LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT2_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT3_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT4_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT5_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT6_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT7_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT8_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT9_REL     LIKE 'Foster%')
OR (PS.S_SC_STU_CONTACTS_X.CNT10_REL    LIKE 'Foster%'))
AND PS.S_SC_STU_X.FOSTER_HOME          IS NULL
AND PS.STUDENTS.ENROLL_STATUS           = 0
ORDER BY
  PS.STUDENTS.LASTFIRST