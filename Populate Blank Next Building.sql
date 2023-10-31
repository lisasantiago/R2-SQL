update students
set sched_nextyearbuilding = 'CFKN'
where enroll_status = -1
and sched_nextyearbuilding is null
and grade_level < 6
and schoolid = 98
;
select student_number, schoolid, grade_level, next_school, building, sched_nextyearbuilding from students
where enroll_status = -1
and sched_nextyearbuilding is null
and grade_level < 6
and schoolid in (91, 55, 82, 45, 78, 50, 98, 51)
;
select distinct building from students where building is not null and enroll_status = 0