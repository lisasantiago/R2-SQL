SELECT spenrollments.enter_date, spenrollments.exit_date 
FROM students
JOIN spenrollments on students.id = spenrollments.studentid
WHERE spenrollments.programid = '42049'
AND enroll_status < 0
--AND spenrollments.exit_date is null
AND spenrollments.enter_date > '08-AUG-2022'
AND 
((spenrollments.exit_date = '01-JAN-1900'
AND enroll_status < 0)
OR
(spenrollments.exit_date != students.entrydate
AND enroll_status < 0))
