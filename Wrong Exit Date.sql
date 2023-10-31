select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, 
schoolid,
lastfirst, 
student_number, 
enroll_status, 
exitdate 
from students
where exitdate > '12-JUN-2021' 
and enroll_status != -1
order by exitdate desc
;
--count of students per school
select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, count(schoolid)
from students
where exitdate > '12-JUN-2021' and enroll_status != -1
and schoolid != 43
group by rollup (schoolid)
order by 2 desc


