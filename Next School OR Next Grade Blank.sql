SELECT student_number, lastfirst, next_school, Sched_NextYearGrade 
FROM students
WHERE 
((next_school is null AND Sched_NextYearGrade is not null)
OR
(next_school is not null AND Sched_NextYearGrade is null))
AND enroll_status < 1
