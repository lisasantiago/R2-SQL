SELECT schoolid, lastfirst, student_number, 
user_field1,
R_EXTDAY,
R_EXTDAY_TRANS
FROM S_SC_STU_DEPRECATED_USER_X
JOIN students on students.dcid = S_SC_STU_DEPRECATED_USER_X.studentsdcid
JOIN U_StudentsUserFields on students.dcid = U_StudentsUserFields.studentsdcid
WHERE user_field1 is not null
AND u_studentsuserfields.r_extday is null
;
SELECT * FROM U_COVID;
SELECT * FROM U_StudentsUserFields;
