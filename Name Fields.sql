
--returns students whose preferred and legal names do not match and the preferred name/gen field is not populated
SELECT schoolid, student_number,
first_name, middle_name, last_name, studentgeneration, gender, --preferred name/gender
PSCORE_LEGAL_FIRST_NAME, PSCORE_LEGAL_MIDDLE_NAME, PSCORE_LEGAL_LAST_NAME, PSCORE_LEGAL_SUFFIX, PSCORE_LEGAL_GENDER --legal name
FROM students
JOIN studentcorefields on students.dcid = studentcorefields.studentsdcid
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
JOIN U_StudentsUserFields on students.dcid = U_StudentsUserFields.studentsdcid
WHERE 
(first_name <> PSCORE_LEGAL_FIRST_NAME OR
middle_name <> PSCORE_LEGAL_MIDDLE_NAME OR
last_name <> PSCORE_LEGAL_LAST_NAME)
AND R_PREF_NAMEGEN is null
AND schoolid <> 999999
AND students.enroll_status < 1
ORDER BY schoolid, last_name
;
SELECT * FROM studentcorefields;
SELECT * FROM s_sc_stu_x;
SELECT * FROM U_StudentsUserFields;
