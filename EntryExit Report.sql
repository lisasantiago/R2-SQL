SELECT
   students.student_number,
   students.lastfirst,
   reenrollments.exitcode,
   reenrollments.exitcomment,
   to_char(reenrollments.exitdate),
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as "Current School",
   DECODE (students.enroll_status,-1,'Pre-Registered',0,'Active',1,'Transfered Out',2,'Transfered Out',3,'Transfered Out') as "Current Status",
   students.grade_level,
   to_char(students.entrydate),
   to_char(students.exitdate)
    
FROM
    students
    INNER JOIN reenrollments ON students.id = reenrollments.studentid
WHERE
    reenrollments.schoolid = 100
    AND reenrollments.exitcode NOT IN ('P','R','GC','EG','W21','W35','W36')
    AND students.schoolid <> 999999