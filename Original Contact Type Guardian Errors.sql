select 
(select abbreviation from schools where s.schoolid = schools.school_number) school,
  s.student_number,
  s.lastfirst,
  s.grade_level,
  to_char (s.entrydate),
  (select abbreviation from schools where r.schoolid=school_number) "Prev School",
  guardianemail
from students s 
left join 
  (select studentid, 
    entrydate, 
    schoolid, 
    row_number() over (partition by studentid order by entrydate desc) rn
  from reenrollments
  where entrydate >= '08-AUG-23'
  and entrydate<>exitdate) r 
on s.id = r.studentid
where s.enroll_status <1
and (r.rn=1 or r.entrydate is null)
and guardianemail is not null
;
--Counts
select (select abbreviation from schools where s.schoolid = schools.school_number) school, COUNT(*)
from students s 
left join 
  (select studentid, 
    entrydate, 
    schoolid, 
    row_number() over (partition by studentid order by entrydate desc) rn
  from reenrollments
  where entrydate >= '08-AUG-23'
  and entrydate<>exitdate) r 
on s.id = r.studentid
where s.enroll_status <1
and (r.rn=1 or r.entrydate is null)
and guardianemail is not null
GROUP BY s.schoolid
ORDER BY 2 desc
;
select 
(select abbreviation from schools where students.schoolid = schools.school_number) school,
  students.student_number,
students.lastfirst
from students
where students.enroll_status <1
and guardianemail is not null
;
--guardian name .
SELECT COUNT(*) 
FROM students 
JOIN StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
WHERE guardian_fn = '.'
;
UPDATE StudentCoreFields
SET guardian_fn = ''
WHERE guardian_fn = '.'
;
SELECT * FROM StudentCoreFields
;.guardian_fn