SELECT guardian_ln FROM StudentCoreFields
WHERE LOWER(guardian_ln) LIKE LOWER('%DOROTHY COOK%');

SELECT (select lastfirst from students where S_SC_STU_CONTACTS_X.studentsdcid = students.dcid) LastFirst, 
(select student_number from students where S_SC_STU_CONTACTS_X.studentsdcid = students.dcid) StudentID,
cnt1_fname || ' ' || cnt1_lname || ' - ' ||
cnt2_fname || ' ' || cnt2_lname || ' - ' ||
cnt3_fname || ' ' || cnt3_lname || ' - ' ||
cnt4_fname || ' ' || cnt4_lname || ' - ' ||
cnt5_fname || ' ' || cnt5_lname || ' - ' ||
cnt6_fname || ' ' || cnt6_lname || ' - ' ||
cnt7_fname || ' ' || cnt7_lname || ' - ' ||
cnt8_fname || ' ' || cnt8_lname || ' - ' ||
cnt9_fname || ' ' || cnt9_lname || ' - ' ||
cnt10_fname || ' ' || cnt10_lname
FROM S_SC_STU_CONTACTS_X
WHERE LOWER(cnt1_fname || ' ' || cnt1_lname || ' - ' ||
cnt2_fname || ' ' || cnt2_lname || ' - ' ||
cnt3_fname || ' ' || cnt3_lname || ' - ' ||
cnt4_fname || ' ' || cnt4_lname || ' - ' ||
cnt5_fname || ' ' || cnt5_lname || ' - ' ||
cnt6_fname || ' ' || cnt6_lname || ' - ' ||
cnt7_fname || ' ' || cnt7_lname || ' - ' ||
cnt8_fname || ' ' || cnt8_lname || ' - ' ||
cnt9_fname || ' ' || cnt9_lname || ' - ' ||
cnt10_fname || ' ' || cnt10_lname) LIKE LOWER('%Dorothy Cook%')