SELECT students.dcid,
students.student_number,
students.last_name, PSCORE_LEGAL_LAST_NAME,
students.first_name, PSCORE_LEGAL_FIRST_NAME,
students.middle_name, PSCORE_LEGAL_MIDDLE_NAME,
students.gender, pscore_legal_gender 
FROM students
join StudentCoreFields on students.dcid = StudentCoreFields.studentsdcid
WHERE students.last_name <> PSCORE_LEGAL_LAST_NAME
--and student_number in (87494,72619,12442,55110,87493,87492,24979,87491,87490,87489,87488,87487,87486,81595,25723,87485,87484,87483,87482,83820,64221,87481,87480,87479,71314,87478,87477,73426,82472,60471,51613,81175)
;
SELECT gender FROM students where student_number = &studentid
