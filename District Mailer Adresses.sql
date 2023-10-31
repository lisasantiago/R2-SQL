SELECT street, city, state, zip, (SELECT written_commun_lang FROM s_sc_stu_x WHERE students.dcid = s_sc_stu_x.studentsdcid AND written_commun_lang = 'SPN') Spanish_Translation
FROM students
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE enroll_status < 1
;
SELECT * FROM s_sc_stu_x;
SELECT * FROM students;
SELECT * FROM U_StudentsUserFields;

--count of instances of exact street address
SELECT count(street), street, count(schoolid), (select abbreviation from schools where students.schoolid = schools.school_number) school
FROM students
WHERE enroll_status < 1
GROUP BY street, schoolid
ORDER BY 1 desc
;
SELECT schoolid, student_number, street, city, state, zip, r_rup
FROM students
JOIN U_StudentsUserFields on students.dcid = u_studentsuserfields.studentsdcid
WHERE enroll_status < 1
AND street = '8565 Old Percival Rd'
ORDER BY 1 desc
