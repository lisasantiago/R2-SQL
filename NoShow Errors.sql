--entrydate>exitdate (students)
select 
    (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,     student_number,     lastfirst,     exitcode,     entrydate,     exitdate,     'EntryDate > ExitDate' 
from students
where entrydate>exitdate
order by 1
;
--not NS exitcode (students)
select 
    (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School,     student_number,     lastfirst,     exitcode,     entrydate,     exitdate,     'Change withdrawal code to NS' 
from students
where entrydate=exitdate
and schoolid<999999
and nvl(exitcode,1) not in('NS','GC')
and enroll_status>0
;
--NS date mismatch (students)
select schoolid, (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, student_number, lastfirst, entrydate, exitdate, 'EntryDate and ExitDate must be the same.' from students
where entrydate<>exitdate
and schoolid<999999
and exitcode='NS'
--and schoolid = &schoolid
ORDER BY schoolid
;
--not NS exitcode (Reenrollments)
select schoolid, (select ABBREVIATION from SCHOOLS where reenrollments.SCHOOLID=SCHOOL_NUMBER) School, (select student_number from students where students.id = reenrollments.studentid) Student_Number, (select lastfirst from students where students.id = reenrollments.studentid) LastFirst, entrydate, exitdate, 'Change withdrawal code to NS.' from reenrollments
where entrydate=exitdate
and schoolid<999999
and nvl(exitcode,1) not in('NS','GC')
;
--entrydate>exitdate (reenrollments)
select schoolid, (select ABBREVIATION from SCHOOLS where reenrollments.SCHOOLID=SCHOOL_NUMBER) School, (select student_number from students where students.id = reenrollments.studentid) Student_Number, (select lastfirst from students where students.id = reenrollments.studentid) LastFirst, entrydate, exitdate, 'EntryDate > ExitDate' from reenrollments
where entrydate>exitdate
;

--NS date mismatch (reenrollments)
select schoolid, (select ABBREVIATION from SCHOOLS where reenrollments.SCHOOLID=SCHOOL_NUMBER) School, (select student_number from students where students.id = reenrollments.studentid) Student_Number, (select lastfirst from students where students.id = reenrollments.studentid) LastFirst, entrydate, exitdate, 'EntryDate and ExitDate must be the same.' from reenrollments
where entrydate<>exitdate
and schoolid<999999
and exitcode='NS'
;

