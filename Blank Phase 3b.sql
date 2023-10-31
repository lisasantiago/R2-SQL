select students.entrydate, student_number, lastfirst, U_StudentsUserFields.R_COVID_PHASE3B 
from students
join U_StudentsUserFields on students.dcid = U_StudentsUserFields.studentsdcid
where entrydate > '01/APR-2021'
and U_StudentsUserFields.R_COVID_PHASE3B is null
and students.enroll_status = 0