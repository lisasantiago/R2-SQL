UPDATE s_sc_stu_x
SET 
dropout_date = null,
dropout_reason = null,
moved_to_district = null,
moved_to_school = null,
noshow_reason = null
where studentsdcid in 
(select dcid from students where s_sc_stu_x.studentsdcid = students.dcid and enroll_status = 0)
and (dropout_reason is not null
OR moved_to_district is not null
OR moved_to_school is not null
OR noshow_reason is not null)

;
select
students.dcid,
student_number,
lastfirst,
to_char(dropout_date),
dropout_reason,
moved_to_district,
moved_to_school,
noshow_reason
from s_sc_stu_x
join students on s_sc_stu_x.studentsdcid = students.dcid
where enroll_status = 0
and 
(dropout_date is not null OR
dropout_reason is not null OR
moved_to_district is not null OR
moved_to_school is not null OR
noshow_reason is not null
)
--AND schoolid = ~(curschoolid)
;
SELECT * FROM s_sc_stu_x;

select
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), count(schoolid)
from s_sc_stu_x
join students on s_sc_stu_x.studentsdcid = students.dcid
where enroll_status = 0
and 
(dropout_date is not null OR
dropout_reason is not null OR
moved_to_district is not null OR
moved_to_school is not null OR
noshow_reason is not null
)
GROUP BY students.schoolid
order by 2 desc