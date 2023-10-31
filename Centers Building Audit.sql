/*cfi, cfk, cfk-n, cfa buidling code should not be on any students not at that school. run query for students affected and remove building code*/

select student_number 
from students 
where
(building = 'CFI' AND schoolid <> 82)
OR (building = 'CFK' AND schoolid <> 78)
OR (building = 'CFKN' AND schoolid <> 98)
OR (building = 'CFA' AND schoolid <> 91)
;
select schoolid, student_number, grade_level, building, enroll_status
from students 
where
((schoolid = 82 AND grade_level < 6)
OR (schoolid = 78 AND grade_level < 6)
OR (schoolid = 98 AND grade_level < 6)
OR (schoolid = 91 AND grade_level < 6))
AND enroll_status = 0
AND building is null


