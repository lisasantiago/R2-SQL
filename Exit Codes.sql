SELECT distinct(select abbreviation from schools where students.schoolid=schools.school_number) FROM students
WHERE exitcode = 'W30'
order by 1 asc
;
SELECT
    (select abbreviation from schools where students.schoolid=schools.school_number) School, 
    student_number,
    grade_level, 
    exitdate, 
    exitcode, 
    exitcomment 
FROM students
WHERE exitcode = 'W30'
and grade_level > 5
ORDER BY exitdate desc
