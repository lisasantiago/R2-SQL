SELECT
TO_CHAR(STUDENTS.STUDENT_NUMBER),
  STUDENTS.LASTFIRST,
  STUDENTS.GRADE_LEVEL,
  SECTIONS.COURSE_NUMBER,
  COURSES.COURSE_NAME,
  STOREDGRADES.TERMID,
  STOREDGRADES.DATESTORED,
  STOREDGRADES.STORECODE,
  STOREDGRADES.GRADE,
  STOREDGRADES.EARNEDCRHRS,
  TEACHERS.LASTFIRST AS "Teacher_Name"
FROM STUDENTS,
  COURSES,
  TEACHERS,
  SECTIONS,
  STOREDGRADES
WHERE Students.ID          = STOREDGRADES.STUDENTID
AND SECTIONS.ID           = STOREDGRADES.SECTIONID
AND COURSES.COURSE_NUMBER = SECTIONS.COURSE_NUMBER
AND TEACHERS.ID            = SECTIONS.TEACHER
AND STOREDGRADES.TERMID       = '2801'
AND STOREDGRADES.STORECODE    = 'F1'
AND STOREDGRADES.GRADE        < '60'
AND STUDENTS.SCHOOLID      = 100
AND STUDENTS.ENROLL_STATUS = 0
AND COURSES.COURSE_NUMBER LIKE '32210%'
and STOREDGRADES.EARNEDCRHRS = 0