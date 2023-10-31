--School Abbreviations
(select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),

--School Names
(select name from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER),

--Withdrawal Codes
(DECODE(withdrawals.exitcode, 
                                                                                    'W10', 'Transfer/In-District', 
                                                                                    'W20', 'Withdrawn/Unknown Status', 
                                                                                    'W21', 'Graduated', 
                                                                                    'W22', 'Transfer/Out of District', 
                                                                                    'W23', 'Transfer/Adult Education', 
                                                                                    'W24', 'Moved Out of District/ School Unknown', 
                                                                                    'W25', 'Withdrawn/Home Schooled', 
                                                                                    'W26', 'Withdrawn/Health or Pregnancy', 
                                                                                    'W27', 'Withdrawn/Tech School', 
                                                                                    'W28', 'Withdrawn/4-Year College', 
                                                                                    'W29', 'Withdrawn/Work', 
                                                                                    'W30', 'Withdrawn/Military', 
                                                                                    'W31', 'Withdrawn/Juvenile Corrections', 
                                                                                    'W32', 'Withdrawn/Adult Corrections', 
                                                                                    'W33', 'Withdrawn/Expulsion', 
                                                                                    'W34', 'Withdrawn/Charter School', 
                                                                                    'W35', 'Deceased', 'W36', 'Dropout', 
                                                                                    'W37', 'Re-enrolled Next School Year', 
                                                                                    'W38', 'Adult Ed - Diploma Tracking', 
                                                                                    'W39', 'Exceeded Maximum Age for Attendance', 
                                                                                    'W40', 'Adult Ed GED - Tracking', 
                                                                                    'NS', 'No-Show/Never Enrolled', 
                                                                                    'P', 'Promoted For End of Year Process', 
                                                                                    'R', 'Retained For End of Year Process', 
                                                                                    'GC', 'Grade Change', 
                                                                                    'EG', 'Early Graduate'
                                                                                )
                                                                                
--District Wide Decode
AND students.schoolid =
  Decode(~(curSchoolID),0,students.schoolid,~(curSchoolID))
  
--School Year From Term
  SELECT 
  DISTINCT TERMS.YEARID, 
  (TERMS.YEARID + 1990) || '-' || (TERMS.YEARID + 1991) AS YearBased,
  (FLOOR(TERMS.ID / 100) + 1990) || '-' || (FLOOR(TERMS.ID / 100 ) + 1991) AS TermBased
FROM TERMS
ORDER BY TERMS.YEARID
