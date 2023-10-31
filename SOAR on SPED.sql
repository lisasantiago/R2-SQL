select
dcid,
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
  Student_number,
  CHR(60) || 'a href=/admin/students/home.html?frn=' || '001' || DCID || ' target=_blank'  || CHR(62) || LASTFIRST || CHR(60) || '/a'  || CHR(62),
  to_char(dob, 'mm/dd/yyyy'),
  (select ABBREVIATION from SCHOOLS where students.next_school=SCHOOL_NUMBER),
  sched_nextyeargrade,
  r_soar_trans_am,
  r_soar_trans_pm,
  (select name from gen WHERE gen.id = u_iepinfo.R_PROGMOD),
  (select name from gen WHERE Gen.id = u_iepinfo.R_DIS1),
  (select lastfirst from users where u_iepinfo.R_TCH1 = users.dcid)
from students
join u_studentsuserfields on students.dcid = u_studentsuserfields.studentsdcid
join ps.u_iepinfo on students.dcid = ps.u_iepinfo.studentsdcid
where enroll_status in (0,-1)
and r_soar_yn = 1
and students.dcid in (select studentsdcid from ps.u_iepinfo where ps.u_iepinfo.r_svcend is null
)
and DECODE(~(curSchoolID),0,SCHOOLID,~(curSchoolID)) = 
  decode(sched_nextyeargrade,6,next_school,9,next_school,schoolid)
order by lastfirst
;
SELECT * FROM PS.u_iepinfo 