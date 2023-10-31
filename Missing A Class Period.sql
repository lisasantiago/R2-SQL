select * from U_StudentsUserFields
join students on u_studentsuserfields.studentsdcid = students.dcid
where students.student_number in (69208,74486,77379,52080,74826,56410,73630,74497,80568,51001,50906,81569,790010040104,80426,80827,78869,80542,50422,32668,24856,68810,79946,71650,78547,19854,20970,27768,79567,19908,50621,16159,790010040501,69411,63653,57942,70139,16583,51406,56564,50057,79928,74674,79290,72554,790010035962,57221,73618,73845,75296,79713,68576,66891,60398,75379,52705,79764,79934,80289,81559,69457,27155,79470,68480)
and U_StudentsUserFields.r_rup is null
;
select * from cc
;
select expression, substr(expression, 2, 1) "When between 0-9", substr(expression, 0,2) Return, substr(expression, 0,1) "Else"
from cc
--where substr(expression, 2, 1) not in ('(','-')
;
    Case
      When SubStr(Expression,2,1) Between '0' And '9' Then SubStr(Expression,0,2)
      Else SubStr(Expression,0,1)
    End
;
select distinct expression, length(expression),
CASE
    WHEN length(expression) = 4 THEN substr(expression,0,1)
    WHEN length(expression) in (5, 7) THEN substr(expression,0,2)
    WHEN length(expression) = 6 THEN
        CASE 
        WHEN substr(expression, 0, 2) = '{-}' THEN substr(expression,0,3)
        ELSE expression
        END
        --WHEN substr(expression, 0, 2) = '\(' THEN substr(expression,0,1)
    /*WHEN length(expression) = 6 AND substr(expression, 0, 2) = '(' THEN substr(expression,0,1)
    WHEN length(expression) THEN
    WHEN length(expression) THEN*/
    ELSE expression
END
from cc 
where termid like '31%'
and length(expression) = 6
order by 2
;
select * from section_meeting