select
students.dcid,
(select ABBREVIATION from SCHOOLS where storedgrades.schoolid=schools.SCHOOL_NUMBER) CourseSchool, 
(select student_number from students where students.id = STOREDGRADES.studentid) studentID, 
termid, course_name, storecode, potentialcrhrs, earnedcrhrs, to_char(datestored)
from storedgrades
join students on storedgrades.studentid = students.id
where storecode <> 'F1'
and earnedcrhrs <> 0

;
select (select ABBREVIATION from SCHOOLS where storedgrades.SCHOOLID=SCHOOL_NUMBER) School, COUNT(*)
from storedgrades
where storecode <> 'F1'
and earnedcrhrs <> 0
--and termid like '30%'
group by schoolid
order by 2 desc
;
select * from STOREDGRADES
;
--Ridge View
select 
(select student_number from students where students.id = STOREDGRADES.studentid) studentID, 
termid, course_name, storecode, potentialcrhrs, earnedcrhrs, datestored
from storedgrades
where storecode <> 'F1'
and earnedcrhrs <> 0
and schoolid = 84
and termid like '30%'