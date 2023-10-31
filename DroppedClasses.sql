select 
    students.schoolid, students.student_number,
    termid, cc.dateenrolled, cc.dateleft
from cc, students
where cc.studentid = students.id
and enroll_status = 0
and students.schoolid = 92
and abs(termid) like '30%'
and student_number = '790010035457'
and dateleft < '12-JUN-2021'
;
