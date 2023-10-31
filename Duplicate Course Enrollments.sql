select 
    students.student_number,
    students.lastfirst,
    students.grade_level,
    terms.name,
    courses.course_name, 
    cc.course_number, 
    count(cc.course_number),
    s_sc_stu_x.advisor
from 
    cc
    join sections on cc.sectionid = sections.id
    join students on cc.studentid = students.id
    join courses on courses.course_number = sections.course_number
    join s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
    right join terms on cc.termid = terms.id and cc.schoolid = terms.schoolid
where 
    cc.termid like '31%'
    and cc.schoolid = 100 --~(curschoolid)
    and courses.credit_hours > 0
GROUP BY students.student_number, students.lastfirst, students.grade_level, courses.course_name, terms.name, cc.course_number, s_sc_stu_x.advisor 
having count(cc.course_number) > 1
order by 2
;
select * from cc;
SELECT * FROM sections;
SELECT * FROM courses;
SELECT * FROM s_sc_stu_x;
SELECT * FROM terms