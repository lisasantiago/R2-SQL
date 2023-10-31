select to_char(exitdate, 'MM'), dcid, (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, exitdate, exitcode 
from students 
where schoolid != 999999
AND (exitdate > '31-JAN-2021' AND exitdate < '19-AUG-2021')
GROUP BY to_char(exitdate, 'MM')
;


