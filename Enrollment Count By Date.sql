select
  count(student_number)
from students s
join ps_adaadm_defaults_all a
on s.id = a.studentid
where calendardate = &date
and membershipvalue = 1 
--group by rollup
--  a.grade_level,
--order by
--  a.grade_level,
