select
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,
grade_level Grade,
students.entrydate,
r_covid_phase3b,
students.student_number
from u_studentsuserfields, students
where u_studentsuserfields.studentsdcid = students.dcid
--and students.grade_level in ('0', '-1', '-2', '-3')
and students.enroll_status = -1
and r_covid_phase3b is not null
and students.entrydate > '12-JUN-21'
