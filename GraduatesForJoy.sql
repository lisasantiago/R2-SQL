SELECT
    students.student_number,
    MAX(reenrollments.entrydate),
    reenrollments.schoolid,
    students.lastfirst,
    students.grade_level,
    students.enroll_status,
    students.entrydate,
    students.exitdate,
    students.exitcode,
    students.graduated_schoolid,
    students.graduated_schoolname
FROM
    students
    INNER JOIN reenrollments ON students.id = reenrollments.studentid
GROUP BY
    students.student_number,
    reenrollments.schoolid,
    students.lastfirst,
    students.grade_level,
    students.enroll_status,
    students.entrydate,
    students.exitdate,
    students.exitcode,
    students.graduated_schoolid,
    students.graduated_schoolname
    
ORDER BY
    students.lastfirst;