SELECT schoolid, student_number, grade_level, Sched_NextYearGrade 
FROM students
WHERE grade_level = Sched_NextYearGrade and enroll_status < 1
and schoolid not in (999999,43,99) and schoolid = 72
order by 1, 3
;
SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, count(schoolid)
FROM students
WHERE (grade_level = Sched_NextYearGrade OR grade_level != (Sched_NextYearGrade - 1) )
and enroll_status < 1 and schoolid not in (999999,43,99) and Sched_NextYearGrade != 99
group by schoolid
order by 2 desc
;
SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, sched_nextyeargrade
FROM students
WHERE grade_level = 12 and enroll_status < 1 
/*(grade_level = Sched_NextYearGrade OR grade_level != (Sched_NextYearGrade - 1) )
and enroll_status < 1 and schoolid not in (999999,43,99) and Sched_NextYearGrade != 99*/
order by 2 desc
;
SELECT (select abbreviation from schools where students.schoolid = schools.school_number), student_number, lastfirst, grade_level, sched_nextyeargrade
FROM students
WHERE (Sched_NextYearGrade = grade_level OR Sched_NextYearGrade != (grade_level + 1) )
and enroll_status < 1 and schoolid not in (999999,43,99) and (grade_level != 12 AND Sched_NextYearGrade != 99)
AND SCHOOLID =  
  DECODE(~(curSchoolID),0,SCHOOLID,
    45,82,50,78,51,98,55,91,~(curSchoolID))
order by 1,4,3 asc
;