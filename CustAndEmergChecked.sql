SELECT 
    cnt1_fname || ' ' || cnt1_lname,
    cnt1_rel,
    cnta1_custody,
    cnt1_emerg_ind,
    cnt1_living_with,
    cnt1_recvmail,
    cnt2_fname || ' ' || cnt2_lname,
    cnt2_rel,
    cnt2_custody,
    cnt2_emerg_ind,
    cnt2_living_with,
    cnt2_recvmail,
    cnt3_fname || ' ' || cnt3_lname,
    cnt3_rel,
    cnt3_custody,
    cnt3_emerg_ind,
    cnt3_living_with,
    cnt3_recvmail,
    cnt4_fname || ' ' || cnt4_lname,
    cnt4_rel,
    cnt4_custody,
    cnt4_emerg_ind,
    cnt4_living_with,
    cnt4_recvmail,
    cnt5_fname || ' ' || cnt5_lname,
    cnt5_rel,
    cnt5_custody,
    cnt5_emerg_ind,
    cnt5_living_with,
    cnt5_recvmail
FROM ps.s_sc_stu_contacts_x
WHERE 
     (cnta1_custody = 1 AND cnt1_emerg_ind = 1)
     OR
     (cnt2_custody = 1 AND cnt2_emerg_ind = 1)
     OR
     (cnt3_custody = 1 AND cnt3_emerg_ind = 1)
     OR
     (cnt4_custody = 1 AND cnt4_emerg_ind = 1)
     OR
     (cnt5_custody = 1 AND cnt5_emerg_ind = 1)
     


