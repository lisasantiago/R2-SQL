select /*sections.course_number, sections.section_number, */ * from cc
join sections on cc.sectionid = sections.id
where cc.schoolid = 94
and abs(cc.termid) = 3100
and cc.studentid = 393130
;
--return studentid using student_number
select distinct studentid from cc 
join students on cc.studentid = students.id
where student_number = &student_number