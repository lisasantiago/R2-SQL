select * from s_sc_stu_dc_iep_c;
select * from u_iepinfo;
select * from users;
select * from students;
select * from terms;
select student_number from students where dcid = &dcid;
select students.student_number, u_iepinfo.* from u_iepinfo join students on u_iepinfo.studentsdcid = students.dcid;

--View records for one student
select * from u_iepinfo join students on u_iepinfo.studentsdcid = students.dcid where student_number = &StudentID;

--Comments entered
select * from u_iepinfo where r_comments is not null;

select name, id, cat from gen where cat like 'R_IEP%';

--View options for drop downs in gen table
select id, name, value, cat from gen where cat = 'R_IEP_Type';

--Calculated age
SELECT 
lastfirst, 
to_char(dob, 'MM/DD/YYYY') DOB, 
to_char(add_months(DOB, 204), 'MM/DD/YYYY') Calculated_Age
FROM students
where enroll_status = 0 and schoolid = 100
--WHERE add_months(DOB, 204) BETWEEN to_date('08/01/2012', 'MM/DD/YYYY') AND to_date('07/31/2013', 'MM/DD/YYYY')
;
--Active/Inactive Status
--change to active else innactive
select
CASE
    WHEN EXISTS (select studentsdcid from u_iepinfo where r_svcend >= sysdate) THEN 'Active'
    ELSE 'Inactive'
END,
sysdate,
TO_char(dob, 'mm/dd/yyyy') "DateofBirth",
TRUNC(MONTHS_BETWEEN(TO_DATE('12/1/2020','MM/DD/YYYY'),DOB)/12) "DecAge"
from students
join u_iepinfo on students.dcid = u_iepinfo.studentsdcid
;
--Pulling only records for current school year
SELECT 
            u_iepinfo.id,
			(select name from gen WHERE Gen.id = u_iepinfo.R_RECTYPE),
			(select name from gen WHERE gen.id = u_iepinfo.R_PROGMOD),
            u_iepinfo.R_SVCSTART, 
            u_iepinfo.R_SVCEND,
            (select name from gen WHERE Gen.id = u_iepinfo.R_DIS1),
			(select name from gen WHERE Gen.id = u_iepinfo.R_PLACEMENT),
			(select lastfirst from users where u_iepinfo.R_TCH1 = users.dcid),
            (select lastfirst from users where u_iepinfo.R_TCH2 = users.dcid),
            (select name from gen WHERE Gen.id = u_iepinfo.R_SVCEXTREAS),
			u_iepinfo.R_COMMENTS
        FROM 
            u_iepinfo
;
--SPED Caseload
select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
users.lastfirst,
(select name from gen WHERE gen.id = u_iepinfo.R_PROGMOD),
student_number, 
students.lastfirst, 
(select name from gen WHERE Gen.id = u_iepinfo.R_DIS1)
from u_iepinfo
join users on u_iepinfo.R_TCH1 = users.dcid
join students on students.dcid = u_iepinfo.studentsdcid
where  UPPER(users.lastfirst) like UPPER('Nugent%')
and (u_iepinfo.r_svcend > sysdate or u_iepinfo.r_svcend is null) --added to account for students exited
order by students.lastfirst
;
--Service Start Date is Blank
select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
users.lastfirst,
(select name from gen WHERE gen.id = u_iepinfo.R_PROGMOD),
student_number, 
students.lastfirst, 
(select name from gen WHERE Gen.id = u_iepinfo.R_DIS1)
from u_iepinfo
join users on u_iepinfo.R_TCH1 = users.dcid
join students on students.dcid = u_iepinfo.studentsdcid
where u_iepinfo.r_svcstart is null
;
--SPED Teachers With Students Entered
select distinct users.lastfirst
from u_iepinfo
where (u_iepinfo.r_svcend > sysdate or u_iepinfo.r_svcend is null) --added to account for students exited
join users on u_iepinfo.R_TCH1 = users.dcid
order by 1 
;
select distinct users.lastfirst, /*(select ABBREVIATION from SCHOOLS where users.HOMESCHOOLID=SCHOOL_NUMBER),*/ count(studentsdcid)
from u_iepinfo
join users on u_iepinfo.R_TCH1 = users.dcid
group by lastfirst
order by 1 
;
SELECT * FROM S_SC_STU_EFA_History_C
;
--Homebound Info
SELECT 'Homebound/Homebased',
(select student_number from students where S_SC_STU_EFA_History_C.studentsdcid = students.dcid),
efa_primary, efa_2, efa_3, efa_4, efa_5, efa_6, efa_7, efa_8, efa_9, efa_10
FROM S_SC_STU_EFA_History_C
WHERE 
(efa_primary = 'HO' 
OR efa_2 = 'HO' 
OR efa_3 = 'HO' 
OR efa_4 = 'HO' 
OR efa_5 = 'HO' 
OR efa_6 = 'HO' 
OR efa_7 = 'HO' 
OR efa_8 = 'HO' 
OR efa_9 = 'HO' 
OR efa_10 = 'HO'
AND stop_dt >= sysdate)
AND stop_dt is null
and start_dt > '17-AUG-2021'
;
--Display EFA Codes
SELECT 
efa_primary, efa_2, efa_3, efa_4, efa_5, efa_6, efa_7, efa_8, efa_9, efa_10
FROM S_SC_STU_EFA_History_C
;
--sqlReports

--SPED Services All Data
  SELECT 
  student_number,
  lastfirst,
  to_char(dob,'mm/dd/yy'),
  grade_level,
  (select abbreviation from schools where school_number = schoolid),
  building,
  (select name from gen where gen.id = u_iepinfo.r_progmod),
  to_char(u_iepinfo.r_svcstart,'mm/dd/yy'),
  to_char(u_iepinfo.r_svcend,'mm/dd/yy'),
  (select name from gen where gen.id = u_iepinfo.r_dis1),
  (select name from gen where gen.id = u_iepinfo.r_placement),
  (select preferredname from users where u_iepinfo.r_tch1 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch2 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch3 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch4 = users.dcid),
  (select name from gen where gen.id = u_iepinfo.r_svcextreas),
  u_iepinfo.r_comments,
  decode((
    select distinct studentsdcid
      from s_sc_stu_efa_history_c
      where
        (efa_primary = 'HO'
        or efa_2 = 'HO'
        or efa_3 = 'HO'
        or efa_4 = 'HO'
        or efa_5 = 'HO'
        or efa_6 = 'HO'
        or efa_7 = 'HO'
        or efa_8 = 'HO'
        or efa_9 = 'HO'
        or efa_10 = 'HO')
      and sysdate between start_dt and nvl(stop_dt,sysdate)
      and start_dt > to_date('0701' || to_char(31-10),'mmddyy')
      and s_sc_stu_efa_history_c.studentsdcid = students.dcid
      ),null,'No','Yes'
  ) as homebound
from students
join u_iepinfo
on dcid=studentsdcid
;
--SPED Promotion Report
select
  student_number,
  lastfirst,
  to_char(dob,'mm/dd/yy') DOB,
  grade_level,
  (select abbreviation from schools where school_number = schoolid) Curent_School,
  building,
  CASE
    WHEN grade_level < 6 THEN (SELECT abbreviation FROM schools WHERE U_StudentsUserFields.R_Zoned_ES = schools.school_number)
    WHEN grade_level > 8 THEN (SELECT abbreviation FROM schools WHERE U_StudentsUserFields.R_Zoned_HS = schools.school_number)
    ELSE (SELECT abbreviation FROM schools WHERE U_StudentsUserFields.R_Zoned_MS = schools.school_number)
  END Zoned_School,
  (select abbreviation from schools where school_number = students.next_school) Next_School,
  (select name from gen where gen.id = u_iepinfo.r_progmod),
  to_char(u_iepinfo.r_svcstart,'mm/dd/yy'),
  to_char(u_iepinfo.r_svcend,'mm/dd/yy'),
  (select name from gen where gen.id = u_iepinfo.r_dis1),
  (select name from gen where gen.id = u_iepinfo.r_placement),
  (select preferredname from users where u_iepinfo.r_tch1 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch2 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch3 = users.dcid),
  (select preferredname from users where u_iepinfo.r_tch4 = users.dcid),
  (select name from gen where gen.id = u_iepinfo.r_svcextreas),
  u_iepinfo.r_comments
from students
join u_iepinfo
  on dcid=studentsdcid
join U_StudentsUserFields
    on students.dcid = U_StudentsUserFields.studentsdcid
where u_iepinfo.r_svcend is null
/*AND schoolid = decode(~(curschoolid),0,schoolid,~(curschoolid))
and u_iepinfo.r_svcstart >= to_date('%param1%','mm/dd/yyyy')
and nvl(u_iepinfo.r_svcend,to_date('%param2%','mm/dd/yyyy')) <= to_date('%param2%','mm/dd/yyyy')*/
;
select 
(select student_number from students where cc.studentid = students.id),
(select lastfirst from students where cc.studentid = students.id),
cc.*, 
(select student_number from students where cc.studentid = students.id)
from cc
where course_number in ('08960000','')
and termid like '31%'
and cc.schoolid = 100
;
select r_placement from u_iepinfo
where r_placement is not null;

select 'Homebound', student_number, lastfirst
        FROM S_SC_STU_EFA_History_C, students
        WHERE s_sc_stu_efa_history_c.studentsdcid = students.dcid
        AND
        (efa_primary = 'HO' 
        OR efa_2 = 'HO' 
        OR efa_3 = 'HO' 
        OR efa_4 = 'HO' 
        OR efa_5 = 'HO' 
        OR efa_6 = 'HO' 
        OR efa_7 = 'HO' 
        OR efa_8 = 'HO' 
        OR efa_9 = 'HO' 
        OR efa_10 = 'HO')
        AND sysdate BETWEEN start_dt AND nvl(stop_dt,sysdate)
        and s_sc_stu_efa_history_c.studentsdcid in 
            (select studentsdcid 
            from u_iepinfo 
            where s_sc_stu_efa_history_c.studentsdcid = u_iepinfo.studentsdcid 
            and u_iepinfo.R_SVCSTART >= to_date('07/01/2021','MM/DD/YYYY')
            and u_iepinfo.R_SVCEND <= to_date('01/04/2022','MM/DD/YYYY')
            )
;
SELECT * FROM u_iepinfo
JOIN students on dcid=studentsdcid
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE s_sc_stu_x.diplomaearncode = 'E'
;
-->>>>>>SPED Students Who Earned SCHSC
SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
              (select preferredname from users where u_iepinfo.r_tch1 = users.dcid),
                students.student_number, 
                lastfirst,
                (select name from gen where gen.id = u_iepinfo.r_dis1),
                s_sc_stu_x.diplomaearncode
FROM u_iepinfo
JOIN students on dcid=studentsdcid
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE s_sc_stu_x.diplomaearncode in ('E','G')
;
SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),  count(students.schoolid)
FROM students
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE s_sc_stu_x.diplomaearncode in ('E','G')
GROUP BY schoolid
;

select student_number, lastfirst, u_iepinfo.*  from u_iepinfo
join students on students.dcid = u_iepinfo.studentsdcid
WHERE r_svcend is not null
and r_svcextreas is null
;
select studentsdcid, to_date('17-AUG-22') as "r_svcstart", u_iepinfo.r_dis1, u_iepinfo.r_dis2  
from u_iepinfo
join students on students.dcid = u_iepinfo.studentsdcid
WHERE r_svcend is null
AND r_svcextreas is null
;
select studentsdcid, to_date('17-AUG-22') as "r_svcstart", r_dis1, r_dis2
from u_iepinfo
--join students on students.dcid = u_iepinfo.studentsdcid
WHERE r_svcend is null
AND r_svcextreas is null
;
--Exit reason code EY
select distinct(gen.id), name, gen.cat 
from gen
join u_iepinfo on Gen.id = u_iepinfo.R_SVCEXTREAS
;
-- Exit Reason Codes
SELECT * FROM gen
WHERE cat = 'R_IEP_Exit'
;
SELECT * FROM u_iepinfo
WHERE whencreated > '15-AUG-22'
;

-- Student w/out casemanager
SELECT 
students.dcid,
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), 
(select name from gen WHERE gen.id = u_iepinfo.R_PROGMOD),
student_number, 
CHR(60) || 'a href=/admin/students/home.html?frn=' || '001' || DCID || '&lsp=/admin/students/iepinfo.html target=_blank>' || LASTFIRST || CHR(60) || '/a'  || CHR(62),
(select name from gen WHERE Gen.id = u_iepinfo.R_DIS1)
FROM u_iepinfo
join students on students.dcid = u_iepinfo.studentsdcid
where   u_iepinfo.R_TCH1 is null
and (u_iepinfo.r_svcend > sysdate or u_iepinfo.r_svcend is null)
;