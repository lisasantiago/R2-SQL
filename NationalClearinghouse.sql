SELECT 
ps.students.first_name, ps.students.middle_name, ps.students.last_name, ps.s_sc_stu_x.studentgeneration, ps.students.dob, to_char(ps.students.student_number), ps.s_sc_stu_x.diploma_type, ps.students.gender, ps.students.fedethnicity, ps.students.ethnicity, ps.students.lunchstatus, ps.s_sc_stu_x.first_lang_spoken, ps.s_sc_stu_x.instrsetting, ps.students.lastfirst, ps.students.grade_level, ps.students.schoolid, 
DECODE(ps.students.graduated_schoolid, '100', 'Westwood High School'),
TO_CHAR(ps.s_sc_stu_x.graddate, 'mm/dd/yyyy') 
FROM ps.students INNER JOIN ps.s_sc_stu_x ON ps.students.dcid = ps.s_sc_stu_x.studentsdcid 
WHERE ps.students.schoolid = 999999 AND ps.students.graduated_schoolid = 100 AND ps.s_sc_stu_x.graddate = '05-JUN-20' ORDER BY ps.students.lastfirst