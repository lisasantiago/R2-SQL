SELECT 
    schoolid,
    u_studentsuserfields.r_zoned_ms,
    student_number,
    lastfirst,
    students.street,
    s_sc_stu_x.gridcode,
    students.next_school,
    u_studentsuserfields.r_zoned_ms,
    u_studentsuserfields.r_zoned_hs
FROM students
JOIN U_StudentsUserFields on students.dcid = U_StudentsUserFields.studentsdcid
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE
    schoolid = 95
    AND students.enroll_status = 0
    AND students.grade_level = 8
    AND students.next_school <> u_studentsuserfields.r_zoned_hs
