SELECT count(*)
schoolid, 
(select name from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER)

FROM
    s_sc_stu_contacts_x INNER JOIN ps.students ON s_sc_stu_contacts_x.studentsdcid = ps.students.dcid 

WHERE 
    s_sc_stu_contacts_x.cnta1_custody = 0
    and enroll_status < 1
GROUP BY ROLLUP
    (schoolid)
ORDER BY 1 desc