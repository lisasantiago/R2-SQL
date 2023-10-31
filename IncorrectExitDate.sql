select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,schoolid, lastfirst, to_char(student_number) StudentID, enroll_status, grade_level, entrydate ,exitdate from students
WHERE (entrydate < '14-JUN-21'
and exitdate > '14-JUN-21')
OR (entrydate > '14-JUN-21'
and exitdate < '14-JUN-21')
order by 1,3