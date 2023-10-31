update storedgrades
set grade_level = 11
where studentid = '137829'
and grade_level = 12
;
select storedgrades.studentid from storedgrades
join students on storedgrades.studentid = students.id
where student_number = &studentNumber