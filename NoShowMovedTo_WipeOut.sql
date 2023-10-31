--Check for data
select student_number, entrydate from s_sc_stu_x, students
where s_sc_stu_x.studentsdcid = students.dcid
    and (moved_to_school is not null
            or moved_to_district is not null
            or noshow_reason is not null)
    and enroll_status < 1 
    and schoolid <> 43
    order by 2
;
--Delete data in moved_to_district
UPDATE s_sc_stu_x
SET moved_to_district = NULL
WHERE moved_to_district is not null
AND studentsdcid in(select dcid from students where enroll_status < 1 and schoolid <> 43)
;
--Delete data in moved_to_school
UPDATE s_sc_stu_x
SET moved_to_school = NULL
WHERE moved_to_school is not null
AND studentsdcid in(select dcid from students where enroll_status < 1 and schoolid <> 43)
;
--Delete data in noshow_reason
UPDATE s_sc_stu_x
SET noshow_reason = NULL
WHERE noshow_reason is not null
AND studentsdcid in(select dcid from students where enroll_status < 1 and schoolid <> 43);
;