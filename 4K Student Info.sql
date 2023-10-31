SELECT 
    TO_CHAR(student_number) StudentID,
    students.lastfirst Name,
    (select abbreviation from schools where students.schoolid = schools.school_number) School,
    teachers.preferredname Teacher,
    to_char(dob,'mm/dd/yyyy') "Date of Birth",
    gender Gender,
    students.ethnicity "Race/Ethnicity",
    S_SC_STU_X.Engl_Prof "English Language Status", 
    S_SC_STU_X.InstrSetting "Special Education Services"
FROM students
JOIN S_SC_STU_X
    ON students.dcid = S_SC_STU_X.studentsdcid
JOIN CC
  ON students.ID = CC.STUDENTID
JOIN SECTIONS 
  ON sections.ID=CC.SECTIONID 
JOIN TEACHERS
  ON teachers.ID = CC.TEACHERID
WHERE students.grade_level = -1
AND enroll_status < 1
AND cc.course_number = '08960000'
;
SELECT * FROM S_SC_STU_X
