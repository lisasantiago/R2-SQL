SELECT (select student_number from students where s_sc_stu_x.studentsdcid = students.dcid) StudentID, (select lastfirst from students where s_sc_stu_x.studentsdcid = students.dcid) LastFirst, qualifying_move, qualifying_occupation, house_status 
FROM s_sc_stu_x
where qualifying_move is not null 
OR qualifying_occupation is not null 
OR house_status  is not null