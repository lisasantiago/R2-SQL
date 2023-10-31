--Removed Receives Mail

SELECT 
    students.dcid,
    (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
    student_number,
    lastfirst,
    cnt1_fname || ' ' || cnt1_lname,
    cnt1_rel,
    DECODE (cnta1_custody + cnt1_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt2_fname || ' ' || cnt2_lname,
    cnt2_rel,
    DECODE (cnt2_custody + cnt2_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt3_fname || ' ' || cnt3_lname,
    cnt3_rel,
    DECODE (cnt3_custody + cnt3_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt4_fname || ' ' || cnt4_lname,
    cnt4_rel,
    DECODE (cnt4_custody + cnt4_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt5_fname || ' ' || cnt5_lname,
    cnt5_rel,
    DECODE (cnt5_custody + cnt5_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt6_fname || ' ' || cnt6_lname,
    cnt6_rel,
    DECODE (cnt6_custody + cnt6_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt7_fname || ' ' || cnt7_lname,
    cnt7_rel,
   DECODE (cnt7_custody + cnt7_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt8_fname || ' ' || cnt8_lname,
    cnt8_rel,
    DECODE (cnt8_custody + cnt8_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt9_fname || ' ' || cnt9_lname,
    cnt9_rel,
    DECODE (cnt9_custody + cnt9_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked",
    cnt10_fname || ' ' || cnt10_lname,
    cnt10_rel,
    DECODE (cnt10_custody + cnt10_emerg_ind, 2, 'Custody and Emergency Checked') "Both Checked"
FROM students 
inner join ps.s_sc_stu_contacts_x on
students.dcid = ps.s_sc_stu_contacts_x.studentsdcid
WHERE 
     (
     (cnta1_custody = 1 AND cnt1_emerg_ind = 1)
     OR 
     (cnt2_custody = 1 AND cnt2_emerg_ind = 1)
     OR
     (cnt3_custody = 1 AND cnt3_emerg_ind = 1)
     OR
     (cnt4_custody = 1 AND cnt4_emerg_ind = 1)
     OR
     (cnt5_custody = 1 AND cnt5_emerg_ind = 1)
     OR
     (cnt6_custody = 1 AND cnt6_emerg_ind = 1)
     OR
     (cnt7_custody = 1 AND cnt7_emerg_ind = 1)
     OR
     (cnt8_custody = 1 AND cnt8_emerg_ind = 1)
     OR
     (cnt9_custody = 1 AND cnt9_emerg_ind = 1)
     OR
     (cnt10_custody = 1 AND cnt10_emerg_ind = 1)
     )
/*AND students.enroll_status < 1
AND SCHOOLID =  
  DECODE(~(curSchoolID),0,SCHOOLID,
    45,82,50,78,51,98,55,91,~(curSchoolID))
AND NVL(BUILDING,1) <> 'R2eS'
AND GRADE_LEVEL < 13*/