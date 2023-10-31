SELECT * FROM cc
join students on students.id = cc.studentid
where student_number = 58333   
and termid like '32%'
;
UPDATE cc
set cc.dateenrolled = '17-AUG-22'
WHERE studentid = 215411
and cc.dateenrolled > '16-OCT-22'