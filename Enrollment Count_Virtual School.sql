-- Created to see how many elem students in virtual school for honor roll report sql. 
select grade_level,
count(grade_level)
from students 
where building = 'R2eS'
and enroll_status = 0
AND grade_level < 6
group by rollup (grade_level)
