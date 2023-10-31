select * from PS.u_contact_tracing order by whencreated desc;
select * from users
where lower(title) like '%nurse%';
select value from GEN where cat = 'R_Covid_Type';
select student_number from students where dcid = &dcid;
DELETE FROM ps.u_contact_tracing where id is not null; 

/*contacttracing.html*/
SELECT
    U_CONTACT_TRACING.id,
    (select value from GEN where gen.id = U_CONTACT_TRACING.R_Type) || DECODE(R_3CASES2WEEKS,1,'<span title="Outbreak indicates > 3 cases in 2 weeks"> (Outbreak) </span>'),
    TO_CHAR(R_LAST_CONTACT),
    (SELECT (CASE WHEN r_covid_vac_date2 + 14 <= sysdate AND R_90_POSITIVE IS NOT NULL THEN 'Vaccinated - '
                            WHEN r_covid_vac_date2 + 14 <= sysdate AND R_90_POSITIVE IS NULL THEN 'Vaccinated'
                            ELSE '' 
                    END) FROM u_studentsuserfields WHERE u_contact_tracing.studentsdcid = u_studentsuserfields.studentsdcid) || 
    (CASE WHEN R_90_POSITIVE is not null THEN ' Tested positive in the past 90 days. ' || '(' || R_LAST_POSITIVE || ')'
    ELSE'' 
    END),
    'Symptom Onset <b>' || TO_CHAR(R_SYMPTOM_DATE) || '</b><br>' ||
    SUBSTR(DECODE(R_ALGY,1,'Allergy Symptoms - ') || 
            DECODE(R_CHLLS,1,'Chills - ') || 
            DECODE(R_CGSTN,1,'Congestion/Runny Nose - ') || 
            DECODE(R_CGH,1,'Cough - ') || 
            DECODE(R_DIAR,1,'Diarrhea - ') ||
            DECODE(R_FAT,1,'Fatigue/Muscle or Body Aches - ') || 
            DECODE(R_FEVER,1,'Fever - ') || 
            DECODE(R_HA,1,'Headache - ') || 
            DECODE(R_LTS,1,'Loss of Taste or Smell - ') || 
            DECODE(R_NV,1,'Nausea/Vomiting - ') || 
            DECODE(R_SOB,1,'Shortness of Breath/Difficulty Breathing - ') || 
            DECODE(R_ST,1,'Sore Throat - '), 
            0, LENGTH((DECODE(R_ALGY,1,'Allergy Symptoms - ') || 
                        DECODE(R_CHLLS,1,'Chills - ') || 
                        DECODE(R_CGSTN,1,'Congestion/Runny Nose - ') || 
                        DECODE(R_CGH,1,'Cough - ') || 
                        DECODE(R_DIAR,1,'Diarrhea - ') || 
                        DECODE(R_FAT,1,'Fatigue/Muscle or Body Aches - ') || 
                        DECODE(R_FEVER,1,'Fever - ') || 
                        DECODE(R_HA,1,'Headache - ') || 
                        DECODE(R_LTS,1,'Loss of Taste or Smell - ') || 
                        DECODE(R_NV,1,'Nausea/Vomiting - ') || 
                        DECODE(R_SOB,1,'Shortness of Breath/Difficulty Breathing - ') || 
                        DECODE(R_ST,1,'Sore Throat - ')))-3),
    TO_CHAR(R_TEST_DATE) ||'    '||DECODE(R_TEST_RESULTS, 1, 'Positive', 0, 'Negative'),
    R_ISOL_QUAR ||'    ' || TO_CHAR(R_BEGIN_DATE) || ' - ' || TO_CHAR(R_END_DATE) || '<br>Projected return to school date '|| TO_CHAR(R_END_DATE + 1),
    R_ACTIVITY,
    (SELECT lastfirst FROM users where u_contact_tracing.R_CREATED_BY = users.dcid),
    DECODE(R_1129_COMPLETE, 1, 'Completed', NULL, 'Not Completed'),
    TO_CHAR(R_CONTACT_DATE),
    R_COMMENTS    
FROM 
    PS.u_contact_tracing
--WHERE PS.u_contact_tracing.studentsdcid = ~(studentrn)
ORDER BY whencreated desc
;
WITH SYM AS(
  SELECT
    STUDENTSDCID SDCID,
    LISTAGG(symptoms,' - ') within group (order by symptoms) symptoms
  FROM PS.U_CONTACT_TRACING 
    UNPIVOT(BIN
      FOR SYMPTOMS IN(
      R_ALGY AS 'Allergy Symptoms',
      R_CHLLS AS 'Chills',
      R_CGSTN AS 'Congestion/Runny Nose',
      R_CGH AS 'Cough',
      R_DIAR AS 'Diarrhea',
      R_FAT AS 'Fatigue/Muscle or Body Aches',
      R_FEVER AS 'Fever',
      R_HA AS 'Headache',
      R_LTS AS 'Loss of Taste or Smell',
      R_NV AS 'Nausea/Vomiting',
      R_SOB AS 'Shortness of Breath/Difficulty Breathing',
      R_ST AS 'Sore Throat'
  ))
  GROUP BY STUDENTSDCID
)

SELECT
    U_CONTACT_TRACING.id,
    (select value from GEN where gen.id = U_CONTACT_TRACING.R_Type) || DECODE(R_3CASES2WEEKS,1,'<span title="Outbreak indicates > 3 cases in 2 weeks"> (Outbreak) </span>'),
    TO_CHAR(R_LAST_CONTACT),
    (SELECT (CASE WHEN r_covid_vac_date2 + 14 <= sysdate AND R_90_POSITIVE IS NOT NULL THEN 'Vaccinated - '
                            WHEN r_covid_vac_date2 + 14 <= sysdate AND R_90_POSITIVE IS NULL THEN 'Vaccinated'
                            ELSE '' 
                    END) FROM u_studentsuserfields WHERE u_contact_tracing.studentsdcid = u_studentsuserfields.studentsdcid) || 
                    (CASE WHEN R_90_POSITIVE is not null THEN ' Tested positive in the past 90 days.'
                                ELSE'' 
                    END),
    'Symptom Onset <b>' || TO_CHAR(R_SYMPTOM_DATE) || '</b><br>' || SYMPTOMS,
    TO_CHAR(R_TEST_DATE) ||'    '||DECODE(R_TEST_RESULTS, 1, 'Positive', 0, 'Negative'),
    R_ISOL_QUAR ||'    ' || TO_CHAR(R_BEGIN_DATE) || ' - ' || TO_CHAR(R_END_DATE) || '<br>Projected return to school date '|| TO_CHAR(R_END_DATE + 1),
    R_ACTIVITY,
    (SELECT lastfirst FROM users where u_contact_tracing.R_CREATED_BY = users.dcid),
    DECODE(R_1129_COMPLETE, 1, 'Completed', NULL, 'Not Completed'),
    TO_CHAR(R_CONTACT_DATE),
    R_COMMENTS    
FROM 
    PS.u_contact_tracing
    JOIN sym ON PS.u_contact_tracing.studentsdcid = sym.SDCID
--WHERE PS.u_contact_tracing.studentsdcid = ~(studentrn)
ORDER BY whencreated
;
/*Immunity Info*/
SELECT 
(SELECT (CASE WHEN r_covid_vac_date2 + 14 <= sysdate THEN ' Vaccinated '
ELSE '' END) FROM u_studentsuserfields WHERE u_contact_tracing.studentsdcid = u_studentsuserfields.studentsdcid)
|| 
(CASE WHEN R_90_POSITIVE is not null THEN ' Tested positive in the past 90 days. '
ELSE'' END)
FROM PS.u_contact_tracing

;
select * from PS.u_contact_tracing
JOIN u_studentsuserfields on PS.u_contact_tracing.studentsdcid = u_studentsuserfields.studentsdcid
;
/*Using listagg*/
SELECT 
    '<td>' || LISTAGG(U_CONTACT_TRACING.id,'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG((select value from GEN where gen.id = U_CONTACT_TRACING.R_Type) || DECODE(R_3CASES2WEEKS,1,' (>3 cases in 2 weeks)','</td><td>')) WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(TO_CHAR(R_LAST_CONTACT),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(DECODE(R_90_POSITIVE, 1, 'Yes', 0, 'No'),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG('Symptom Onset <b>' || TO_CHAR(R_SYMPTOM_DATE) || '</b><br>' ||
    DECODE(R_ALGY,1,'Allergy symptoms - ') || DECODE(R_CHLLS,1,'Chills - ') || DECODE(R_CGSTN,1,'Congestion/runny nose - ') || DECODE(R_CGH,1,'Cough - ') || DECODE(R_DIAR,1,'Diarrhea - ') || DECODE(R_FAT,1,'Fatigue/Muscle or body aches - ') || DECODE(R_FEVER,1,'Fever - ') || DECODE(R_HA,1,'Headache - ') || DECODE(R_LTS,1,'Loss of taste or smell - ') || DECODE(R_NV,1,'Nausea/vomiting - ') || DECODE(R_SOB,1,'Shortness of breath/difficulty breathing - ') || DECODE(R_ST,1,'Sore throat'),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG((SELECT r_covid_vac_date2 FROM ps.u_studentsuserfields WHERE u_contact_tracing.studentsdcid = u_studentsuserfields.studentsdcid),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(TO_CHAR(R_TEST_DATE) ||'    '||DECODE(R_TEST_RESULTS, 1, 'Positive', 0, 'Negative'),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(R_ISOL_QUAR ||'    ' || TO_CHAR(R_BEGIN_DATE) || ' - ' || TO_CHAR(R_END_DATE) || '<br>Projected return to school date '|| TO_CHAR(R_END_DATE + 1),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(R_ACTIVITY,'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG((SELECT lastfirst FROM users where u_contact_tracing.R_CREATED_BY = users.dcid),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(DECODE(R_1129_COMPLETE, 1, 'Yes', 0, 'No'),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(TO_CHAR(R_CONTACT_DATE),'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id),
    LISTAGG(R_COMMENTS,'</td><td>') WITHIN GROUP (ORDER BY U_CONTACT_TRACING.id)
FROM 
    PS.u_contact_tracing
   -- WHERE PS.u_contact_tracing.studentsdcid = ~(studentrn)
ORDER BY whencreated
;

    SELECT u_studentsuserfields.r_covid_vac_date2
    FROM u_studentsuserfields
    join u_contact_tracing on u_studentsuserfields.studentsdcid = u_contact_tracing.studentsdcid
    WHERE R_TEST_DATE - 90 <=  r_covid_vac_date2
    AND R_TEST_DATE - 14 >=  r_covid_vac_date2
    ;
    SELECT u_studentsuserfields.r_covid_vac_date2, studentsdcid
    FROM u_studentsuserfields 
    WHERE r_covid_vac_date2 - 90 <=  sysdate
    AND r_covid_vac_date2 + 14 >= sysdate 
    ;
    SELECT r_covid_vac_date2, r_covid_vac_date2 + 14
    FROM u_studentsuserfields 
    JOIN u_contact_tracing ON u_studentsuserfields.studentsdcid = u_contact_tracing.studentsdcid
    WHERE (r_covid_vac_date2 + 14) between (R_TEST_DATE - 90) and R_TEST_DATE
    ;
    SELECT (SELECT student_number FROM students WHERE u_studentsuserfields.studentsdcid = students.dcid),
    r_covid_vac_date2, r_covid_vac_date2 + 14
    FROM u_studentsuserfields 
    WHERE r_covid_vac_date2 is not null
    ;
    --Projected Return Date
    SELECT R_TEST_DATE + 14
    FROM u_contact_tracing
    WHERE u_contact_tracing.studentsdcid = ~(studentrn)
    ;
--Count of records per student
select COUNT(id)
from PS.u_contact_tracing
where u_contact_tracing.studentsdcid = ~(studentrn)
;
SELECT 
    TO_CHAR(r_covid_vac_date), 
    TO_CHAR(r_covid_vac_date2), 
    TO_CHAR(r_covid_vac_date2 + 14)
FROM u_studentsuserfields 
WHERE r_covid_vac_date2 IS NOT NULL
--WHERE u_studentsuserfields.studentsdcid = ~(studentrn)
;
SELECT 
    TO_CHAR(r_covid_vac_date), 
    TO_CHAR(r_covid_vac_date2), 
    TO_CHAR(r_covid_vac_boost1),
    TO_CHAR(r_covid_vac_date2 + 14)
FROM u_studentsuserfields 
WHERE r_covid_vac_date2 IS NOT NULL
;
select * from u_studentsuserfields;
select whocreated, whencreated, r_created_date, r_created_by 
from PS.u_contact_tracing;
;
SELECT count(r_covid_vac_date) 
    --TO_CHAR(r_covid_vac_date), 
    --TO_CHAR(r_covid_vac_date2), 
    --TO_CHAR(r_covid_vac_date2 + 14)
FROM u_studentsuserfields 
--WHERE r_covid_vac_date IS NOT NULL
;
SELECT 
    TO_CHAR(r_covid_vac_date), 
    TO_CHAR(r_covid_vac_date2)
FROM u_studentsuserfields 
WHERE r_covid_vac_date IS NULL
AND r_covid_vac_date2 is not null

;
select * from codeset
;
select "(" || count(id) || ")"
from PS.u_contact_tracing
WHERE PS.u_contact_tracing.studentsdcid = ~(studentrn);
;
/*Reports*/
select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
DECODE(R_isol_quar, 'Isolation', '<span style="color: blue;">Isolation</span>','Quarantine'),
R_isol_quar, student_number, lastfirst,  to_char(whencreated) 
from ps.u_contact_tracing
join students on ps.u_contact_tracing.studentsdcid = students.dcid
;
select 
    (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
    students.lastfirst, 
    students.grade_level, 
    to_CHAR(r_begin_date), 
    to_CHAR(r_end_date)
from ps.u_contact_tracing
join students on ps.u_contact_tracing.studentsdcid = students.dcid
where r_end_date > sysdate
;
/*last contact pulled from data. Possibly add to page*/
select max(to_char(R_LAST_CONTACT))
from PS.u_contact_tracing;
select distinct logtypeid from log;
select distinct name from gen
where cat = 'logentrycodes'
;