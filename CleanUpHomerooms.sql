select count(*), home_room 
from students 
where schoolid=100 and ENROLL_STATUS = 0
GROUP BY ROLLUP (home_room)