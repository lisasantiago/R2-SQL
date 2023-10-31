SELECT students.ID, students.LUNCHSTATUS,
students.lastfirst
FROM students
WHERE students.SCHOOLID    = 100
AND students.ENROLL_STATUS = 0
;
-- free/reduced lunch OR pip
SELECT students.student_number, students.lastfirst
FROM students
WHERE students.SCHOOLID  =  &Schoolid
AND students.ENROLL_STATUS = 0
AND (lunchstatus <> 'P'
          OR dcid  in (select studentsdcid from s_sc_stu_x where students.dcid=s_sc_stu_x.studentsdcid and  s_sc_stu_x.pip_status = 'Y')
          )
;
