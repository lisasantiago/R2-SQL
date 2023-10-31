SELECT 
    ps.students.student_number, s_sc_stu_cate_c.*, ps.students.lastfirst, ps.students.grade_level 
FROM 
    s_sc_stu_cate_c 
    INNER JOIN ps.students ON ps.students.dcid = s_sc_stu_cate_c.studentsdcid