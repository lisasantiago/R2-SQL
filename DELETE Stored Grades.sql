--Delete from storedgrades
DELETE from storedgrades 
where schoolid = 103
and termid like '30%'
and storecode = 'Y1'
and datestored = '09-JUN-2021'
;
--Search the record to be deleted
select * from storedgrades 
where schoolid = 69
and termid like '31%'
and storecode = 'Y1'
and datestored = '24-MAY-2022'
;
select distinct(studentid) from storedgrades 
where schoolid = 78
and termid like '31%'
and storecode = 'Q4'
--and datestored = '24-MAY-2022'
;