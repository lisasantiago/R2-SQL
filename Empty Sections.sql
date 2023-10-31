select schoolid, expression, (select course_name from courses where courses.course_number = sections.course_number) "Course Name", course_number ,section_number, grade_level, (select lastfirst from teachers where teachers.id = sections.teacher) Teacher from sections
where no_of_students = 0
and termid LIKE '31%'
and course_number != '08980000'
;
select * from sections
;
select * from teachers
;
select * from courses
;
select * from sections where course_number = '08980000' and termid like'30%'