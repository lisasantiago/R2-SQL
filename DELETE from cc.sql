select * from cc where termid like '-30%'
and schoolid = 74
and dateleft = '12-JUN-2021'
;
select * from cc where termid like '-30%'
and schoolid = 74
and dateleft = '12-JUN-2021'
;
select * from cc
where 
;
select * from cc join students on cc.studentid = students.id
where student_number = &StudentNumber
and cc.dateenrolled = '09-MAR-2021'
and dateleft = '09-MAR-2021'
;
DELETE 
FROM cc
where studentid = '360710'
and cc.dateenrolled = '09-MAR-2021'
and dateleft = '09-MAR-2021'
;
DELETE 
from cc
where studentid = '264651' and dateenrolled = '11-JUN-2021'
;
Update cc
set termid = abs(termid),
sectionid = abs(sectionid)
where studentid = '264651' and dateleft = '12-JUN-2021'
and termid like '-30%'
;



