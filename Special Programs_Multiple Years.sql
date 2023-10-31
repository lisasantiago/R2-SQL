SELECT 
    (select ABBREVIATION from SCHOOLS where spenrollments.SCHOOLID=SCHOOL_NUMBER) School, 
    students.student_number, 
    (SELECT name from gen where spenrollments.programid=gen.id) SpProgram, 
    spenrollments.enter_date, 
    spenrollments.exit_date
FROM spenrollments
JOIN students on spenrollments.studentid = students.id
where enter_date < '17-AUG-2022'
and enter_date > '12-JUN-2021'
and exit_date like '%2023'
--and students.enroll_status < 1

--group by schoolid
;
SELECT (select ABBREVIATION from SCHOOLS where spenrollments.SCHOOLID=SCHOOL_NUMBER) School, count(*)
FROM spenrollments
join students on spenrollments.studentid = students.id
where enter_date < '17-AUG-2022'
and exit_date > '03-JUN-2022'
and students.enroll_status < 1
group by spenrollments.schoolid
order by 1 desc;
SELECT * FROM spenrollments
join gen on spenrollments.programid = 
;
SELECT * FROM gen
where cat = 'specprog'
;
UPDATE spenrollments
set exit_date = '03-JUN-2022'
where enter_date < '17-AUG-2022'
and enter_date > '12-JUN-2021'
and exit_date > '02-JUN-2022'
;