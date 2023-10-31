SELECT 
S.STUDENT_NUMBER, 
S.LASTFIRST, 
S.GRADE_LEVEL,
--custody field added to make sure this person should receive information about the student's grades
s_sc_stu_contacts_x.cnta1_custody,
S_SC_STU_CONTACTS_X.CNT1_EMAIL,
 s_sc_stu_contacts_x.cnt2_custody,
 S_SC_STU_CONTACTS_X.CNT2_EMAIL,
S.HOME_ROOM,
--Class period
E.EXPRESSION, 
--changes the term code into the term abbreviation
(CASE substr(E.TERMID,4) when '0' then 'Yr' when '1' then 'S1' when '2' then 'S2' when '3' then 'Q1' when '4' then 'Q2' when '5' then 'Q3' when '6' then 'Q4' END), 
G.GRADE, 
G.PERCENT, 
--displays the course number and section number together
E.COURSE_NUMBER||'.'||E.SECTION_NUMBER, 
C.COURSE_NAME,
--selects the teacher name
(SELECT PREFERREDNAME FROM TEACHERS T WHERE T.ID=E.TEACHER) 
FROM STUDENTS S JOIN PGFINALGRADES G ON S.ID = G.STUDENTID 
JOIN SECTIONS E ON E.ID = G.SECTIONID JOIN COURSES C ON C.COURSE_NUMBER = E.COURSE_NUMBER
JOIN S_SC_STU_CONTACTS_X ON s.dcid = s_sc_stu_contacts_x.studentsdcid
JOIN CC ON cc.sectionid = e.id and cc.termid = e.termid and cc.studentid = s.id
--only returns records for the 21-22 school year
WHERE E.TERMID Like '31%' 
--only returns grades for S1
AND G.FINALGRADENAME = 'S1' 
--only returns grades < 55
AND (G.PERCENT < 55)
--only returns records for active students at SVHS
AND S.ENROLL_STATUS=0 AND E.SCHOOLID = 69
--only return grades for course numbers for Math, ELA
AND
    (C.COURSE_NUMBER like '30%'
    OR C.COURSE_NUMBER like '31%'
    OR C.COURSE_NUMBER like '41%')
--only returns records for classes that have not ended
AND g.enddate > sysdate
ORDER BY S.LASTFIRST, E.EXPRESSION