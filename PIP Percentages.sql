SELECT
--returns percent of PIP montessori students
TRUNC(((SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' AND SCHOOLID = 81
and id in(select studentid from cc where course_number ='08960000' and lower(section_number) like '%m' and termid =3300)
AND dcid in (select studentsdcid from s_sc_stu_x where studentsdcid=students.dcid and pip_status = 'Y'))/
(SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' AND SCHOOLID = 81
and id in(select studentid from cc where course_number ='08960000' and lower(section_number) like '%m' and termid =3300)))*100,2) as "Montessori PIP", 

--returns percent of PIP non montessori students
TRUNC(((SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' AND SCHOOLID = 81
and id not in(select studentid from cc where course_number ='08960000' and lower(section_number) like '%m' and termid =3300)
AND dcid in (select studentsdcid from s_sc_stu_x where studentsdcid=students.dcid and pip_status = 'Y'))/
(SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' AND SCHOOLID = 81
and id not in(select studentid from cc where course_number ='08960000' and lower(section_number) like '%m' and termid =3300)))*100,2) as "Non Montessori PIP"

FROM students
WHERE rownum < 2
;
select
  Decode(Grouping(Grade_Level),1,'Total',
    Decode(Grouping(Ethnicity),1,NULL,
      Decode(Grade_Level,-1,'PK4',-2,'PK3',0,'K',Grade_Level))) Grade,
  Decode(Grouping(Ethnicity),1,
    Decode(Grouping(Grade_Level),1,NULL,
      'Total ' || Decode(Grade_Level,-1,'PK4',-2,'PK3',0,'K','Gr ' || Grade_Level)),Ethnicity) Ethnicity,
  count((select 1 from s_sc_stu_x where SELECT COUNT(*)
FROM students
 ='Y' and studentsdcid=dcid)) PIPY,
  count((select 1 from s_sc_stu_x where pip_status ='N' and studentsdcid=dcid)) PIPN,
  count(*) Total
from students
where enroll_status=0
AND entrycode = 'E'
AND SCHOOLID = 81
and id in(
  select studentid from cc where course_number ='08960000' and lower(section_number) like '%m' and termid =3300)
GROUP BY
  RollUp(
    Grade_Level,
    Ethnicity)
ORDER BY
  Grade_Level,
  Ethnicity
  ;
--district PIP percentage
SELECT
TRUNC(((SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E'
AND dcid in (select studentsdcid from s_sc_stu_x where studentsdcid=students.dcid and pip_status = 'Y'))/
(SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E'))*100,2) as "PIP Percentage"
FROM students
WHERE rownum < 2
;
--School PIP percentage
SELECT
TRUNC(((SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' and schoolid = &schoolid
AND dcid in (select studentsdcid from s_sc_stu_x where studentsdcid=students.dcid and pip_status = 'Y'))/
(SELECT COUNT(*)
FROM students
where enroll_status=0 AND entrycode = 'E' and schoolid = &schoolid ))*100,2) as "PIP Percentage"
FROM students
WHERE rownum < 2