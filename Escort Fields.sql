SELECT student_number as "studentID", first_name as "firstname", last_name as "lastname"
FROM students
left join u_transportation on students.dcid = u_transportation.studentsdcid
JOIN u_studentsuserfields ON students.dcid = u_studentsuserfields.studentsdcid
JOIN s_sc_stu_x on students.dcid = s_sc_stu_x.studentsdcid
WHERE u_studentsuserfields.r_rup = 1
AND grade_level < 1
AND students.enroll_status < 1
AND s_sc_stu_x.trans_mode_pm = 'P'
AND u_transportation.r_escort1_name is null
/*NSR*/ --AND student_number in (89405,89608,89495,89190,89920,89264,89230,89293,89347,89625,89310,89952,89425,89921,89210,89777,89311,89321,89217,89333,89572,89431,89295,89335,89605,88161,89243,89860,89232,89246,89261,89214,89353,89334,89935,89864,89244,89434,89552,89661,89271,89787,89542,89234,89759,89937,89265,89669,89475,89248,89312,89397,89603,90071,89297,89361,89263,90002,89510,89938,89391,89406,89656,90054,87278,89975,89621,89976,89513,89950,89379,89302,89448,89298,89286,89318,89288,89977,89319,89306,89292,89398,90048,89900,89305,89383,89330,89428,84377,90003,89378,89872,89314,89315,89862,89372,89407,89994,90043,89978,89356,89363,89768,89467,89979,89773,89358,89389,89400,89349,89456,89524,89364,89598,89781,89980,78253,89596,89940,89381,89437,89465,89386,89451,89390,89399,89810,89795,89413,89928,89438,89521,89449,89981,89566,90084,89473,89429,89494,89863,89491,89430,89446,89441,89951,89547,89941,89876,89535,89500,89462,87703,89482,89506,89476,89478,89770,89587,89511,89843,89658,89924,89527,89537,89986,89576,89532,89966,89554,90013,89617,90087,89631,90044,89987,89946,89956,89602,89700,89581,88537,89875,80231,80232,89606,89684,89575,89697,89593,84452,89866,89772,89746,89612,89647,89788,89704,89648,89623,89635,89916,89636,88759,89643,89665,80011,89710,89988,86603,89708,89908,89659,89752,89733,89683,89766,89706,89682,89867,89753,89694,89701,89707,90085,89732,89821,88715,89903,78682,89778,89783,89892,89805,89857,84068,89846,89990,90075,90006,89832,89893,89806,89812,90047,90015,90014,90036,90074,81143,89850,89837,89883,89847,89836,90017,89848,89904)
/*AR*/ --AND student_number in (84943,84376,84962,84757,85351,82966,84576,89068,81875,84664,84488,88763,84410,83852,84105,88939,85756,85350,84873,84819,84380,86966,78500,84630,84818,84837,84494,84713,84772,88457,79176,84792,83730,84448,78064,84888,84661,88344,84542,84474,84643,84464,88859,84796,84656,78741,85344,82647,84622,84795,84810,84786,86600,84805,82981,86240,84487,84980,84632,86533,82905,82739,85223,84476,78410,88209,84821,84816,84721,85355,84415,82872,82405,88409,84798,84587,83052,78370,84826,86637)

;
SELECT * FROM u_transportation;
SELECT * FROM s_sc_stu_x;
;
SELECT ps.students.student_number 
FROM ps.students 
JOIN ps.u_transportation ON ps.students.dcid = ps.u_transportation.studentsdcid 
JOIN ps.u_studentsuserfields ON ps.students.dcid = ps.u_studentsuserfields.studentsdcid 
WHERE ps.u_studentsuserfields.r_rup = '1' 
AND ps.students.sched_nextyeargrade < 1
AND students.dcid not in (select studentsdcid from u_transportation where students.dcid = u_transportation.studentsdcid)
;
--Check individual records
select students.dcid, u_transportation.studentsdcid,
r_escort1_name, r_escort1_rel, r_escort1_age, 
r_escort2_name, r_escort2_rel, r_escort2_age, 
r_escort3_name, r_escort3_rel, r_escort3_age, 
r_escort4_name, r_escort4_rel, r_escort4_age, 
r_escort5_name, r_escort5_rel, r_escort5_age, 
r_escort6_name, r_escort6_rel, r_escort6_age, 
r_escort7_name, r_escort7_rel, r_escort7_age, 
r_escort8_name, r_escort8_rel, r_escort8_age
from u_transportation
join students on students.dcid = u_transportation.studentsdcid 
where student_number = &StudentID
;

Update u_transportation
SET 

r_escort1_name= NULL, r_escort1_rel= NULL, r_escort1_age= NULL, 
r_escort2_name= NULL, r_escort2_rel= NULL, r_escort2_age= NULL, 
r_escort3_name= NULL, r_escort3_rel= NULL, r_escort3_age= NULL, 
r_escort4_name= NULL, r_escort4_rel= NULL, r_escort4_age= NULL, 
r_escort5_name= NULL, r_escort5_rel= NULL, r_escort5_age= NULL, 
r_escort6_name= NULL, r_escort6_rel= NULL, r_escort6_age= NULL, 
r_escort7_name= NULL, r_escort7_rel= NULL, r_escort7_age= NULL, 
r_escort8_name= NULL, r_escort8_rel= NULL, r_escort8_age = NULL

where u_transportation.studentsdcid = 458309


