SELECT
  grade_level, 
  COUNT(students.GRADE_LEVEL) AS "Grade Level Count",
  --ethnicity, COUNT(DECODE(students.ETHNICITY,'B',1)) AS "Ethnicity Count",
  COUNT(DECODE(students.ETHNICITY,'B',1)) AS "Ethnicity - B",
  COUNT(DECODE(students.ETHNICITY,'H',1)) AS "Ethnicity - H",
  COUNT(DECODE(students.ETHNICITY,'M',1)) AS "Ethnicity - M",
  COUNT(DECODE(students.ETHNICITY,'W',1)) as "Ethnicity - W",
  --gender,  
   COUNT(DECODE(GENDER,'F',1)) AS "Gender - F",
  COUNT(DECODE(GENDER,'M',1)) AS "Gender - M",
  --S_SC_STU_X.INSTRSETTING, 
  COUNT(DECODE(S_SC_STU_X.INSTRSETTING,NULL,NULL,1)) as "SPED"
FROM
  students
JOIN S_SC_STU_X
ON
  students.dcid = S_SC_STU_X.STUDENTSDCID
  --JOIN cc on students.id = cc.studentid
WHERE
  students.BUILDING        = '750'
AND students.ENROLL_STATUS = 0
AND grade_level            > 8
GROUP BY ROLLUP(students.GRADE_LEVEL,
  students.ETHNICITY,
  students.GENDER,
  S_SC_STU_X.INSTRSETTING)
ORDER BY
  1
;
SELECT
  grade_level,  COUNT(students.GRADE_LEVEL) AS "Grade Level Count",
  ethnicity, COUNT(students.ETHNICITY) AS "Ethnicity Count",
  gender,  COUNT(students.GENDER) AS "Gender Count",
  S_SC_STU_X.INSTRSETTING, COUNT(S_SC_STU_X.INSTRSETTING) as "SPED Count"
FROM
  students
JOIN S_SC_STU_X
ON
  students.dcid = S_SC_STU_X.STUDENTSDCID
  --JOIN cc on students.id = cc.studentid
WHERE
  students.BUILDING        = '750'
AND students.ENROLL_STATUS = 0
AND grade_level            > 8
GROUP BY ROLLUP(students.GRADE_LEVEL,
  students.ETHNICITY,
  students.GENDER,
  S_SC_STU_X.INSTRSETTING)
ORDER BY
  1
;
SELECT grade_level, count(students.GRADE_LEVEL), count(students.ETHNICITY), count(students.GENDER), count(S_SC_STU_X.INSTRSETTING) FROM students
JOIN S_SC_STU_X on students.dcid = S_SC_STU_X.STUDENTSDCID
--JOIN cc on students.id = cc.studentid
WHERE students.BUILDING = '750'
and students.ENROLL_STATUS = 0
and grade_level > 8
GROUP BY students.GRADE_LEVEL
ORDER BY 1
;
;
-- instr setting codes for BWA students
SELECT DISTINCT S_SC_STU_X.INSTRSETTING FROM students
JOIN S_SC_STU_X on students.dcid = S_SC_STU_X.STUDENTSDCID
WHERE building = '750'
;
SELECT * FROM sections;
SELECT * FROM cc;
SELECT * FROM teachers;
SELECT * FROM S_SC_STU_X;
SELECT * FROM Students
WHERE schoolid = 750
;