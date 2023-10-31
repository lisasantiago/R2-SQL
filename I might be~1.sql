select
lastfirst,
grade_level,
to_char (DOB, 'yyyymmdd')
from students
where ENROLL_STATUS<1
and schoolid=100

and id not in 
(SELECT STUDENTID
FROM CC
WHERE TERMID LIKE'28%'
AND substr(COURSE_NUMBER,2,1)= '4'
AND SCHOOLID=100) 
