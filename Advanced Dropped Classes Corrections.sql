update cc
set 
termid = abs(termid),
sectionid = abs(sectionid)
where dateleft = '12-JUN-2021'
and termid like '-30%'
;
select (select ABBREVIATION from SCHOOLS where cc.SCHOOLID=SCHOOL_NUMBER) School, schoolid, count(schoolid) from cc where termid like '-30%'
and dateleft = '12-JUN-2021'
group by schoolid
order by 3 desc
;
UPDATE cc
set 
and dateleft = '12-JUN-2021'
group by schoolid
order by 3 desc