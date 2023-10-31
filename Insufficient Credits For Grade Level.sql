  SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, student_number, lastfirst, students.grade_level, SUM(storedgrades.earnedcrhrs) credits
  FROM storedgrades
  JOIN students on students.id = storedgrades.studentid
  WHERE students.schoolid = 100 AND students.grade_level = 10  and students.enroll_status < 1
 GROUP BY students.schoolid, student_number, lastfirst, students.grade_level
 HAVING SUM(storedgrades.earnedcrhrs) < 6
 UNION
 SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, student_number, lastfirst, students.grade_level, SUM(storedgrades.earnedcrhrs) credits
  FROM storedgrades
  JOIN students on students.id = storedgrades.studentid
  WHERE students.schoolid = 100 AND students.grade_level = 11  and students.enroll_status < 1
 GROUP BY students.schoolid, student_number, lastfirst, students.grade_level
 HAVING SUM(storedgrades.earnedcrhrs) < 10
 UNION
 SELECT (select abbreviation from schools where students.schoolid = schools.school_number) school, student_number, lastfirst, students.grade_level, SUM(storedgrades.earnedcrhrs) credits
  FROM storedgrades
  JOIN students on students.id = storedgrades.studentid
  WHERE students.schoolid = 100 AND students.grade_level = 12  and students.enroll_status < 1
 GROUP BY students.schoolid, student_number, lastfirst, students.grade_level
 HAVING SUM(storedgrades.earnedcrhrs) < 16
 ORDER BY 3
  ;
  SELECT * FROM students;
  SELECT * FROM storedgrades;