SELECT students.student_number, reenrollments.entrydate, reenrollments.exitdate, students.entrydate, students.exitdate 
FROM reenrollments
JOIN students on reenrollments.studentid = students.id
WHERE reenrollments.exitdate > '31-JAN-2022'
AND students.enroll_status = 0
ORDER BY 1
;

SELECT student_number, grade_level, schoolid, entrydate, exitdate
FROM students
WHERE exitdate > '03-JUN-2022' AND exitdate < '03-JUN-2023'
;