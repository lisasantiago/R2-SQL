SELECT grade_level, COUNT(length(student_number)) FROM students
WHERE length(student_number) = 12
AND enroll_status = 0
GROUP BY grade_level
ORDER BY 1