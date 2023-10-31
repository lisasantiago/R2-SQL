select
course_number,
termid,

(select PREFERREDNAME 
from teachers
where sections.teacher = teachers.id) "Teacher Name",
(select course_name
from courses
where sections.course_number = courses.course_number) "Course Name",
(select terms.name
from terms
where sections.termid = terms.id and sections.schoolid = terms.schoolid)
from sections
where teacher = 5808
;
select * 
from teachers
where
PREFERREDNAME = 'Riley, N'
;
select * from terms
;
select * from sections
;
select terms.name
from sections, terms
where sections.termid = terms.id and sections.schoolid = terms.schoolid
