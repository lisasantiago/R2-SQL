select abbreviation from schools
;
--Schools who have not stored a specific term yet
select name, abbreviation
from schools 
where school_number not in 
                                        (select distinct schoolid from storedgrades 
                                        where schoolid = school_number
                                        and termid = 3000 and storecode = 'Y1')
and name not like 'Center%'
order by high_grade
;
select * from schools