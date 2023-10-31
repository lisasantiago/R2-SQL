--com languages
--impact aid
--quotation marks for aliases used for case sensitivity
SELECT
  to_char(Student_Number) AS "stu_ID",
  Grade_Level AS "stu_CurrentGrade",
  SchoolID AS "stu_CurrentSchool",
  First_Name AS "stu_FirstName",
  Middle_Name AS "stu_MiddleName",
  Last_Name AS "stu_LastName",
  (SELECT StudentGeneration FROM S_SC_STU_X WHERE STUDENTSDCID=DCID) AS "stu_Suffix",
  To_Char(DOB,'mm/dd/yyyy') AS "stu_DOB",
  Gender AS "stu_Gender",
  Home_Phone AS "stu_HomePh",
  Street AS "stu_Address",
  City AS "stu_City",
  State AS "stu_State",
  Zip AS "stu_Zip",
  (SELECT Area FROM STUDENTCOREFIELDS WHERE STUDENTSDCID=DCID) AS "stu_Neighborhood",
  Mailing_Street AS "stu_MailAddress",
  Mailing_City AS "stu_MailCity",
  Mailing_State AS "stu_MailState",
  Mailing_Zip AS "stu_MailZip",
  (SELECT ParentsMilitaryStatus FROM S_SC_STU_X WHERE STUDENTSDCID=DCID) AS "p_Military",
  (SELECT Doctor_Name FROM STUDENTCOREFIELDS WHERE STUDENTSDCID=DCID) AS "stu_DoctorName",
  (SELECT Doctor_Phone FROM STUDENTCOREFIELDS WHERE STUDENTSDCID=DCID) AS "stu_DoctorPh",
  (SELECT MedicaidID FROM S_SC_STU_X WHERE STUDENTSDCID=DCID) AS "stu_MedicaidNo",
  DECODE(Grade_Level,12,12,Sched_NextYearGrade)   AS "stu_NextGrade",
  DECODE(Grade_Level,12,SchoolID,Next_School)  AS "stu_NextSchool",
  /*
        Contacts
  */
  --C1
  (SELECT Cnt1_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_FirstName",
  (SELECT Cnt1_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_LastName",
  (SELECT Cnt1_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_Relationship",
  (SELECT Cnt1_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_HomePh",
  (SELECT Cnt1_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_CellPh",
  (SELECT Cnt1_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_Email",
  (SELECT Cnt1_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_Employer",
  Decode(
    INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p1_WorkPh",
  Decode(
    INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt1_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p1_WorkPhExt",
  (SELECT Cnt1_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_Addr",
  (SELECT Cnt1_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_AddrCity",
  (SELECT Cnt1_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_AddrState",
  (SELECT Cnt1_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_AddrZip",
  (SELECT CntA1_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_Custody",
  --(SELECT Cnt1_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_RecvMail",
  (SELECT Cnt1_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p1_EmergencyContact",
  --C2
  (SELECT Cnt2_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_FirstName",
  (SELECT Cnt2_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_LastName",
  (SELECT Cnt2_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_Relationship",
  (SELECT Cnt2_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_HomePh",
  (SELECT Cnt2_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_CellPh",
  (SELECT Cnt2_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_Email",
  (SELECT Cnt2_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_Employer",
  Decode(
    INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p2_WorkPh",
  Decode(
    INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt2_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p2_WorkPhExt",
  (SELECT Cnt2_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_Addr",
  (SELECT Cnt2_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_AddrCity",
  (SELECT Cnt2_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_AddrState",
  (SELECT Cnt2_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_AddrZip",
  (SELECT Cnt2_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_Custody",
  --(SELECT Cnt2_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_RecvMail",
  (SELECT Cnt2_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p2_EmergencyContact",
  --C3
  (SELECT Cnt3_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_FirstName",
  (SELECT Cnt3_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_LastName",
  (SELECT Cnt3_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_Relationship",
  (SELECT Cnt3_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_HomePh",
  (SELECT Cnt3_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_CellPh",
  (SELECT Cnt3_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_Email",
  (SELECT Cnt3_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_Employer",
  Decode(
    INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p3_WorkPh",
  Decode(
    INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt3_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p3_WorkPhExt",
  (SELECT Cnt3_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_Addr",
  (SELECT Cnt3_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_AddrCity",
  (SELECT Cnt3_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_AddrState",
  (SELECT Cnt3_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_AddrZip",
  (SELECT Cnt3_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_Custody",
  --(SELECT Cnt3_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_RecvMail",
  (SELECT Cnt3_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p3_EmergencyContact",
  --C4
  (SELECT Cnt4_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_FirstName",
  (SELECT Cnt4_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_LastName",
  (SELECT Cnt4_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_Relationship",
  (SELECT Cnt4_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_HomePh",
  (SELECT Cnt4_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_CellPh",
  (SELECT Cnt4_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_Email",
  (SELECT Cnt4_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_Employer",
  Decode(
    INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p4_WorkPh",
  Decode(
    INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt4_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p4_WorkPhExt",
  (SELECT Cnt4_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_Addr",
  (SELECT Cnt4_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_AddrCity",
  (SELECT Cnt4_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_AddrState",
  (SELECT Cnt4_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_AddrZip",
  (SELECT Cnt4_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_Custody",
  --(SELECT Cnt4_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_RecvMail",
  (SELECT Cnt4_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p4_EmergencyContact",
  --C5
  (SELECT Cnt5_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_FirstName",
  (SELECT Cnt5_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_LastName",
  (SELECT Cnt5_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_Relationship",
  (SELECT Cnt5_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_HomePh",
  (SELECT Cnt5_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_CellPh",
  (SELECT Cnt5_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_Email",
  (SELECT Cnt5_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_Employer",
  Decode(
    INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p5_WorkPh",
  Decode(
    INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt5_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p5_WorkPhExt",
  (SELECT Cnt5_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_Addr",
  (SELECT Cnt5_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_AddrCity",
  (SELECT Cnt5_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_AddrState",
  (SELECT Cnt5_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_AddrZip",
  (SELECT Cnt5_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_Custody",
  --(SELECT Cnt5_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_RecvMail",
  (SELECT Cnt5_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p5_EmergencyContact",
  --C6
  (SELECT Cnt6_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_FirstName",
  (SELECT Cnt6_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_LastName",
  (SELECT Cnt6_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_Relationship",
  (SELECT Cnt6_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_HomePh",
  (SELECT Cnt6_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_CellPh",
  (SELECT Cnt6_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_Email",
  (SELECT Cnt6_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_Employer",
  Decode(
    INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p6_WorkPh",
  Decode(
    INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt6_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p6_WorkPhExt",
  (SELECT Cnt6_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_Addr",
  (SELECT Cnt6_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_AddrCity",
  (SELECT Cnt6_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_AddrState",
  (SELECT Cnt6_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_AddrZip",
  (SELECT Cnt6_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_Custody",
  --(SELECT Cnt6_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_RecvMail",
  (SELECT Cnt6_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p6_EmergencyContact",
  --C7
  (SELECT Cnt7_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_FirstName",
  (SELECT Cnt7_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_LastName",
  (SELECT Cnt7_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_Relationship",
  (SELECT Cnt7_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_HomePh",
  (SELECT Cnt7_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_CellPh",
  (SELECT Cnt7_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_Email",
  (SELECT Cnt7_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_Employer",
  Decode(
    INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p7_WorkPh",
  Decode(
    INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt7_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p7_WorkPhExt",
  (SELECT Cnt7_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_Addr",
  (SELECT Cnt7_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_AddrCity",
  (SELECT Cnt7_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_AddrState",
  (SELECT Cnt7_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_AddrZip",
  (SELECT Cnt7_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_Custody",
  --(SELECT Cnt7_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_RecvMail",
  (SELECT Cnt7_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p7_EmergencyContact",
  --C8
  (SELECT Cnt8_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_FirstName",
  (SELECT Cnt8_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_LastName",
  (SELECT Cnt8_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_Relationship",
  (SELECT Cnt8_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_HomePh",
  (SELECT Cnt8_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_CellPh",
  (SELECT Cnt8_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_Email",
  (SELECT Cnt8_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_Employer",
  Decode(
    INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p8_WorkPh",
  Decode(
    INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt8_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p8_WorkPhExt",
  (SELECT Cnt8_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_Addr",
  (SELECT Cnt8_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_AddrCity",
  (SELECT Cnt8_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_AddrState",
  (SELECT Cnt8_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_AddrZip",
  (SELECT Cnt8_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_Custody",
  --(SELECT Cnt8_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_RecvMail",
  (SELECT Cnt8_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p8_EmergencyContact",
  --C9
  (SELECT Cnt9_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_FirstName",
  (SELECT Cnt9_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_LastName",
  (SELECT Cnt9_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_Relationship",
  (SELECT Cnt9_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_HomePh",
  (SELECT Cnt9_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_CellPh",
  (SELECT Cnt9_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_Email",
  (SELECT Cnt9_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_Employer",
  Decode(
    INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p9_WorkPh",
  Decode(
    INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt9_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p9_WorkPhExt",
  (SELECT Cnt9_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_Addr",
  (SELECT Cnt9_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_AddrCity",
  (SELECT Cnt9_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_AddrState",
  (SELECT Cnt9_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_AddrZip",
  (SELECT Cnt9_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_Custody",
  --(SELECT Cnt9_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_RecvMail",
  (SELECT Cnt9_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p9_EmergencyContact",
  --C10
  (SELECT Cnt10_FName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_FirstName",
  (SELECT Cnt10_LName FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_LastName",
  (SELECT Cnt10_Rel FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_Relationship",
  (SELECT Cnt10_HPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_HomePh",
  (SELECT Cnt10_CPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_CellPh",
  (SELECT Cnt10_Email FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_Email",
  (SELECT Cnt10_Employer FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_Employer",
  Decode(
    INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,(SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
    SubStr(
      (SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),0,INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-2
    )) AS "p10_WorkPh",
  Decode(
    INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1),
    NULL,NULL,
    0,NULL,
    SubStr(
      (SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),
      INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)+1,
      INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),')',1,1)-INSTR((SELECT Cnt10_WPhone FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID),'(',1,1)-1
    )) AS "p10_WorkPhExt",
  (SELECT Cnt10_Street FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_Addr",
  (SELECT Cnt10_City FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_AddrCity",
  (SELECT Cnt10_State FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_AddrState",
  (SELECT Cnt10_Zip FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_AddrZip",
  (SELECT Cnt10_Custody FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_Custody",
  --(SELECT Cnt10_RecvMail FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_RecvMail",
  (SELECT Cnt10_Emerg_Ind FROM S_SC_STU_CONTACTS_X WHERE StudentsDCID=DCID) AS "p10_EmergencyContact",
  -->>>>add FWF field<<<<
  (SELECT 'Yes' from SPENROLLMENTS where students.id = SPENROLLMENTS.studentid and SPENROLLMENTS.programid = '1545' and spenrollments.exit_date > '01-FEB-2022')  AS "stu_FWFSpProg"

FROM Students

--WHERE Enroll_Status=0 AND EntryDate<TO_DATE('02/01/22','MM/DD/YY') -- Active students enrolled before  31JAN

--AND (Grade_Level<12 OR (Grade_Level=12 AND (SELECT InstrSetting FROM S_SC_STU_X WHERE DCID=StudentsDCID) IS NOT NULL)) --non-seniors and SPED seniors
--AND (grade_level = 12 AND (SELECT InstrSetting FROM S_SC_STU_X WHERE DCID=StudentsDCID) IS NULL) --seniors to import and not notify
--AND students.next_school <> '999999' --Import errors for students w/next_school 999999
--AND students.schoolid <> '99' --Exclude Out of District students
   
--Pull seniors in SPED again
--AND Grade_Level=12 AND (SELECT InstrSetting FROM S_SC_STU_X WHERE DCID=StudentsDCID) IS NOT NULL
    
-->>>>prompt for exporting individual students<<<<
WHERE student_number in &StudentIDs;

-->>>>Exporting multiple students<<<<
--WHERE student_number in (72736,790010018278)
;
-- Update to add FWF to form
SELECT
  to_char(Student_Number) AS "stu_ID",
  (SELECT '1' from SPENROLLMENTS where students.id = SPENROLLMENTS.studentid 
    and SPENROLLMENTS.programid = '1545' 
    and NVL(spenrollments.exit_date, TO_DATE('01-FEB-2022'))  > SYSDATE) AS "stu_FWFSpProg",
  (SELECT exit_date from SPENROLLMENTS where students.id = SPENROLLMENTS.studentid and SPENROLLMENTS.programid = '1545' and spenrollments.exit_date > SYSDATE) AS exitdate
FROM Students
WHERE Enroll_Status=0 AND EntryDate<TO_DATE('02/01/22','MM/DD/YY') -- Active students enrolled before  31JAN
AND students.next_school <> '999999' --Import errors for students w/next_school 999999
AND students.schoolid <> '99' --Exclude Out of District students
order by 2 asc
;
-- Update to add FWF to form 2.0
SELECT
  to_char(Student_Number) AS "stu_ID",
  --First_Name AS "stu_FirstName",
  --Last_Name AS "stu_LastName",
  --To_Char(DOB,'mm/dd/yyyy') AS "stu_DOB",
  (SELECT 'Yes' from SPENROLLMENTS where students.id = SPENROLLMENTS.studentid 
    and SPENROLLMENTS.programid = '1545' 
    and (spenrollments.exit_date is null OR spenrollments.exit_date > '01-FEB-2022')) AS "stu_FWFSpProg"
FROM Students
WHERE Enroll_Status=0 AND EntryDate<TO_DATE('02/01/22','MM/DD/YY') -- Active students enrolled before  31JAN
AND students.next_school <> '999999' --Import errors for students w/next_school 999999
AND students.schoolid <> '99' --Exclude Out of District students
order by 2 asc
;
-- Update to add FWF to form 2.1
SELECT
  to_char(Student_Number) AS "stu_ID",
  First_Name AS "stu_FirstName",
  Last_Name AS "stu_LastName",
  To_Char(DOB,'mm/dd/yyyy') AS "stu_DOB",
  'Yes' AS "stu_FWFSpProg"
FROM Students JOIN SPENROLLMENTS on students.id = SPENROLLMENTS.studentid
WHERE Enroll_Status=0 AND EntryDate<TO_DATE('02/01/22','MM/DD/YY') -- Active students enrolled before  31JAN
AND students.next_school <> '999999' --Import errors for students w/next_school 999999
AND students.schoolid <> '99' --Exclude Out of District students
AND (SPENROLLMENTS.programid = '1545' 
    AND (spenrollments.exit_date is null OR spenrollments.exit_date > '01-FEB-2022'))
order by 2 asc
;
-- Blank next_school
SELECT * FROM students
WHERE Enroll_Status=0
AND EntryDate<TO_DATE('02/01/21','MM/DD/YY')
AND next_school is null

;
SELECT * FROM students
;
-- Count of SPED seniors
SELECT (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER), count(*) FROM students
WHERE grade_level = 12
AND dcid not in (SELECT studentsdcid FROM S_SC_STU_X WHERE students.DCID=S_SC_STU_X.StudentsDCID and InstrSetting IS NULL)
AND enroll_status = 0
GROUP BY ROLLUP (schoolid)
;
SELECT 
student_number, lastfirst, next_school, Sched_NextYearGrade
FROM students
where enroll_status = 0
and (next_school is null or Sched_NextYearGrade is null)
and entrydate < '01-feb-2022'
and grade_level <> 13
;
--students w/next grade = -2
SELECT 
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,student_number, lastfirst, entrydate, next_school, Sched_NextYearGrade
FROM students
where enroll_status = 0
and Sched_NextYearGrade = -2
and entrydate < '01-feb-2022'
;
--stuents coded FWF
select (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) School, count (students.schoolid)
from SPENROLLMENTS
join students on students.id = SPENROLLMENTS.studentid
where exit_date > '01-FEB-2022'
and programid = 1545
and enroll_status = 0
group by rollup (students.schoolid)
;
SELECT name FROM schools
where school_number not in 
(select distinct schoolid
from SPENROLLMENTS
where enter_date > '01-JUL-2021'
and programid = 1545)
;
SELECT * FROM spenrollments


