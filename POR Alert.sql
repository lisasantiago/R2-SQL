SELECT 'FWF 2021-22', studentid
FROM SpEnrollments
WHERE ProgramID = 1545
AND ENTER_DATE > '01-AUG-21'
AND studentid = 89334
    ;
SELECT studentid FROM spenrollments;

    SELECT 
        'Yes',
        DECODE(r_proof_of_residency, null, 'blank', r_proof_of_residency),
        DECODE(r_rup, null, 'not complete', 'complete')
    FROM
        SpEnrollments
        JOIN students on  students.id = spenrollments.studentid
        JOIN U_StudentsUserFields on students.dcid = studentsdcid
    WHERE
        StudentID = ~(curstudid)
        AND ProgramID = 1545
        AND SYSDATE BETWEEN
            Enter_Date
            AND COALESCE(NULLIF(
                Exit_Date,DATE '1900-01-01'
            ),SYSDATE);
;
-- FWF Only
SELECT 
        'Yes'
    FROM
        SpEnrollments
    WHERE
        StudentID = ~(curstudid)
        AND ProgramID = 1545
        AND SYSDATE BETWEEN
            Enter_Date
            AND COALESCE(NULLIF(
                Exit_Date,DATE '1900-01-01'
            ),SYSDATE);
-- RUP & AR only
SELECT 
        DECODE(r_proof_of_residency, null, 'blank', r_proof_of_residency),
        DECODE(r_rup, null, 'not complete', 'complete')
    FROM
        students
        JOIN U_StudentsUserFields on students.dcid = studentsdcid
    WHERE
        StudentID = ~(curstudid);


SELECT * FROM U_StudentsUserFields