update S_SC_STU_X
set Oral_Commun_Lang = 'PRT'
where studentsdcid in (388065)
;
--find students with blanks using student_number, then copy studentsdcid to use in update sql
select s_sc_stu_x.studentsdcid, student_number, Oral_Commun_Lang, Written_Commun_Lang from S_SC_STU_X
join students on s_sc_stu_x.studentsdcid = students.dcid
where student_number in (85292)
and Written_Commun_Lang is null