--Delete attendance records
DELETE FROM attendance 
where studentid in ('471027', '470953') 
and ATT_DATE < '22-AUG-23';
--yearid = '33'
--and attendance_codeid = 11902
;
--Attendance for a student
SELECT
    students.id,
    attendance.studentid,
    students.lastfirst,
    students.student_number,
    attendance.attendance_codeid,
    attendance.att_date,
    attendance.schoolid,
    attendance.yearid
FROM
         students
    INNER JOIN attendance ON students.id = attendance.studentid
WHERE
        students.student_number = &studentNumber
    AND attendance.yearid = 33
ORDER BY
    attendance.att_date

;
select * from attendance
where studentid = '460361'
and att_date >  '08-AUG-2023'
--and attendance_codeid <> 11902
;
--Search for attendance code id for a specific school
select schoolid, yearid, att_code, description, id from attendance_code
where schoolid = &SchoolID
and yearid = &YearID
;
--Find id using student_number
select lastfirst, id from students where student_number = &StudentNumber
;
select attendance.* from attendance
join students on studentid = students.id
where student_number = '51924'
and att_date > '09-NOV-2021'
--and attendance.ccid = '5562100'
;
select * from attendance_code
where schoolid = &SchoolID
and yearid = &YearID
;
select * from attendance_code
--where id = &attendanceCode
;
select lunchstatus from students where student_number = 37469
;


