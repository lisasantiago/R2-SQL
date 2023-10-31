--WITH clause creating a table from students and reenrollments
WITH withdrawals AS 
    (SELECT id, schoolid, grade_level, track, entrydate, exitdate, exitcode, to_char(exitcomment) as Comment1
      FROM students
UNION
    SELECT
      studentid, schoolid, grade_level, track, entrydate, exitdate, exitcode, to_char(exitcomment) as Comment1
      FROM reenrollments
    )
--select * from withdrawals;

--SELECT clause for WITH clause table
            SELECT
                    (SELECT to_char(student_number) FROM students WHERE withdrawals.id=students.id
                    ) as "Student ID",
                
                    (SELECT lastfirst FROM students WHERE withdrawals.id=students.id
                     ) as "Name",
                     
                    withdrawals.exitdate,
                    (withdrawals.exitcode || ' - ' || (DECODE(withdrawals.exitcode, 
                                                                                    'W10', 'Transfer/In-District', 
                                                                                    'W20', 'Withdrawn/Unknown Status', 
                                                                                    'W21', 'Graduated', 
                                                                                    'W22', 'Transfer/Out of District', 
                                                                                    'W23', 'Transfer/Adult Education', 
                                                                                    'W24', 'Moved Out of District/ School Unknown', 
                                                                                    'W25', 'Withdrawn/Home Schooled', 
                                                                                    'W26', 'Withdrawn/Health or Pregnancy', 
                                                                                    'W27', 'Withdrawn/Tech School', 
                                                                                    'W28', 'Withdrawn/4-Year College', 
                                                                                    'W29', 'Withdrawn/Work', 
                                                                                    'W30', 'Withdrawn/Military', 
                                                                                    'W31', 'Withdrawn/Juvenile Corrections', 
                                                                                    'W32', 'Withdrawn/Adult Corrections', 
                                                                                    'W33', 'Withdrawn/Expulsion', 
                                                                                    'W34', 'Withdrawn/Charter School', 
                                                                                    'W35', 'Deceased', 'W36', 'Dropout', 
                                                                                    'W37', 'Re-enrolled Next School Year', 
                                                                                    'W38', 'Adult Ed - Diploma Tracking', 
                                                                                    'W39', 'Exceeded Maximum Age for Attendance', 
                                                                                    'W40', 'Adult Ed GED - Tracking', 
                                                                                    'NS', 'No-Show/Never Enrolled', 
                                                                                    'P', 'Promoted For End of Year Process', 
                                                                                    'R', 'Retained For End of Year Process', 
                                                                                    'GC', 'Grade Change', 
                                                                                    'EG', 'Early Graduate'
                                                                                )
                                                                    )
                  ) as "Withdrawal Code",
                    withdrawals.Comment1,
                
                    (DECODE (students.enroll_status,
                                    -1,'Pre-Registered',
                                    0,'Active',
                                    1,'Transfered Out',
                                    2,'Transfered Out',
                                    3,'Transfered Out'
                                    )
                     ) as "Current Status",
                    
                    (SELECT ABBREVIATION FROM SCHOOLS WHERE students.SCHOOLID=schools.SCHOOL_NUMBER
                     ) as "Current School",
                     
                    students.grade_level,
                    students.track
                                    
            FROM
                    withdrawals
				INNER JOIN students ON withdrawals.id = students.id
            WHERE 
						(
                                --At current school and innactive
                                (
                                withdrawals.schoolid = 100
                                AND
                                students.enroll_status > 0
                                )
                         OR 
                                --not at current school but withdrawals record is at current school
                                (
                                withdrawals.schoolid = 100
                                AND
                                students.schoolid <> 100
                                )
                        )
                    AND withdrawals.exitcode NOT IN ('P','R','GC','EG','W21')
                    --Parameters to be entered
                    AND withdrawals.exitdate > '1-NOV-2020'
                    AND withdrawals.exitdate < '30-NOV-2020'
;




--sql with WITH clause for fields
SELECT
    (SELECT to_char(student_number) FROM students WHERE withdrawals.id=students.id
    ) as "Student ID",

    (SELECT lastfirst FROM students WHERE withdrawals.id.studentid=students.id
     ) as "Name",

    (SELECT (DECODE (students.enroll_status,
                    -1,'Pre-Registered',
                    0,'Active',
                    1,'Transfered Out',
                    2,'Transfered Out',
                    3,'Transfered Out')
                    )
    FROM    
    students 
WHERE
withdrawals.id=students.id
     ) as "Current Status",
    grade_level,
    track,
    entrydate,
    exitdate,
    (SELECT
        ABBREVIATION
    FROM 
        SCHOOLS
    WHERE
        withdrawals.id=schools.SCHOOL_NUMBER
     ) as "Current School"
FROM
    ps.ps_enrollment_all
    where schoolid = 100
    AND exitdate > '1-NOV-2020'
    AND exitdate < '30-NOV-2020' 
 
 ;
--Small WITH example on students/reenrollments
WITH withdrawn 
(exitcode, exitcomment)  
AS 
(
select exitcode, exitcomment from reenrollments
)
select * from withdrawn
;
--All fields in Reenrollments
select * from reenrollments
;
--All fields in PS.ps_enrollment_all
select * from PS.ps_enrollment_all
;
--All fields in PS.ps_enrollment
select * from PS.ps_enrollment
;
--All fields from students
select * from students
;
select * from lists