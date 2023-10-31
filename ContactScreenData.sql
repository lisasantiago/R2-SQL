SELECT TO_CHAR(students.STUDENT_NUMBER) AS Student_Number,
  students.LASTFIRST,
  S_SC_STU_CONTACTS_X.CNT1_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT1_LNAME    AS CONT1,
  S_SC_STU_CONTACTS_X.CNT1_REL         AS CONT1REL,
  S_SC_STU_CONTACTS_X.CNTA1_CUSTODY    AS CONT1CUST,
  S_SC_STU_CONTACTS_X.CNT1_LIVING_WITH AS CONT1LW,
  S_SC_STU_CONTACTS_X.CNT1_EMERG_IND   AS CONT1EM,
  S_SC_STU_CONTACTS_X.CNT2_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT2_LNAME    AS CONT2,
  S_SC_STU_CONTACTS_X.CNT2_REL         AS CONT2REL,
  S_SC_STU_CONTACTS_X.CNT2_CUSTODY     AS CONT2CUST,
  S_SC_STU_CONTACTS_X.CNT2_LIVING_WITH AS CONT2LW,
  S_SC_STU_CONTACTS_X.CNT2_EMERG_IND   AS CONT2EM,
  S_SC_STU_CONTACTS_X.CNT3_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT3_LNAME    AS CONT3,
  S_SC_STU_CONTACTS_X.CNT3_REL         AS CONT3REL,
  S_SC_STU_CONTACTS_X.CNT3_CUSTODY     AS CONT3CUST,
  S_SC_STU_CONTACTS_X.CNT3_LIVING_WITH AS CONT3LW,
  S_SC_STU_CONTACTS_X.CNT3_EMERG_IND   AS CONT3EM,
  S_SC_STU_CONTACTS_X.CNT4_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT4_LNAME    AS CONT4,
  S_SC_STU_CONTACTS_X.CNT4_REL         AS CONT4REL,
  S_SC_STU_CONTACTS_X.CNT4_CUSTODY     AS CONT4CUST,
  S_SC_STU_CONTACTS_X.CNT4_LIVING_WITH AS CONT4LW,
  S_SC_STU_CONTACTS_X.CNT4_EMERG_IND   AS CONT4EM,
  S_SC_STU_CONTACTS_X.CNT5_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT5_LNAME    AS CONT5,
  S_SC_STU_CONTACTS_X.CNT5_REL         AS CONT5REL,
  S_SC_STU_CONTACTS_X.CNT5_CUSTODY     AS CONT5CUST,
  S_SC_STU_CONTACTS_X.CNT5_LIVING_WITH AS CONT5LW,
  S_SC_STU_CONTACTS_X.CNT5_EMERG_IND   AS CONT5EM,
  S_SC_STU_CONTACTS_X.CNT6_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT6_LNAME    AS CONT6,
  S_SC_STU_CONTACTS_X.CNT6_REL         AS CONT6REL,
  S_SC_STU_CONTACTS_X.CNT6_CUSTODY     AS CONT6CUST,
  S_SC_STU_CONTACTS_X.CNT6_LIVING_WITH AS CONT6LW,
  S_SC_STU_CONTACTS_X.CNT6_EMERG_IND   AS CONT6EM,
  S_SC_STU_CONTACTS_X.CNT7_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT7_LNAME    AS CONT7,
  S_SC_STU_CONTACTS_X.CNT7_REL         AS CONT7REL,
  S_SC_STU_CONTACTS_X.CNT7_CUSTODY     AS CONT7CUST,
  S_SC_STU_CONTACTS_X.CNT7_LIVING_WITH AS CONT7LW,
  S_SC_STU_CONTACTS_X.CNT7_EMERG_IND   AS CONT7EM,
  S_SC_STU_CONTACTS_X.CNT8_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT8_LNAME    AS CONT8,
  S_SC_STU_CONTACTS_X.CNT8_REL         AS CONT8REL,
  S_SC_STU_CONTACTS_X.CNT8_CUSTODY     AS CONT8CUST,
  S_SC_STU_CONTACTS_X.CNT8_LIVING_WITH AS CONT8LW,
  S_SC_STU_CONTACTS_X.CNT8_EMERG_IND   AS CONT8EM,
  S_SC_STU_CONTACTS_X.CNT9_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT9_LNAME    AS CONT9,
  S_SC_STU_CONTACTS_X.CNT9_REL         AS CONT9REL,
  S_SC_STU_CONTACTS_X.CNT9_CUSTODY     AS CONT9CUST,
  S_SC_STU_CONTACTS_X.CNT9_LIVING_WITH AS CONT9LW,
  S_SC_STU_CONTACTS_X.CNT9_EMERG_IND   AS CONT9EM,
  S_SC_STU_CONTACTS_X.CNT10_FNAME
  || ' '
  || S_SC_STU_CONTACTS_X.CNT10_LNAME    AS CONT10,
  S_SC_STU_CONTACTS_X.CNT10_REL         AS CONT10REL,
  S_SC_STU_CONTACTS_X.CNT10_CUSTODY     AS CONT10CUST,
  S_SC_STU_CONTACTS_X.CNT10_LIVING_WITH AS CONT10LW,
  S_SC_STU_CONTACTS_X.CNT10_EMERG_IND   AS CONT10EM
FROM S_SC_STU_CONTACTS_X
INNER JOIN students
ON students.DCID           = S_SC_STU_CONTACTS_X.STUDENTSDCID
WHERE students.SCHOOLID    = 100
AND students.ENROLL_STATUS = 0
ORDER BY Student_Number