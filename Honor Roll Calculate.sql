--Schools not running honor roll report
select ABBREVIATION, name, school_number
from SCHOOLS
where school_number not in (select schoolid from honorroll where yearid = 33)
and abbreviation not in ('CAP','CFK','CFKN','WRRAE','OD','CFI','R2CH','VS','SRC','VHS','R2i2','CFA','GS','AB','BA','VMS','SCM','SES','LCE')
ORDER BY 1
;
--Count of schools not running honor roll report
select count(school_number)
from SCHOOLS
where school_number not in (select schoolid from honorroll where yearid = 32)
and abbreviation not in ('CAP','CFK','CFKN','WRRAE','OD','CFI','R2CH','VS','SRC','VHS','R2i2','CFA','GS','AB','BA','VMS','SCM','SES')
;
--Clear calculate honor roll instance
DELETE 
FROM honorroll 
where schoolid = 94
and yearid = 33
;
/*Honor roll records stored on a specificdate*/
select * from honorroll where datestored = '18-MAY-2023' /*and schoolid = 87 and storecode = 'Q4'*/
;
/*Honor roll records for a specific school and year*/
select * from honorroll where yearid = 33 and storecode = 'Q1' and schoolid = 94
;
/*All honor roll records for a specific school*/
select distinct yearid, datestored, storecode, method from honorroll where schoolid = &SchoolID and yearid = 33 order by 1 desc, 2
;
--honor roll report run without store code
select distinct schoolname, yearid from honorroll where storecode is null
;
/*Honor roll records for a specific school and year*/
select distinct yearid, method from honorroll where schoolid = &schoolid order by yearid desc;

--Schools not running honor roll report
select ABBREVIATION, name, school_number
from SCHOOLS
where (school_number not in (select schoolid from honorroll where yearid = 32)
OR school_number not in (select schoolid from honorroll where yearid = 31)
OR school_number not in (select schoolid from honorroll where yearid = 30))
and abbreviation not in ('CAP','CFK','CFKN','WRRAE','OD','CFI','R2CH','VS','SRC','VHS','R2i2','CFA','GS','AB','BA','VMS','SCM','SES','LCE')