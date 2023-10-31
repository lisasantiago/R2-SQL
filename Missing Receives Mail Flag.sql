with p as (
  select  
    studentsdcid,
    1 as contactnum,
    cnt1_rel as relationshiptype,
    cnt1_lname as lastname,
    cnt1_fname as firstname,
    cnt1_hphone as phone2,
    cnt1_cphone as phone1,
    cnt1_email as email1,
    cnta1_custody as iscustodial,
    cnt1_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt1_lname is not null
  union
  select  
    studentsdcid,
    2 as contactnum,
    cnt2_rel as relationshiptype,
    cnt2_lname as lastname,
    cnt2_fname as firstname,
    cnt2_hphone as phone2,
    cnt2_cphone as phone1,
    cnt2_email as email1,
    cnt2_custody as iscustodial,
    cnt2_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt2_lname is not null
  union
  select  
    studentsdcid,
    3 as contactnum,
    cnt3_rel as relationshiptype,
    cnt3_lname as lastname,
    cnt3_fname as firstname,
    cnt3_hphone as phone2,
    cnt3_cphone as phone1,
    cnt3_email as email1,
    cnt3_custody as iscustodial,
    cnt3_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt3_lname is not null
  union
  select  
    studentsdcid,
    4 as contactnum,
    cnt4_rel as relationshiptype,
    cnt4_lname as lastname,
    cnt4_fname as firstname,
    cnt4_hphone as phone2,
    cnt4_cphone as phone1,
    cnt4_email as email1,
    cnt4_custody as iscustodial,
    cnt4_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt4_lname is not null
  union
  select  
    studentsdcid,
    5 as contactnum,
    cnt5_rel as relationshiptype,
    cnt5_lname as lastname,
    cnt5_fname as firstname,
    cnt5_hphone as phone2,
    cnt5_cphone as phone1,
    cnt5_email as email1,
    cnt5_custody as iscustodial,
    cnt5_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt5_lname is not null
  union
  select  
    studentsdcid,
    6 as contactnum,
    cnt6_rel as relationshiptype,
    cnt6_lname as lastname,
    cnt6_fname as firstname,
    cnt6_hphone as phone2,
    cnt6_cphone as phone1,
    cnt6_email as email1,
    cnt6_custody as iscustodial,
    cnt6_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt6_lname is not null
  union
  select  
    studentsdcid,
    7 as contactnum,
    cnt7_rel as relationshiptype,
    cnt7_lname as lastname,
    cnt7_fname as firstname,
    cnt7_hphone as phone2,
    cnt7_cphone as phone1,
    cnt7_email as email1,
    cnt7_custody as iscustodial,
    cnt7_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt7_lname is not null
  union
  select  
    studentsdcid,
    8 as contactnum,
    cnt8_rel as relationshiptype,
    cnt8_lname as lastname,
    cnt8_fname as firstname,
    cnt8_hphone as phone2,
    cnt8_cphone as phone1,
    cnt8_email as email1,
    cnt8_custody as iscustodial,
    cnt8_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt8_lname is not null
  union
  select  
    studentsdcid,
    9 as contactnum,
    cnt9_rel as relationshiptype,
    cnt9_lname as lastname,
    cnt9_fname as firstname,
    cnt9_hphone as phone2,
    cnt9_cphone as phone1,
    cnt9_email as email1,
    cnt9_custody as iscustodial,
    cnt9_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt9_lname is not null
  union
  select  
    studentsdcid,
    10 as contactnum,
    cnt10_rel as relationshiptype,
    cnt10_lname as lastname,
    cnt10_fname as firstname,
    cnt10_hphone as phone2,
    cnt10_cphone as phone1,
    cnt10_email as email1,
    cnt10_custody as iscustodial,
    cnt10_recvmail as receivesmailflg
  from s_sc_stu_contacts_x
  where cnt10_lname is not null
  )
select
  to_char(case
    when building like 'CF%'
    then (select school_number from schools where abbreviation = building)
    else schoolid
  end) school,
  to_char(s.student_number),
  s.lastfirst student,
  p.firstname,
  p.lastname,
  p.email1,
  p.phone1,
  x.homelang,
  null,
  p.relationshiptype
from students s
join p 
  on s.dcid = p.studentsdcid
join s_sc_stu_x x
  on s.dcid = x.studentsdcid
where s.enroll_status < 1
and nvl(iscustodial,0) = 0
and receivesmailflg = 1