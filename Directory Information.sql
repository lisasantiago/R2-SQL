SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),student_number, lastfirst, grade_level,
DECODE(r_district,1,'NO',''),
DECODE(r_higher_ed,1,'NO',''),
DECODE(r_military,1,'NO',''),
DECODE(r_address,1,'NO',''),
DECODE(r_photo,1,'NO',''),
DECODE(r_participation,1,'NO',''),
DECODE(r_physical_attributes,1,'NO',''),
DECODE(r_award,1,'NO','')
FROM ps.u_directory
JOIN students on ps.u_directory.studentsdcid = students.dcid
where (r_address = 1 OR r_award = 1 OR r_district = 1 OR r_higher_ed = 1 OR r_military = 1 OR r_participation = 1 OR r_photo = 1 OR r_physical_attributes = 1)
/*AND students.SchoolID =
  Decode(~(curSchoolID),0,students.SCHOOLID,~(curSchoolID))*/
ORDER BY 3
