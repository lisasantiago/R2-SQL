SELECT
 to_char(STUDENTS.STUDENT_NUMBER) as "Student ID",
 STUDENTS.LASTFIRST,
 (SELECT abbreviation from schools where REENROLLMENTS.SCHOOLID = schools.school_number) as "Elem School",
 Reenrollments.GRADE_LEVEL as "Elem Grade",
 TO_CHAR(REENROLLMENTS.ENTRYDATE,'MM/DD/YY') as "Elem Entry Date",
 TO_CHAR(REENROLLMENTS.EXITDATE,'MM/DD/YY') as "Elem Exit Date"
FROM STUDENTS
    JOIN REENROLLMENTS
ON STUDENTS.ID = REENROLLMENTS.STUDENTID
-- Current senior at your school (enter your schoolid)
Where STUDENTS.GRADE_LEVEL = 12 AND STUDENTS.SCHOOLID = [ENTER YOUR SCHOOLID] AND enroll_status = 0
-- Attended Pontiac Elem for 5th grade
AND (Reenrollments.GRADE_LEVEL = 5 AND reenrollments.schoolid = 81)
Order by STUDENTS.LASTFIRST
;
select abbreviation, firstday, lastday from terms where abbreviation like '%-%' and firstday > '01-AUG-17' and schoolid = 84 order by abbreviation asc
;
--Joy's sql
SELECT
 TO_CHAR(STUDENTS.ENTRYDATE,'MM/DD/YY'),
 STUDENTS.STUDENT_NUMBER,
 STUDENTS.LASTFIRST,
 Reenrollments.GRADE_LEVEL,
 TO_CHAR(REENROLLMENTS.ENTRYDATE,'MM/DD/YY'),
 TO_CHAR(REENROLLMENTS.EXITDATE,'MM/DD/YY'),
 REENROLLMENTS.SCHOOLID
FROM STUDENTS
LEFT JOIN REENROLLMENTS
ON STUDENTS.ID  = REENROLLMENTS.STUDENTID
Where STUDENTS.GRADE_LEVEL = 12
AND Reenrollments.GRADE_LEVEL = 5
AND STUDENTS.SCHOOLID  = 84
AND STUDENTS.ENTRYDATE >= To_Date ('07/01/17','mm/dd/yy')
Order by   STUDENTS.LASTFIRST
