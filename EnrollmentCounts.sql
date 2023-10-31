select
  count(*) 
from ps_adaadm_defaults_all
where calendardate='19-MAR-2021'
and membershipvalue=1 
and schoolid=69
and studentid not in(
  select distinct studentid from cc where schoolid = 750 and course_number='08960000' and to_date('11/20/2019','mm/dd/yyyy') between dateenrolled and dateleft)
;
SELECT ps_adaadm_defaults_all.studentid, students.enroll_status, membershipvalue 
FROM ps_adaadm_defaults_all
JOIN students ON ps_adaadm_defaults_all.studentid = students.id
WHERE membershipvalue=1
--students.schoolid = 100
