SELECT studentsdcid, dcid, student_number, lastfirst, r_form, r_year
FROM u_registration_forms
JOIN students on u_registration_forms.studentsdcid = students.dcid
;
SELECT COUNT(studentsdcid), studentsdcid, student_number, lastfirst, r_year FROM u_registration_forms
JOIN students on u_registration_forms.studentsdcid = students.dcid
GROUP BY studentsdcid, student_number, lastfirst, r_year
HAVING COUNT(studentsdcid) > 1
ORDER BY lastfirst
;
SELECT u_registration_forms.id, studentsdcid, dcid, student_number, lastfirst, r_form, r_year, whencreated
FROM u_registration_forms
JOIN students on u_registration_forms.studentsdcid = students.dcid
WHERE studentsdcid = &dcid
;
SELECT DISTINCT(r_year) FROM u_registration_forms
ORDER BY 1 desc
;
SELECT r_form,  r_year, COUNT(r_form) 
FROM u_registration_forms
--WHERE r_form = 'AR'
GROUP BY r_form, r_year
ORDER BY r_form, r_year desc 
;

SELECT dcid, student_number, lastfirst, grade_level FROM students
WHERE student_number in (95392,98678,96909,94819,95213,95682,95509,95580,96858,94859,95743,97840,91289,91292,91300,91291,91308,91319,91306)