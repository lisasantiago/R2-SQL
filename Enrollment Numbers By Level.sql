--Enrollment by Level
SELECT count(*),
CASE 
    WHEN name like '%Elementary%' THEN 'Elementary'
    WHEN name like '%Middle%' THEN 'Middle'
    WHEN name like '%High%' THEN 'High'
END as "Level"
FROM students
JOIN schools on students.schoolid = schools.school_number
WHERE students.enroll_status = 0
GROUP BY ROLLUP
(CASE 
    WHEN name like '%Elementary%' THEN 'Elementary'
    WHEN name like '%Middle%' THEN 'Middle'
    WHEN name like '%High%' THEN 'High'
END)
ORDER BY 2
;
SELECT count(*),
CASE 
    WHEN name like '%Elementary%' THEN 'Elementary'
    WHEN name like '%Middle%' THEN 'Middle'
    WHEN name like '%High%' THEN 'High'
END as "Level",
schools.name
FROM students
JOIN schools on students.schoolid = schools.school_number
WHERE students.enroll_status = 0
GROUP BY (schools.name)
ORDER BY 2
;
SELECT 
CASE 
    WHEN name like '%Elementary%' THEN 'Elementary'
    WHEN name like '%Middle%' THEN 'Middle'
    WHEN name like '%High%' THEN 'High'
END as "Level"
FROM schools