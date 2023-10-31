select to_char(student_number) as student_number, lastfirst,(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School, grade_level, U_StudentsUserFields.r_proof_of_residency, sched_nextyeargrade, students.next_school
from students
join u_studentsuserfields on students.dcid = u_studentsuserfields.studentsdcid
where students.enroll_status = 0
;