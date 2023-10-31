SELECT
dcid,
  Student_Number,
  lastfirst,
  Grade_Level
FROM (SELECT *
      FROM STUDENTS
      JOIN S_SC_STU_X
      ON DCID=StudentsDCID
      WHERE SchoolRes<>('4002' || SubStr(('0' || SchoolID),-3))
      AND Enroll_Status=0
      AND Grade_Level>-2
      AND McKinney_Vento_Serv IS NULL
      AND (Building NOT Like 'C%' OR Building IS NULL)) S
LEFT JOIN (SELECT DISTINCT StudentID
      FROM SPENROLLMENTS L
      JOIN GEN
      ON GEN.ID=L.PROGRAMID
      WHERE NAME LIKE '[_]%'
      AND ENTER_DATE>to_date('07/01/2022' /*|| to_char(~(curyearid)-10),'MM/DD/YY')*/)) E
ON S.ID=E.StudentID
WHERE E.StudentID IS NULL
--AND S.SchoolID=Decode(~(curSchoolID),0,SCHOOLID,~(curSchoolID))
;
SELECT
    dcid,
  Student_Number,
  CHR(60) || 'a href=/admin/students/home.html?frn=' || '001' || S.DCID || '&lsp=/admin/students/specialprograms.html target=_blank'  || CHR(62) || LASTFIRST || CHR(60) || '/a'  || CHR(62),
  Grade_Level
FROM (SELECT *
      FROM STUDENTS
      JOIN S_SC_STU_X
      ON DCID=StudentsDCID
      WHERE SchoolRes<>('4002' || SubStr(('0' || SchoolID),-3))
      AND Enroll_Status=0
      AND Grade_Level>-2
      AND McKinney_Vento_Serv IS NULL
      AND (Building NOT Like 'C%' OR Building IS NULL)) S
LEFT JOIN (SELECT DISTINCT StudentID
      FROM SPENROLLMENTS L
      JOIN GEN
      ON GEN.ID=L.PROGRAMID
      WHERE NAME LIKE '(%'
      AND ENTER_DATE>to_date('07/01/' || to_char(~(curyearid)-10),'MM/DD/YY')) E
ON S.ID=E.StudentID
WHERE E.StudentID IS NULL
AND S.SchoolID=Decode(~(curSchoolID),0,SCHOOLID,~(curSchoolID))
;
SELECT distinct name FROM spenrollments
JOIN gen on gen.id = spenrollments.programid
WHERE NAME LIKE '(%'
;
SELECT
 (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),   Student_Number,  lastfirst,  name,  enter_date,  exit_date
FROM STUDENTS
JOIN SPENROLLMENTS on students.id = spenrollments.studentid
JOIN GEN ON GEN.ID=spenrollments.PROGRAMID
WHERE spenrollments.exit_date > '01-JAN-00' and spenrollments.enter_date > '01-JUL-2022'
;
SELECT
 (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), count(students.schoolid)
FROM STUDENTS
JOIN SPENROLLMENTS on students.id = spenrollments.studentid
JOIN GEN ON GEN.ID=spenrollments.PROGRAMID
WHERE spenrollments.exit_date > '01-JAN-00' and spenrollments.enter_date > '01-JUL-2022'
group by students.schoolid

