SELECT * FROM Emailaddress;
SELECT * FROM person;
SELECT * FROM PSSIS_Person_Email_Type;
SELECT * FROM student_contacts;
SELECT * FROM PCAS_ACCOUNT;
SELECT * FROM studentcontactassoc where studentdcid = 126722;
SELECT * FROM PersonEmailAddressAssoc;
SELECT * FROM Emailaddress;

--will give you accountdentifier not null if the contact has a data access account, and null if they don't.
select students.dcid, lastfirst,
schoolid,
person.firstname,
person.lastname,
guardian.accountidentifier
from
students
join studentcontactassoc on students.dcid = studentcontactassoc.studentdcid
join person on studentcontactassoc.personid = person.id
left join guardianpersonassoc on studentcontactassoc.personid = guardianpersonassoc.personid
left join guardian on guardianpersonassoc.guardianid = guardian.guardianid
JOIN PersonEmailAddressAssoc on person.id = PersonEmailAddressAssoc.personid
JOIN Emailaddress on EmailAddress.Emailaddressid = PersonEmailAddressAssoc.Emailaddressid

where students.enroll_status = 0
AND guardian.accountidentifier is null
--and lastfirst LIKE 'Carrano%'
;

select 
  TABLE_NAME, COLUMN_NAME,
  DATA_TYPE, NUM_DISTINCT,
  NULLABLE
from all_tab_columns
where owner = 'PS'
  and NUM_DISTINCT > 0
--  and upper(column_name) like upper('Term%id')
  ;
  
  SELECT * FROM person 
  JOIN PersonEmailAddressAssoc on person.id = PersonEmailAddressAssoc.personid
  JOIN Emailaddress on EmailAddress.Emailaddressid = PersonEmailAddressAssoc.Emailaddressid
  WHERE lastname = 'Carrano'
;
SELECT student_number, count(student_number)
FROM PSSIS_Stu_Contact_Act_RelType
JOIN students on PSSIS_Stu_Contact_Act_RelType.studentdcid = students.dcid
GROUP BY student_number
ORDER BY 2 desc
;
SELECT student_number, count(student_number)
FROM PSSIS_Stu_Contact_Act_RelType
JOIN students on PSSIS_Stu_Contact_Act_RelType.studentdcid = students.dcid
GROUP BY student_number
ORDER BY 2 desc
;