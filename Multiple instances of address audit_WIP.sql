SELECT 
    TO_CHAR(students.STUDENT_NUMBER),
    students.LASTFIRST,
    students.GRADE_LEVEL,
    students.STREET,
    PS.STUDENTCOREFIELDS.GUARDIAN_LN,
    U_StudentsUserFields.r_proof_of_residency

FROM 
    students
    INNER JOIN PS.STUDENTCOREFIELDS
    ON PS.STUDENTCOREFIELDS.STUDENTSDCID = students.DCID
    INNER JOIN PS.U_STUDENTSUSERFIELDS
    ON PS.U_STUDENTSUSERFIELDS.STUDENTSDCID = students.DCID

WHERE
    students.SCHOOLID                 = 100
    AND students.ENROLL_STATUS              = 0
    AND students.street in 

ORDER BY 4, 2;


