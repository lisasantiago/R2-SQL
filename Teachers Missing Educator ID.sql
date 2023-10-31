/*PS search: SSN#; S_SC_USR_X.Tchr_ID = ;StaffStatus = 1*/

SELECT
    t.schoolid,
    t.lastfirst,
    t.preferredname,
    t.teachernumber,
    t.staffstatus,
    t.status,
    t.title,
    t.sif_stateprid,
    t.email_addr,
    t.ssn
FROM
    teachers T
WHERE
   t.staffstatus = 1
    AND t.status = 1
    AND t.ssn IS NOT NULL
    AND users_dcid IN (SELECT usersdcid from S_SC_USR_X WHERE tchr_id IS NULL)
ORDER BY
    t.lastfirst