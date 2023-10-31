SELECT 
      (select ABBREVIATION from SCHOOLS where students.SCHOOLID=SCHOOL_NUMBER) as School,
      Decode(Grouping(Grade_Level),1,'Total',
          Decode(Grouping(Ethnicity),1,NULL,
          Decode(Grade_Level,-1,'PK4',-2,'PK3',0,'K',Grade_Level))) as Grade,
      
      Decode(Grouping(Ethnicity),1,
          Decode(Grouping(Grade_Level),1,NULL,
          'Total ' || Decode(Grade_Level,-1,'PK4',-2,'PK3',0,'K','Gr ' || Grade_Level)),Ethnicity)  as Ethnicity,
      
      Count(Decode(LunchStatus,'F',ID,Null)) as Free,
      
      Count(Decode(LunchStatus,'R',ID,Null)) as Reduced,
      
      Count(Decode(LunchStatus,'P',ID,Null)) as FullPay,
      
     Count(Decode(LunchStatus,'F',ID,Null))+Count(Decode(LunchStatus,'R',ID,Null))+Count(Decode(LunchStatus,'P',ID,Null)) as Total
FROM Students
WHERE Enroll_Status=0

GROUP BY
  RollUp(
    schoolid, 
    Grade_Level, 
    Ethnicity)
ORDER BY
  schoolid, 
  Grade_Level,
  Ethnicity