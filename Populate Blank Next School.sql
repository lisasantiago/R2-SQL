update students
set next_school = schoolid
where enroll_status = -1
and next_school = 0
;
select student_number, schoolid, next_school, lastfirst from students
where enroll_status = -1
and next_school = 0