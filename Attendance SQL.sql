select
    b.schoolid,
    b.year_id,
    a.studentid,
    b.date_value,
    nvl(a.total_minutes,b.minutes_attended),
    b.minutes_attended,
    greatest((b.minutes_attended - nvl(a.total_minutes,b.minutes_attended)),0)
  from (
    select * from ( select
                    bell_schedule_id,
                    period_id,
                    minutes_attended
                    from bell_schedule_items
                    where ada_code = 1) bs
    join (  select 
            id cdid,
            bell_schedule_id,
            cycle_day_id,
            date_value
            from calendar_day 
            where membershipvalue = 1) cd
      on bs.bell_schedule_id = cd.bell_schedule_id 
    join (  select
            p.id pid,
            cy.id cyid,
            m.sectionid,
            m.year_id,
            m.schoolid,
            m.firstday,
            m.lastday
            from period p
    join (select
          sm.sectionid,
          sm.schoolid,
          sm.year_id,
          sm.period_number,
          sm.cycle_day_letter,
          t.firstday,
          t.lastday
          from section_meeting sm
          join sections e on e.id = sm.sectionid
          join terms t on t.id = e.termid and t.schoolid = e.schoolid
          where exclude_ada = 0) m

        on p.period_number = m.period_number and p.schoolid = m.schoolid and p.year_id = m.year_id
      join cycle_day cy on cy.letter = m.cycle_day_letter and cy.schoolid = m.schoolid and cy.year_id = m.year_id) pd
          on pd.pid = bs.period_id and pd.cyid = cd.cycle_day_id
      
      where date_value between firstday and lastday) b
  left join ( select
              ccid,
              id,
              periodid,
              calendar_dayid,
              schoolid,
              yearid,
              studentid,
              att_date,
              to_number(total_minutes) total_minutes
              from attendance
              where att_mode_code = 'ATT_ModeMeeting'
              and attendance_codeid in (select id from attendance_code where presence_status_cd = 'Absent')) a
    on b.period_id = a.periodid and b.cdid = a.calendar_dayid
    join cc on cc.id = a.ccid and cc.sectionid = b.sectionid;
