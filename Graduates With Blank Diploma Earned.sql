SELECT 
schoolid, 
DECODE (enroll_status, -2, 'Inactive', -1, 'Pre-registered', 0, 'Active', 1, 'Inactive', 2, 'TransferredOut', 3, 'Graduated', 4, 'Imported') Enroll_Status,
student_number, 
lastfirst, 
ninthgradecode, 
diplomaearncode 
FROM students
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE ninthgradecode = 20
AND diplomaearncode IS NULL
AND schoolid = 999999