SELECT
   students.dcid, 
   (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
   students.student_number, 
   CHR(60) || 'a href=/admin/students/state/usa_sc/SC_Student_Contacts.html?frn=' || '001' || DCID || ' target=_blank'  || CHR(62) || students.lastfirst || CHR(60) || '/a'  || CHR(62),
    CASE 
        WHEN (s_sc_stu_contacts_x.cnt1_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt1_lname IS NULL OR s_sc_stu_contacts_x.cnt1_fname IS NULL)) 
            THEN 'Contact 1' 
        WHEN (s_sc_stu_contacts_x.cnt2_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt2_lname IS NULL OR s_sc_stu_contacts_x.cnt2_fname IS NULL)) 
            THEN 'Contact 2'  
        WHEN (s_sc_stu_contacts_x.cnt3_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt3_lname IS NULL OR s_sc_stu_contacts_x.cnt3_fname IS NULL)) 
            THEN 'Contact 3'  
        WHEN (s_sc_stu_contacts_x.cnt4_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt4_lname IS NULL OR s_sc_stu_contacts_x.cnt4_fname IS NULL)) 
            THEN 'Contact 4'  
        WHEN (s_sc_stu_contacts_x.cnt5_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt5_lname IS NULL OR s_sc_stu_contacts_x.cnt5_fname IS NULL)) 
            THEN 'Contact 5'  
        WHEN (s_sc_stu_contacts_x.cnt6_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt6_lname IS NULL OR s_sc_stu_contacts_x.cnt6_fname IS NULL)) 
            THEN 'Contact 6'  
        WHEN (s_sc_stu_contacts_x.cnt7_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt7_lname IS NULL OR s_sc_stu_contacts_x.cnt7_fname IS NULL)) 
            THEN 'Contact 7'  
        WHEN (s_sc_stu_contacts_x.cnt8_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt8_lname IS NULL OR s_sc_stu_contacts_x.cnt8_fname IS NULL)) 
            THEN 'Contact 8'  
        WHEN (s_sc_stu_contacts_x.cnt9_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt9_lname IS NULL OR s_sc_stu_contacts_x.cnt9_fname IS NULL)) 
            THEN 'Contact 9'  
        WHEN (s_sc_stu_contacts_x.cnt10_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt10_lname IS NULL OR s_sc_stu_contacts_x.cnt10_fname IS NULL)) 
            THEN 'Contact 10' 
    END contact 
FROM s_sc_stu_contacts_x INNER JOIN students ON s_sc_stu_contacts_x.studentsdcid = students.dcid 
WHERE 
    CASE 
        WHEN (s_sc_stu_contacts_x.cnt1_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt1_lname IS NULL OR s_sc_stu_contacts_x.cnt1_fname IS NULL)) 
            THEN 'Contact 1' 
        WHEN (s_sc_stu_contacts_x.cnt2_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt2_lname IS NULL OR s_sc_stu_contacts_x.cnt2_fname IS NULL)) 
            THEN 'Contact 2'  
        WHEN (s_sc_stu_contacts_x.cnt3_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt3_lname IS NULL OR s_sc_stu_contacts_x.cnt3_fname IS NULL)) 
            THEN 'Contact 3'  
        WHEN (s_sc_stu_contacts_x.cnt4_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt4_lname IS NULL OR s_sc_stu_contacts_x.cnt4_fname IS NULL)) 
            THEN 'Contact 4'  
        WHEN (s_sc_stu_contacts_x.cnt5_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt5_lname IS NULL OR s_sc_stu_contacts_x.cnt5_fname IS NULL)) 
            THEN 'Contact 5'  
        WHEN (s_sc_stu_contacts_x.cnt6_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt6_lname IS NULL OR s_sc_stu_contacts_x.cnt6_fname IS NULL)) 
            THEN 'Contact 6'  
        WHEN (s_sc_stu_contacts_x.cnt7_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt7_lname IS NULL OR s_sc_stu_contacts_x.cnt7_fname IS NULL)) 
            THEN 'Contact 7'  
        WHEN (s_sc_stu_contacts_x.cnt8_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt8_lname IS NULL OR s_sc_stu_contacts_x.cnt8_fname IS NULL)) 
            THEN 'Contact 8'  
        WHEN (s_sc_stu_contacts_x.cnt9_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt9_lname IS NULL OR s_sc_stu_contacts_x.cnt9_fname IS NULL)) 
            THEN 'Contact 9'  
        WHEN (s_sc_stu_contacts_x.cnt10_rel IS NOT NULL AND (s_sc_stu_contacts_x.cnt10_lname IS NULL OR s_sc_stu_contacts_x.cnt10_fname IS NULL)) 
            THEN 'Contact 10' 
    END IS NOT NULL 
AND students.schoolid <> '999999' 
AND students.grade_level <> 13 AND students.enroll_status IN (0, -1)
AND students.SchoolID =
  Decode(~(curSchoolID),0,students.SCHOOLID,~(curSchoolID))
ORDER BY students.lastfirst