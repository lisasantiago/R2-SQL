--Joy's original query
SELECT
/*G.TERMID,                                    
  G.STORECODE,                                
  G.GRADE,                                            
  G.COURSE_NAME,
  G.GRADE_LEVEL,
  G.SCHOOLID,*/
  STUDENTS.STUDENT_NUMBER,
  STUDENTS.LASTFIRST,
  STUDENTS.GRADE_LEVEL,
  STUDENTS.SCHOOLID,
 STUDENTS.TRANSFERCOMMENT
 
  FROM STUDENTS
  LEFT JOIN

    (SELECT STOREDGRADES.TERMID,                            
    STOREDGRADES.STORECODE,                            
    STOREDGRADES.GRADE,
    STOREDGRADES.COURSE_NAME,
    STOREDGRADES.GRADE_LEVEL,
    STOREDGRADES.SCHOOLID,
    STOREDGRADES.STUDENTID
 
  FROM STOREDGRADES
 
WHERE
STOREDGRADES.TERMID LIKE '30%'
AND STORECODE = (CASE SUBSTR(TERMID,-2)            
                    WHEN '00' THEN 'Y1'                                      
                    WHEN '01' THEN 'S1'
                    WHEN '02' THEN 'S2'
                    WHEN '03' THEN 'Q1'
                    WHEN '04' THEN 'Q2'
                    WHEN '05' THEN 'Q3'
                    WHEN '06' THEN 'Q4'
                  END) 
                  
AND STOREDGRADES.PERCENT  < 85) G

ON STUDENTS.ID  = G.STUDENTID

WHERE STUDENTS.SCHOOLID      = '85'
AND G.STUDENTID IS NULL
AND STUDENTS.GRADE_LEVEL > '5'
AND ENROLL_STATUS=0;
--My query
--Subquery
(select studentid from storedgrades
where grade < '85');

--Completed Query
select student_number, lastfirst from students
where id NOT IN (select studentid from storedgrades
where storedgrades.percent < '85' and termid LIKE '30%' )
AND schoolid = 85
and enroll_status = 0;

--Including percent and grade fields
select student_number, lastfirst, storedgrades.termid, storedgrades.storecode, storedgrades.grade, storedgrades.percent from students
INNER JOIN storedgrades ON students.id = storedgrades.studentid
where  
(storedgrades.grade > '85'
OR storedgrades.percent > '85')
AND
(storedgrades.grade is not null
AND storedgrades.percent is not null)
and storedgrades.termid LIKE '30%' 
and students.schoolid = 85
and enroll_status = 0
order by 5 desc