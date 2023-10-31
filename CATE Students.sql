SELECT 
  Students.Student_Number,
  Students.First_Name,
  Students.Middle_Name,
  Students.Last_Name,
  students.grade_level,
  Students.Street,
  Students.City,
  Students.State,
  Students.Zip,
  ClassRank.Gpa,
  ClassRank.Rank,
  DECODE(S_SC_Stu_Contacts_X.Cnta1_Custody,1,S_SC_Stu_Contacts_X.Cnt1_Email,
    DECODE(S_SC_Stu_Contacts_X.Cnt2_Custody,1,S_SC_Stu_Contacts_X.Cnt2_Email,
      DECODE(S_SC_Stu_Contacts_X.Cnt3_Custody,1,S_SC_Stu_Contacts_X.Cnt3_Email,
        DECODE(S_SC_Stu_Contacts_X.Cnt4_Custody,1,S_SC_Stu_Contacts_X.Cnt4_Email,
          DECODE(S_SC_Stu_Contacts_X.Cnt5_Custody,1,S_SC_Stu_Contacts_X.Cnt5_Email,
            DECODE(S_SC_Stu_Contacts_X.Cnt6_Custody,1,S_SC_Stu_Contacts_X.Cnt6_Email,
              DECODE(S_SC_Stu_Contacts_X.Cnt7_Custody,1,S_SC_Stu_Contacts_X.Cnt7_Email,
                DECODE(S_SC_Stu_Contacts_X.Cnt8_Custody,1,S_SC_Stu_Contacts_X.Cnt8_Email,
                  DECODE(S_SC_Stu_Contacts_X.Cnt9_Custody,1,S_SC_Stu_Contacts_X.Cnt9_Email,
                    DECODE(S_SC_Stu_Contacts_X.Cnt10_Custody,1,S_SC_Stu_Contacts_X.Cnt10_Email,
  Null)))))))))) Email
FROM Students
JOIN ClassRank
  ON Students.ID = ClassRank.StudentID
JOIN S_SC_Stu_Contacts_X
  ON Students.DCID = S_SC_Stu_Contacts_X.StudentsDCID
JOIN CC
  ON Students.ID = CC.StudentID
WHERE ClassRank.GPAMethod = 'SC_UGP_4.0'
AND ClassRank.GPA > 2.999
AND (CC.Course_Number LIKE '5%'
OR CC.Course_Number LIKE '6%')
AND Students.SchoolID = 100
AND Students.Enroll_Status = 0
AND Students.Grade_Level > 10
GROUP BY
  Students.Student_Number,
  Students.First_Name,
  Students.Middle_Name,
  Students.Last_Name,
  students.grade_level,
  Students.Street,
  Students.City,
  Students.State,
  Students.Zip,
  ClassRank.Gpa,
  ClassRank.Rank,
  DECODE(S_SC_Stu_Contacts_X.Cnta1_Custody,1,S_SC_Stu_Contacts_X.Cnt1_Email,
    DECODE(S_SC_Stu_Contacts_X.Cnt2_Custody,1,S_SC_Stu_Contacts_X.Cnt2_Email,
      DECODE(S_SC_Stu_Contacts_X.Cnt3_Custody,1,S_SC_Stu_Contacts_X.Cnt3_Email,
        DECODE(S_SC_Stu_Contacts_X.Cnt4_Custody,1,S_SC_Stu_Contacts_X.Cnt4_Email,
          DECODE(S_SC_Stu_Contacts_X.Cnt5_Custody,1,S_SC_Stu_Contacts_X.Cnt5_Email,
            DECODE(S_SC_Stu_Contacts_X.Cnt6_Custody,1,S_SC_Stu_Contacts_X.Cnt6_Email,
              DECODE(S_SC_Stu_Contacts_X.Cnt7_Custody,1,S_SC_Stu_Contacts_X.Cnt7_Email,
                DECODE(S_SC_Stu_Contacts_X.Cnt8_Custody,1,S_SC_Stu_Contacts_X.Cnt8_Email,
                  DECODE(S_SC_Stu_Contacts_X.Cnt9_Custody,1,S_SC_Stu_Contacts_X.Cnt9_Email,
                    DECODE(S_SC_Stu_Contacts_X.Cnt10_Custody,1,S_SC_Stu_Contacts_X.Cnt10_Email,
  NULL))))))))))
HAVING COUNT(*)>1