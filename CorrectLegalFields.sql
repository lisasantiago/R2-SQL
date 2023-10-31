--Check all fields
select to_char(student_number) StudentID, 
 first_name, PSCORE_LEGAL_FIRST_NAME, 
 middle_name, PSCORE_LEGAL_MIDDLE_NAME, 
 last_name, PSCORE_LEGAL_LAST_NAME, 
 s_sc_stu_x.studentgeneration, pscore_legal_suffix, 
 gender, pscore_legal_gender
 from studentcorefields
 join students on studentcorefields.studentsdcid = students.dcid
 join s_sc_stu_x on s_sc_stu_x.studentsdcid = students.dcid
 where ((PSCORE_LEGAL_LAST_NAME is null AND students.last_name is not null)
or (PSCORE_LEGAL_FIRST_NAME IS NULL AND students.first_name is not null)
OR (PSCORE_LEGAL_MIDDLE_NAME IS NULL AND students.middle_name is not null)
OR (studentcorefields.pscore_legal_suffix is null and s_sc_stu_x.studentgeneration is not null)
or studentcorefields.pscore_legal_gender is null)
and students.enroll_status = 0
--and student_number in (75022,88463,88462,88460,88461,73179,76947,88459,19725,88458,88457,88456,88455,88454,88453,88452,52183,88451,88450,88449,57794,60053,88448,88447,88446,88444,88445,88443,88442,88441,29512,75076,76211,88439,88438,88437,88436,88435,88434,88433,88432,75451,71720,88431,67313,88430,14703,88429,88428,72008,35986,79695,79693,79694,88427,88426,88425,88424,80919,88423,88422,80220,88421,88420,88419,60652,88418)
;
--***LAST NAME
    -- 1. Run this query to find any records with errors:
    select dcid/*, student_number,
    last_name, studentcorefields.pscore_legal_last_name,
    first_name, studentcorefields.pscore_legal_first_name,
    gender, studentcorefields.pscore_legal_gender, 
    (select s_sc_stu_x.othername from s_sc_stu_x where students.dcid = s_sc_stu_x.studentsdcid) alias*/
    FROM students
    join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
    WHERE students.last_name <> PSCORE_LEGAL_LAST_NAME
    OR PSCORE_LEGAL_LAST_NAME is null
    and students.enroll_status = 0
    ;
    -- 2. Plug the dcid's into this update query. 
    UPDATE StudentCoreFields 
    SET PSCORE_LEGAL_LAST_NAME = (select last_name from students where students.dcid = StudentCoreFields.studentsdcid)
    WHERE studentsdcid in ('204202','270777','272072','278208','298215','359168','392946','401557','392059','402653','392268','314217','349927','369305','393068','391942','395453','214805','316256','355607','357909','372504','387707','30776','393218','80355','166905','215758','372503','372505','390065','359504','391924','392921','149603','293102','314082','183755','314587','287709','392054','392459','88621','149712','386025','327752','392595','394005','278156','312920','384527','387828','391509','397502')
    ;
--***FIRST NAME
    -- 1. Run this query to find any records with errors:
    select dcid/*, student_number,
    last_name, studentcorefields.pscore_legal_last_name,
    first_name, studentcorefields.pscore_legal_first_name,
    gender, studentcorefields.pscore_legal_gender, 
    (select s_sc_stu_x.othername from s_sc_stu_x where students.dcid = s_sc_stu_x.studentsdcid) alias*/
    FROM students
    join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
    WHERE students.first_name <> PSCORE_LEGAL_FIRST_NAME
    ;
    -- 2. Plug the dcid's into this update query. 
    UPDATE StudentCoreFields 
    SET PSCORE_LEGAL_FIRST_NAME = (select first_name from students where students.dcid = StudentCoreFields.studentsdcid)
    WHERE studentsdcid in ('32756','32788','53405','134263','126368','143359','146186','153020','271668','311517','288239','297952','315952','314217','357737','349927','372503','385255','217801','392947','396456','396455','395354','392251','392426','393556','394152','395302','52521','392963','392088','392211','392244','393603','392844','392928','395052','395352')
    ;
--***MIDDLE NAME
    -- 1. Run this query to find any records with errors:
    select dcid/*, student_number,
    last_name, studentcorefields.pscore_legal_last_name,
    first_name, studentcorefields.pscore_legal_first_name,
    gender, studentcorefields.pscore_legal_gender, 
    (select s_sc_stu_x.othername from s_sc_stu_x where students.dcid = s_sc_stu_x.studentsdcid) alias*/
    FROM students
    join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
    WHERE students.middle_name <> PSCORE_LEGAL_MIDDLE_NAME
    ;
    -- 2. Plug the dcid's into this update query. 
    UPDATE StudentCoreFields 
    SET PSCORE_LEGAL_MIDDLE_NAME = (select middle_name from students where students.dcid = StudentCoreFields.studentsdcid)
    WHERE studentsdcid in ('392565','126904','393406','314047','314048','391927','177001','392118','395903','396502','399452','396152','392258','399108','392592','399303','395352','392809')
    ;
--***SUFFIX
    -- 1. Run this query to find any records with errors:
    select dcid, student_number,
    last_name, studentcorefields.pscore_legal_last_name,
    first_name, studentcorefields.pscore_legal_first_name,
    --s_sc_stu_x.studentgeneration, pscore_legal_suffix, 
    gender, studentcorefields.pscore_legal_gender, 
    (select s_sc_stu_x.othername from s_sc_stu_x where students.dcid = s_sc_stu_x.studentsdcid) alias
    FROM students
    join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
    JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
    WHERE s_sc_stu_x.studentgeneration <> PSCORE_LEGAL_SUFFIX
    ;
    -- 2. Plug the dcid's into this update query. 
    UPDATE StudentCoreFields 
    SET PSCORE_LEGAL_SUFFIX = (select studentgeneration from s_sc_stu_x where s_sc_stu_x.dcid = StudentCoreFields.studentsdcid)
    WHERE studentsdcid in 
    ;
--***GENDER
    -- 1. Run this query to find any records with errors:
    select dcid, student_number,
    last_name, studentcorefields.pscore_legal_last_name,
    first_name, studentcorefields.pscore_legal_first_name,
    gender, studentcorefields.pscore_legal_gender, 
    (select s_sc_stu_x.othername from s_sc_stu_x where students.dcid = s_sc_stu_x.studentsdcid) alias
    FROM students
    join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
    WHERE students.gender <> PSCORE_LEGAL_GENDER
    ;
    -- 2. Plug the dcid's into this update query. 
    UPDATE StudentCoreFields 
    SET PSCORE_LEGAL_GENDER = (select gender from students where students.dcid = StudentCoreFields.studentsdcid)
    WHERE studentsdcid in ('285333','303802')
    ;