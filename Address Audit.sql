SELECT street, count(street)
FROM students
WHERE
enroll_status = 0
GROUP BY street
HAVING count(street) > 3
ORDER BY 2 desc