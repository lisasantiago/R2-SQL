select reportdcid, reportname, whocreated, schoolname, whencreated
from u_sqlrpts_run_history
--where reportdcid in (%param1%) and trunc(whencreated) >= to_date('%param2%','~[dateformat]')
order by whencreated desc
;
select 
id, 
u_sql.whocreated || ' (' || (select abbreviation from schools where users.homeschoolid = schools.school_number) || ' - ' || users.title || ')', 
to_char(u_sql.whenmodified, 'dd-MON-yyyy hh:mi AM') from u_sql
join users on u_sql.whocreated = users.last_name || ', ' || users.first_name || ' ' || users.middle_name
--where u_sql.id = '639555'
where users.last_name = 'Santiago'
order by u_sql.whomodified
;
select * from users
;
select * from SCHOOLS