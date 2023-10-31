SELECT abbreviation, count(schoolid) FROM sections
join schools on sections.schoolid = schools.school_number
where termid = '3200'
and course_number = '08960000'
and dependent_secs not like '%17999000%'
and name like '%Elementary%'
group by abbreviation, schoolid
order by 1
;
SELECT * FROM sections;
SELECT * FROM schools;