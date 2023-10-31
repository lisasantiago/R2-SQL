SELECT
    students.student_number,
    storedgrades.course_number,
    storedgrades.course_name,
    storedgrades.earnedcrhrs,
    storedgrades.potentialcrhrs,
    storedgrades.termid,
    storedgrades.storecode,
    storedgrades.grade_level 
FROM
    students
    RIGHT JOIN storedgrades ON storedgrades.studentid = students.id
    where students.schoolid = 84
   AND storedgrades.storecode <> 'F1'
   AND storedgrades.earnedcrhrs > 0
   /*This will search for instances where they earned the credit in middle school. You can remove the slash and asterisk to run that part in your query.*/
   /*AND storedgrades.grade_level < 9*/
    