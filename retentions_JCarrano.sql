with d as (
select
  date_value,
  row_number()
    over(partition by
        case
          when extract(month from date_value)>7
            then extract(year from date_value)-1990
          else extract(year from date_value)-1991
        end
      order by date_value) as daynum
from calendar_day
where insession=1 and schoolid=69
)
select
  Student_number,
  grade_level,
  Lastfirst name,
  (select abbreviation from schools where school_number=schoolid) Cur_School,
  decode(enroll_status,0,'Active','Inactive') Status
from students where id in(
  select studentid
  from ps_enrollment_all r
  where r.yearid=&&Year - 1
  and (select distinct 1 from d where daynum=160 and date_value between r.entrydate and r.exitdate)=1
  intersect
  select studentid
  from ps_enrollment_all r
  where (select distinct 1 from d where daynum=10 and date_value between r.entrydate and r.exitdate)=1
  and r.yearid=&&Year
)
order by
  student_number,
  entrydate
;
undefine year;