SELECT
    COUNT(*),
    ps.cc.expression AS period,
    (SELECT t.preferredname FROM teachers t WHERE t.id = ps.cc.teacherid) teacher,
    (SELECT t.email_addr FROM teachers t WHERE t.id = ps.cc.teacherid) email
FROM
    ps.cc
    INNER JOIN ps.students ON ps.cc.studentid = ps.students.id
WHERE
    ps.cc.expression IN ('2-3(A)','3(A)','3-4(A)')
    AND ps.cc.schoolid = 100
    AND ps.cc.termid IN (3200,3002)
--    AND track = 'A'
GROUP BY
    ps.cc.expression,
    ps.cc.course_number
    || '.'
    || ps.cc.section_number,
    ps.cc.teacherid
ORDER BY
    2, 3