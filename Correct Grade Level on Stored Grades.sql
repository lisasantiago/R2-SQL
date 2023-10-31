--Update grade_level 13 --> 12
update storedgrades
set storedgrades.grade_level = 12
where studentid = 288540
and termid like '30%'
and storedgrades.datestored = '08-JUN-2021'
and storedgrades.grade_level = 13
;
--search the student records stored with grade level 13
select * from storedgrades
join students on storedgrades.studentid = students.id
where student_number = 70958
and termid like '30%'
and storedgrades.datestored = '08-JUN-2021'
and storedgrades.grade_level = 13
;
--Find student id using student_number
select * from storedgrades
join students on storedgrades.studentid = students.id
where student_number = &StudentNumber