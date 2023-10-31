select
    expression,
    count (distinct expression || ' ' || course_number || '.' || section_number) as "Count"
from cc
where schoolid = 100
and termid in ('3000','3001')
and expression in ('3(A)','4(A)','5(A)','6(A)','7(A)','8(A)')
group by expression
;