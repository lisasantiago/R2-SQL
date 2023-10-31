--Pulls contact info. change kinship guardian field number and contact numbers in where clause and run for each contact number.
SELECT S.SCHOOLID, (select name from SCHOOLS where S.SCHOOLID=SCHOOL_NUMBER) School,
  S.STUDENT_NUMBER, S.LASTFIRST, 
    'Contact 1' as "Kinship Guardian", 
    X.CNTA1_CUSTODY, X.CNT1_REL, X.CNT1_FNAME  || ' '  || X.CNT1_LNAME "Contact 1", CNT1_HPHONE, CNT1_CPHONE, CNT1_EMAIL,
    X.CNT2_CUSTODY, X.CNT2_REL, X.CNT2_FNAME || ' '  || X.CNT2_LNAME "Contact 2", CNT2_HPHONE, CNT2_CPHONE, CNT2_EMAIL,
    X.CNT3_CUSTODY, X.CNT3_REL, X.CNT3_FNAME  || ' '  || X.CNT3_LNAME "Contact 3", CNT3_HPHONE, CNT3_CPHONE, CNT3_EMAIL,
    X.CNT4_CUSTODY, X.CNT4_REL, X.CNT4_FNAME  || ' '  || X.CNT4_LNAME "Contact 4", CNT4_HPHONE, CNT4_CPHONE, CNT4_EMAIL,
    X.CNT5_CUSTODY, X.CNT5_REL, X.CNT5_FNAME  || ' '  || X.CNT5_LNAME "Contact 5", CNT5_HPHONE, CNT5_CPHONE, CNT5_EMAIL,
    X.CNT6_CUSTODY, X.CNT6_REL, X.CNT6_FNAME  || ' '  || X.CNT6_LNAME "Contact 6", CNT6_HPHONE, CNT6_CPHONE, CNT6_EMAIL,
    X.CNT7_CUSTODY, X.CNT7_REL, X.CNT7_FNAME  || ' '  || X.CNT7_LNAME "Contact 7", CNT7_HPHONE, CNT7_CPHONE, CNT7_EMAIL,
    X.CNT8_CUSTODY, X.CNT8_REL, X.CNT8_FNAME  || ' '  || X.CNT8_LNAME "Contact 8", CNT8_HPHONE, CNT8_CPHONE, CNT8_EMAIL,
    X.CNT9_CUSTODY, X.CNT9_REL, X.CNT9_FNAME  || ' '  || X.CNT9_LNAME "Contact 9", CNT9_HPHONE, CNT9_CPHONE, CNT9_EMAIL,
    X.CNT10_CUSTODY, X.CNT10_REL, X.CNT10_FNAME  || ' '  || X.CNT10_LNAME "Contact 10", CNT10_HPHONE, CNT10_CPHONE, CNT10_EMAIL,
  S.alert_guardian,
  X.CONTACTS_COMMENTS, 
  S.MOTHER, S.FATHER    
FROM STUDENTS S 
INNER JOIN S_SC_STU_CONTACTS_X X 
ON S.DCID = X.STUDENTSDCID 
WHERE S.ENROLL_STATUS = 0 
AND ((LOWER(X.CNT1_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian', 'sister', 'brother') and X.CNTA1_CUSTODY = 1))
ORDER BY 2,4
  ;
  SELECT S.SCHOOLID, 
  SCHOOLS.NAME, 
  S.STUDENT_NUMBER, 
  S.LASTFIRST, 
  X.CNTA1_CUSTODY, 
  X.CNT1_REL, 
  X.CNT1_LNAME || ', ' || X.CNT1_FNAME CNT1_NAME, 
  X.CNT2_CUSTODY, 
  X.CNT2_REL, 
  X.CNT2_LNAME || ', ' || X.CNT2_FNAME CNT2_NAME, 
  X.CNT3_CUSTODY, 
  X.CNT3_REL, 
  X.CNT3_LNAME  || ', '  || X.CNT3_FNAME CNT3_NAME, 
  X.CONTACTS_COMMENTS, 
  S.MOTHER, 
  S.FATHER 
FROM STUDENTS S 
INNER JOIN S_SC_STU_CONTACTS_X X 
ON S.DCID = X.STUDENTSDCID 
INNER JOIN SCHOOLS 
ON S.SCHOOLID         = SCHOOLS.SCHOOL_NUMBER 
WHERE S.ENROLL_STATUS = 0 
AND (LOWER(X.CNT1_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian')) 
or (LOWER(X.CNT2_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian')) 
or (LOWER(X.CNT3_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian')) 
ORDER BY 2,4				
  ;
  SELECT * FROM S_SC_STU_CONTACTS_X
  ;
  select alert_guardian 
  from students
  where alert_guardian is not null

  ;
  OR (LOWER(X.CNT2_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT2_CUSTODY = 1) 
OR (LOWER(X.CNT3_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT3_CUSTODY = 1)
OR (LOWER(X.CNT4_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT4_CUSTODY = 1)
OR (LOWER(X.CNT5_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT5_CUSTODY = 1)
OR (LOWER(X.CNT6_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT6_CUSTODY = 1)
OR (LOWER(X.CNT7_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT7_CUSTODY = 1)
OR (LOWER(X.CNT8_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT8_CUSTODY = 1)
OR (LOWER(X.CNT9_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT9_CUSTODY = 1)
OR (LOWER(X.CNT10_REL) in ('grand%', 'aunt', 'uncle', 'other relative', 'guardian') and X.CNT10_CUSTODY = 1)