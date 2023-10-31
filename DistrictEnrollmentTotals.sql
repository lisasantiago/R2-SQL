select student_number,
to_char(entrydate,'mm/dd/yyyy'),
schoolid,
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
(select name from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),
street,
city,
state,
zip
from students
where ENTRYDATE >'22-AUG-18'
and ENTRYDATE <'21-AUG-19'