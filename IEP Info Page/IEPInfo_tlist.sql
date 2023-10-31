SELECT 
            u_iepinfo.id,
            u_iepinfo.R_SVCSTART, 
            u_iepinfo.R_SVCEND,
            (select name from gen WHERE Gen.id = u_iepinfo.R_DIS1),
            (select name from gen WHERE Gen.id = u_iepinfo.R_RECTYPE),
			(select name from gen WHERE Gen.id = u_iepinfo.R_PLACEMENT),
			(select lastfirst from teachers where u_iepinfo.R_TCH1 = teachers.id),
            (select lastfirst from teachers where u_iepinfo.R_TCH2 = teachers.id),
            (select name from gen WHERE Gen.id = u_iepinfo.R_SVCEXTREAS),
			u_iepinfo.R_COMMENTS
        FROM 
            u_iepinfo
;
select lastfirst from teachers where u_iepinfo.R_TCH1 = teachers.id
;
select * from gen WHERE CAT = 'R_IEP_Exit' 
;
select R_IEP_Dis from gen
;
--teachers
SELECT 
id,
lastfirst,
preferredname
FROM
teachers
WHERE status = 1
order by lastfirst
;
--Disability
SELECT 
id, name 
FROM GEN 
WHERE CAT = 'R_IEP_Dis'
ORDER BY name
;
SELECT 
CASE 
    WHEN u_iepinfo.R_DIS1 is not null THEN u_iepinfo.R_DIS1
    ELSE id, name 
FROM GEN 

WHERE CAT = 'R_IEP_Dis'
ORDER BY name
;
select * from u_iepinfo
;
select * from gen
;
--Placement
SELECT 
id, value 
FROM GEN 
WHERE CAT = 'R_IEP_Place'
ORDER BY value
;
--Program Model
SELECT 
id, name 
FROM GEN 
WHERE CAT = 'R_IEP_Mod'
ORDER BY name
;
--Type
SELECT 
id, name
FROM GEN 
WHERE CAT = 'R_IEP_Type'
ORDER BY id
;
--Exit Reason
SELECT
id, name
FROM GEN
WHERE CAT = 'R_IEP_Exit'
ORDER BY name
;
select r_rectype from u_iepinfo