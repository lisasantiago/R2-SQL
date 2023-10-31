--courses for one teacher
select * 
from storedgrades
where termid like '30%'
and storecode = 'F1'
and schoolid = 91
and teacher_name = 'Smith, Ervina M'
and potentialcrhrs > 0
and course_number like '41140%'
;
--delete grades for a specific course and teacher Williams, Damian L['4122%', '4114%']
delete from storedgrades
where termid like '30%'
and storecode = 'F1'
and schoolid = 91
and teacher_name = 'Williams, Damian L'
and potentialcrhrs > 0
and course_number like '4114%'
;
select count (*), course_number
from storedgrades
where termid like '30%'
and storecode = 'F1'
and schoolid = 91
group by course_number
having count(course_number) > 1
;
--Find duplicate F1 grades
select course_number,  studentid, 
(select student_number from students where storedgrades.studentid = students.id) StudentNumber,
count(*)
from storedgrades
where termid like '30%'
and storecode = 'F1'
and schoolid = 91
and earnedcrhrs > 0
group by course_number, studentid
having count(*) > 1
order by 1, 4, 3
;
--Smith, Ervina Muldrow[41140ZCW.6], Gilbert, Melissa E[41140ZCW.5], Patrick, Charles C[41140ZCW.100]
delete from storedgrades 
where course_number = '41140ZCW'
and termid like '30%'
and storecode = 'F1'
and schoolid = 91
and potentialcrhrs > 0
and teacher_name = 'Smith, Ervina Muldrow'
and sectionid = '411503'
;
select teacher_name, course_number, sectionid, (select section_number from sections where storedgrades.sectionid = sections.id) section#
from storedgrades
where course_number = '41140ZCW'
and termid like '30%'
and storecode = 'F1'
and schoolid = 91
and potentialcrhrs > 0
and teacher_name = 'Smith, Ervina Muldrow'
and sectionid = '411503'
;
select * from sections
;
select * from storedgrades

