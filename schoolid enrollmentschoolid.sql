SELECT 
(select abbreviation from schools where students.schoolid = schools.school_number) Schoolid, 
(select abbreviation from schools where students.ENROLLMENT_SCHOOLID  = schools.school_number) LastEnrolled
--,ENROLLMENT_SCHOOLID 
FROM students 
where schoolid != ENROLLMENT_SCHOOLID
and ENROLLMENT_SCHOOLID != 43
and student_number = 77849                                                                                                       
;
UPDATE students
set schoolid = ENROLLMENT_SCHOOLID
WHERE student_number = 77849                                                                                           
;
SELECT 
(select abbreviation from schools where students.schoolid = schools.school_number) Schoolid, 
(select abbreviation from schools where students.ENROLLMENT_SCHOOLID  = schools.school_number) LastEnrolled
FROM students 
where  student_number = 77849                                                                                                 