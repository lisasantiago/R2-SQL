select 
abbreviation, school_number,
DECODE(high_grade, 
                2, 'ES', 
                5, 'ES', 
                6, 'ES', 
                8, 'MS', 
                12, 'HS', 
                high_grade), 
high_grade 
from 
schools 
where 
high_grade < 13 and abbreviation not in ('AB', 'SCM', 'CAP', 'GS')
order by 
    case
        when abbreviation like 'CF%' then 4
        when high_grade = 5 then 1
        when high_grade = 2 then 1
        when high_grade = 8 then 2
        when high_grade = 12 then 3
        else high_grade
    end, 1