SELECT 
    to_char(student_number) student_number, 
    lastfirst, 
    reenrollments.grade_level, 
    reenrollments.entrydate, 
    (select name from schools where reenrollments.schoolid = schools.school_number) school,
    (select lastfirst from teachers where cc.teacherid = teachers.id AND termid = '3100')
FROM students
JOIN reenrollments on students.id = reenrollments.studentid
JOIN cc on students.id = cc.studentid AND reenrollments.schoolid = cc.schoolid and termid = 3100
WHERE reenrollments.grade_level = -1
AND reenrollments.entrydate BETWEEN '01-AUG-21' AND '01-JUN-22'
AND course_number = '08960000'
;
SELECT * FROM reenrollments
;
SELECT * FROM cc;
SELECT * FROM courses;
SELECT * FROM users;
SELECT * FROM teachers
;
