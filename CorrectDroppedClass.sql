update cc
set 
termid = abs(termid),
sectionid = abs(sectionid)
where cc.course_number = '13010000'
and cc.id = 5550796
;
select student_number, studentid, cc.termid, abs(cc.termid), cc.sectionid, abs(cc.sectionid)
from cc
join students on cc.studentid = students.id
where student_number = '50139'
and course_number = '13010000'
and cc.id = 5550796