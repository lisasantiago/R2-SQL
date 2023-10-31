---- Update process for stored grades --> report cards
--UPDATE StoredGrades
--SET CREDIT_TYPE = 'CY'
--WHERE (CREDIT_TYPE<>'CY'
--Or CREDIT_TYPE IS NULL)
--AND STORECODE<>'F1'
--AND SUBSTR(TERMID,0,2)=
--  (CASE
--    WHEN TO_NUMBER(TO_CHAR(SysDate,'MM')) BETWEEN 1 AND 6
--    THEN TO_NUMBER((TO_CHAR(SysDate,'YY')+9))
--    ELSE TO_NUMBER((TO_CHAR(SysDate,'YY')+10))
--  END)
  ;
  -- Update process for stored grades --> report cards
UPDATE StoredGrades
SET CREDIT_TYPE = 'CY'
WHERE (CREDIT_TYPE<>'CY'
OR CREDIT_TYPE IS NULL)
AND STORECODE = 'Q1'
AND schoolid = &schoolid
AND termid like '33%'
  ;
  
  -- School with grades stored but not converted to show up on the report card
SELECT (select abbreviation from schools where schoolid = school_number) School, count(schoolid) FROM StoredGrades
WHERE (CREDIT_TYPE<>'CY'
Or CREDIT_TYPE IS NULL)
AND STORECODE = 'Q2'
--AND schoolid = 76
AND termid like '32%'
GROUP BY schoolid
 ;

-- When grades were stored for a specific school
select distinct (select abbreviation from schools where schoolid = school_number) School, termid, storecode, credit_type, datestored, transaction_date, WHOMODIFIEDID from storedgrades
where schoolid = &schoolid
and termid like '32%'
ORDER BY datestored desc
;
--which schools stored grades on a specific date
select distinct schoolid, termid, storecode, datestored from storedgrades
where schoolid = 84
and termid like '30%'
and datestored = '09-JUN-2021'
--and storecode = 'Y1'
order by 1 asc
;
select termid, storecode, datestored, storedgrades.log from storedgrades
where schoolid = &Schoolid
and datestored = &date
order by datestored
;
--
select distinct students.student_number, storedgrades.schoolid, storedgrades.termid, storedgrades.storecode, storedgrades.datestored from storedgrades
join students on storedgrades.studentid = students.id
where storedgrades.schoolid = 84
and storedgrades.termid like '30%'
and storedgrades.datestored = '09-JUN-2021'
order by 1 asc
;


SELECT termid, course_number, section_number, EXCLUDEFROMSTOREDGRADES, 
(select preferredname from teachers where teachers.id = sections.teacher)
FROM sections
where schoolid = 94
and course_number = '08960000'
and termid = 3200
and EXCLUDEFROMSTOREDGRADES <> 2
--and section_number = 'HR502'
;
SELECT id, preferredname FROM teachers
where preferredname like 'Shortman%'
;

UPDATE sections
set EXCLUDEFROMSTOREDGRADES = 2
where schoolid = 94
and course_number = '08960000'
and termid = 3200
and EXCLUDEFROMSTOREDGRADES <> 2
--and section_number = 'HR502'
;

