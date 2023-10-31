--sql to return info on students linked on the Family page
SELECT 

--data on student
    students.student_number,
    students.lastfirst,

--related person
--ps.relationship.relatedperson_id,
    (SELECT lastfirst from students where ps.relationship.relatedperson_id = students.person_id)
FROM students 
INNER JOIN ps.relationship ON students.person_id = ps.relationship.person_id
--WHERE students.schoolid = 92
--AND students.enroll_status = 0
AND ps.relationship.relatedperson_id 
        NOT IN 

--All active BH students with family members linked
        (SELECT 
    students.person_id
FROM students 
INNER JOIN ps.relationship ON students.person_id = ps.relationship.person_id
WHERE
    students.enroll_status = 0
    AND students.schoolid = 92
    AND ps.relationship.relatedperson_id IS NOT NULL)
ORDER BY lastfirst