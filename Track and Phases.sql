select
(select abbreviation from schools where students.schoolid = schools.school_number) School,
building,
student_number,
track,
r_covid_phase2,
r_covid_phase2b,
r_covid_phase3, 
r_covid_phase3b
from U_studentsuserfields
join students on students.dcid = u_studentsuserfields.studentsdcid
where students.enroll_status = 0
and students.schoolid <> '43'
and track is null
order by 1
;
select * from u_studentsuserfields
;
select * from schools
