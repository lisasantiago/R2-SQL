SELECT student_number, lastfirst, s_sc_stu_x.advisor, SUM(earnedcrhrs) 
FROM storedgrades
JOIN students on students.id = storedgrades.studentid
JOIN S_SC_STU_X on students.dcid = s_sc_stu_x.studentsdcid
WHERE students.schoolid = &schoolid -- prompt for schoolid
AND enroll_status < 1
and students.grade_level = &grade_level -- prompt for grade_level
HAVING SUM(earnedcrhrs) < &totalCredits -- prompt for total number of credits required
group by student_number, lastfirst, S_SC_STU_X.Advisor
;
