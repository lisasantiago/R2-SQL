select * from ps.U_COVID;
SELECT distinct r_extday FROM u_studentsuserfields;

SELECT schoolid, (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, count(r_extday) 
FROM u_studentsuserfields
join students on u_studentsuserfields.studentsdcid = students.dcid
where r_extday is not null
group by schoolid
--Having count(r_extday) <1
order by 3 desc
;
select students.student_number, r_extday
FROM u_studentsuserfields
join students on u_studentsuserfields.studentsdcid = students.dcid
where students.enroll_status = 0
and students.student_number = &studentid

