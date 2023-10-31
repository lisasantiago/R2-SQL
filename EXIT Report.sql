SELECT students.student_number,
    students.lastfirst,
    ps_enrollment_all.exitcode,
    ps_enrollment_all.exitdate,
    
--If student is at the curschool, return exit comment from students table.
--If student is not at the curschool, return exit comment from reenrollments table.
    (
        CASE
            WHEN students.schoolid = 83  THEN
                students.exitcomment
            ELSE
                reenrollments.exitcomment
        END
    ) as "Exit Comment",
--Exit comment fields for validation
 students.exitcomment,
 reenrollments.exitcomment,
    decode(students.enroll_status, 
                - 1, 'Pre-Registered', 
                0, 'Active',
                1, 'Transfered Out', 
                2, 'Transfered Out', 
                3, 'Transfered Out')  as "Current Status",
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as "Current School",
    students.grade_level,
    students.entrydate
FROM
    ps_enrollment_all
    FULL JOIN students ON students.id = ps_enrollment_all.studentid
    FULL JOIN reenrollments ON reenrollments.studentid = students.id
WHERE

--excludes promoted, retained, grade change, early graduate, graduated
    ps_enrollment_all.exitcode NOT IN ('P', 'R','GC','EG','W21')
--All enrollments exit date entry to be replaced with params
    AND ps_enrollment_all.exitdate > '31-AUG-20'

--reenrollments schoolid = curschool OR students schoolid = curschool AND student innactive
    AND ( reenrollments.schoolid = 83
            OR (students.schoolid = 83
                    AND students.enroll_status < 0
                   ))

--Test for null Exit Comment records                   
    AND (
            CASE
                WHEN students.schoolid = 83  THEN
                    students.exitcomment
                WHEN students.schoolid <> 83 THEN
                    reenrollments.exitcomment
            END
             ) IS NULL