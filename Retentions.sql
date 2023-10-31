select grade_level, Sched_NextYearGrade, next_school
from students
where student_number in (21318,23237,29114,76861,10721,53617,790010035448,15036,56537,36665,73803,74531,10972,16338,18348,13372,790010024372,790010025290,790010039942,28543,82392,61775,790010028520,71268,790010039632,10658,82706,14868,790010040837,790010040645,790010038410,16477,51765,67477,53743,83883,10838,70612,69872,23396,16583,23705,790010027515,82265,57289,790010027524,16928,790010036250,78862,60940,70001,14955,17858,78787,83021,30619,16078,11231,73687,82078,82079,34859,19396,14728,31343,17262,29469,57681,33701,790010030105,67435,790010035428,14790,14963,83434,30564,70858,12827,35933,64851,16491,15016,55155,16182,82703,16051,73505,74853,76822,63008,33058,19054,790010040036,11327,82498,70393,83250,16094,56083,58302,52798,70685,19598,36377,58525,64542,23022,83446,790010036919,72024,53025,13741,790010035108,10764,71812,12590,76646,26814,67353,54374,24447,30976,30976,790010038307,35549,12592,11509,18319,29571,10967,790010037227,83384,26804,16079,62429,70895,17662,19287,72149,17715,15870,27459,31929,12717,60632,790010040389,23088,70751,82932,66614,15775,82192,17069,52847,61867,52035,67331,57839,790010039664,21901,52890,790010035692,34738,67593,83258,65733,21901,59630,15883,790010040668,790010035385,16839,77946,790010036972,64902,25360,12684,79183,24531,77412,20553,13412,29563,12757,36580,18966,61279,13195,25858,59969,23134,51625,790010040254,81086,65492,15890,70758,53797,14742,15055,73479,82583,72998,78213,36263,16050,790010040617,790010040616,790010040847,12689,16861,60215,28544,12569,28541,57754,57293,53998,17778,790010035983,10863,81901,24617,71324,15288,77347,12692,15195,34721,68712,81527,80453,15257,35849,24389,54922,78236,78183,76688,59449,81969,11543,83767,790010034868,12791,36133,28749,77717,24630,16280,15906,79001037228,78268,28791,18411,15034,790010040694)

;
update students
set Sched_NextYearGrade = grade_level
where student_number in (21318,23237,29114,76861,10721,53617,790010035448,15036,56537,36665,73803,74531,10972,16338,18348,13372,790010024372,790010025290,790010039942,28543,82392,61775,790010028520,71268,790010039632,10658,82706,14868,790010040837,790010040645,790010038410,16477,51765,67477,53743,83883,10838,70612,69872,23396,16583,23705,790010027515,82265,57289,790010027524,16928,790010036250,78862,60940,70001,14955,17858,78787,83021,30619,16078,11231,73687,82078,82079,34859,19396,14728,31343,17262,29469,57681,33701,790010030105,67435,790010035428,14790,14963,83434,30564,70858,12827,35933,64851,16491,15016,55155,16182,82703,16051,73505,74853,76822,63008,33058,19054,790010040036,11327,82498,70393,83250,16094,56083,58302,52798,70685,19598,36377,58525,64542,23022,83446,790010036919,72024,53025,13741,790010035108,10764,71812,12590,76646,26814,67353,54374,24447,30976,30976,790010038307,35549,12592,11509,18319,29571,10967,790010037227,83384,26804,16079,62429,70895,17662,19287,72149,17715,15870,27459,31929,12717,60632,790010040389,23088,70751,82932,66614,15775,82192,17069,52847,61867,52035,67331,57839,790010039664,21901,52890,790010035692,34738,67593,83258,65733,21901,59630,15883,790010040668,790010035385,16839,77946,790010036972,64902,25360,12684,79183,24531,77412,20553,13412,29563,12757,36580,18966,61279,13195,25858,59969,23134,51625,790010040254,81086,65492,15890,70758,53797,14742,15055,73479,82583,72998,78213,36263,16050,790010040617,790010040616,790010040847,12689,16861,60215,28544,12569,28541,57754,57293,53998,17778,790010035983,10863,81901,24617,71324,15288,77347,12692,15195,34721,68712,81527,80453,15257,35849,24389,54922,78236,78183,76688,59449,81969,11543,83767,790010034868,12791,36133,28749,77717,24630,16280,15906,79001037228,78268,28791,18411,15034,790010040694)
;
select grade_level, next_school
from students
where schoolid = 84
;
select schoolid, grade_level,  Sched_NextYearGrade, next_school
from students
where next_school = 0
and enroll_status < 1
