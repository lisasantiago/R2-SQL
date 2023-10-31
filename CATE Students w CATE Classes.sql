SELECT DISTINCT
  Students.Student_Number,
  Students.First_Name,
  Students.Last_Name,
  students.grade_level,
  Courses.Course_Name,
  Courses.Course_Number
FROM Students
JOIN CC
  ON Students.ID = CC.StudentID
JOIN Courses
ON Courses.Course_Number=CC.Course_Number
WHERE (CC.Course_Number LIKE '5%'
    OR CC.Course_Number LIKE '6%')
AND Students.ID IN(
  SELECT
    Students.ID
  FROM Students
   JOIN CC
    ON Students.ID = CC.StudentID
  WHERE (CC.Course_Number LIKE '5%'
    OR CC.Course_Number LIKE '6%')
  AND Students.SchoolID = 100
  AND Students.Enroll_Status = 0
  AND Students.Grade_Level > 10
  GROUP BY Students.ID
  HAVING COUNT(*)>1)