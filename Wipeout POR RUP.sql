update U_StudentsUserFields
set 
    r_rup = null, 
    r_proof_of_residency = null
where studentsdcid in (select dcid from students where enroll_status = 0 and entrydate < '01-FEB-2023')
;
select * from u_studentsuserfields
;
select entrydate from students
;
