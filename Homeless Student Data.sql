-- POR and Nigh Residence do not match
select distinct
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,
to_char(student_number) StudentID, lastfirst Name, grade_level Grade,
u_studentsuserfields.r_proof_of_residency POR, s_sc_stu_x.night_residence NightResidence
from u_studentsuserfields
join s_sc_stu_x on u_studentsuserfields.studentsdcid = s_sc_stu_x.studentsdcid
join students on u_studentsuserfields.studentsdcid = students.dcid
where 
(u_studentsuserfields.r_proof_of_residency = 'H' and s_sc_stu_x.night_residence is null)
OR
(u_studentsuserfields.r_proof_of_residency != 'H' and s_sc_stu_x.night_residence is not null)
and students.enroll_status = 0
;
--Student data for POR = H or night res not blank
select distinct
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,
to_char(student_number) StudentID, lastfirst Name, grade_level Grade,
u_studentsuserfields.r_proof_of_residency POR, s_sc_stu_x.night_residence NightResidence
from u_studentsuserfields
join s_sc_stu_x on u_studentsuserfields.studentsdcid = s_sc_stu_x.studentsdcid
join students on u_studentsuserfields.studentsdcid = students.dcid
where 
(u_studentsuserfields.r_proof_of_residency = 'H'  OR s_sc_stu_x.night_residence is not null)
and students.enroll_status = 0
;