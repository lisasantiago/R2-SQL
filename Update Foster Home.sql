--Returns the studentsdcid to be used in the UPDATE query
SELECT s_sc_stu_x.studentsdcid
FROM S_SC_STU_X
JOIN students on students.dcid = s_sc_stu_x.studentsdcid
WHERE S_SC_STU_X.Foster_Home is null
/*add the student id's from the provided spreadsheet*/
AND student_number in (78802,87920,30162,30163,85576,89676,87588,88661,81935,88605,82895,82124,88801,89468,78188,53743,78490,78635,78636,82856,30756,87024,87970,61656,89557,88443,67349,53733,88051,81299,85369,85370,55136,72904,72905,83262,88663,89300,89509,73521,72597,86476,88220,88221,78489,78533,61673,89339,30665,61197,72103,89427,88915,88916,88917,72796,88641,51392,52994,16079,82542,55919,86680,86043,87042,71610,87397,89078,65074,67490,88032,88246,88672,34111,88049,72736,89690,89691,83485,82888,77475,84008,73308,79422,76946,78725,86735,27714,36598,31661,32923,80011,34776,66373,67294,87689,85245,20399,66947,84053,88153,72823,70699,82323,82352,11234,71661,23898,790010040295,12045,82374,35144,88471,88575,83740,82276,89028,89782,81892,29397,62191,80831,83529,88048,83431,84522,88413,55528,18331,83845,76175,12026,58069,88062,61742,65234,89709,12880,82293,54599,68411,89783,89842)
;
UPDATE S_SC_STU_X
SET Foster_Home = 'Y'
/*Copy the studentsdcid from the 1st query and add them here to update only those records.*/
WHERE studentsdcid in (156054,165820,232153,289014,317068,352419,357605)
;
SELECT * FROM S_SC_STU_X;
SELECT * FROM students;