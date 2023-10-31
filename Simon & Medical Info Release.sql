SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, student_number, lastfirst, grade_level, TO_CHAR(dob), R_IMMUNREGISTRY, r_medrelease 
FROM PS.u_healthinfo
JOIN students on students.dcid = ps.u_healthinfo.studentsdcid
JOIN u_studentsuserfields on students.dcid = u_studentsuserfields.studentsdcid
--WHERE (R_IMMUNREGISTRY = 1 OR r_medrelease = 1)
WHERE R_IMMUNREGISTRY = 1
AND enroll_status < 1
AND grade_level != 13
--AND students.schoolid =
--  Decode(~(curSchoolID),0,students.SCHOOLID,~(curSchoolID))
;
SELECT * FROM u_studentsuserfields;
SELECT * FROM u_healthinfo;