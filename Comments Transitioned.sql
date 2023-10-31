UPDATE U_studentsuserfields
set r_comments_transitioned = null
WHERE studentsdcid in (select studentsdcid from S_SC_STU_CONTACTS_X where contacts_comments is null AND emg_comments is null)

;
SELECT contacts_comments, emg_comments FROM S_SC_STU_CONTACTS_X where contacts_comments is null AND emg_comments is null
;
SELECT r_comments_transitioned FROM u_studentsuserfields
where r_comments_transitioned = 1
;
SELECT student_number, contacts_comments, emg_comments 
FROM S_SC_STU_CONTACTS_X 
JOIN students on students.dcid = S_SC_STU_CONTACTS_X.studentsdcid
WHERE LOWER(contacts_comments) like '%no father%' --is null AND emg_comments is null