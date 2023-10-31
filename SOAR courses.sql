SELECT * FROM spenrollments
where id in (43147, 44195, 44196)
;
SELECT 
    (select abbreviation from schools where students.schoolid = schools.school_number) School, 
    students.student_number, 
    lastfirst, 
    dateenrolled, 
    dateleft
FROM 
    cc
    JOIN students on students.id = cc.studentid
WHERE
     -- course numbers pulled from the instructions in R2hq 
    course_number in ('27010000','309900CH','319900CH','329900CH','339900CH','379930CQ')
    -- summer enrichment camp schoolid 
    AND cc.schoolid = 497001
;