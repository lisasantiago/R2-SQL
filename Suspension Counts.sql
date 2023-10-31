SELECT INCIDENTS.INCIDENT_ID,
  INCIDENTS.SCHOOL_NUMBER,
  INCIDENTS.INCIDENT_DATE,
  OFFENDER.STUDENTID,
  OFFENDER.INCIDENT_PERSON_ROLE_ID,
  BEHAVIOR.PRIMARY_INDICATOR,
  ACTION.ACTION_PLAN_BEGIN_DT,
  ACTION.ACTION_SUB_CODE,
  ACTION.ACTION_SUB_DESC,
  students.STUDENT_NUMBER,
  students.ETHNICITY,
  PSRW_INCIDENTACTION.DURATION_ASSIGNED,
  PSRW_INCIDENTACTION.DURATION_ACTUAL
FROM PSRW_INCIDENTACTION
INNER JOIN PSRW_INCIDENTPARTICIPANT
ON PSRW_INCIDENTACTION.INCIDENT_ID = PSRW_INCIDENTPARTICIPANT.INCIDENT_ID
INNER JOIN students
ON students.STUDENT_NUMBER = PSRW_INCIDENTPARTICIPANT.PARTICIPANT_NUMBER
INNER JOIN
  (SELECT I.SCHOOL_NUMBER,
    LU.INCIDENT_CATEGORY,
    I.INCIDENT_ID,
    I.INCIDENT_TITLE,
    I.INCIDENT_TS INCIDENT_DATE,
    ID.INCIDENT_DETAIL_ID,
    I.ENTRY_AUTHOR,
    I.INCIDENT_DETAIL_DESC,
    I.LOCATION_DETAILS
  FROM INCIDENT I
  INNER JOIN INCIDENT_DETAIL ID
  ON ID.INCIDENT_ID = I.INCIDENT_ID
  INNER JOIN INCIDENT_LU_CODE LU
  ON LU.LU_CODE_ID = ID.LU_CODE_ID
  WHERE LU.INCIDENT_CATEGORY LIKE 'Discipline%'
  AND LU.CODE_TYPE                           = 'incidenttypecode'
  ) INCIDENTS ON PSRW_INCIDENTPARTICIPANT.ID = INCIDENTS.INCIDENT_ID
INNER JOIN
  (SELECT DISTINCT IPR.INCIDENT_ID,
    IPR.STUDENTID,
    IPR.INCIDENT_PERSON_ROLE_ID
  FROM INCIDENT_PERSON_ROLE IPR
  INNER JOIN INCIDENT_DETAIL ID
  ON ID.INCIDENT_DETAIL_ID           = IPR.ROLE_INCIDENT_DETAIL_ID
  WHERE ID.LU_CODE_ID                = 8
  ) OFFENDER ON OFFENDER.INCIDENT_ID = INCIDENTS.INCIDENT_ID
INNER JOIN
  (SELECT DISTINCT ID.INCIDENT_ID,
    IPD.INCIDENT_PERSON_DETAIL_ID,
    ID.PRIMARY_INDICATOR,
    LU.STATE_AGGREGATE_RPT_CODE BEHAVIOR_CODE,
    LU.INCIDENT_CATEGORY BEHAVIOR_DESC,
    LS.SUB_CATEGORY BEHAVIOR_SUB_DESC,
    LS.STATE_DETAIL_REPORT_CODE BEHAVIOR_SUB_CODE,
    IPD.INCIDENT_PERSON_ROLE_ID,
    IL.CATEGORY_LEVEL
  FROM INCIDENT_DETAIL ID
  LEFT JOIN INCIDENT_LU_SUB_CODE LS
  ON LS.LU_SUB_CODE_ID = ID.LU_SUB_CODE_ID
  INNER JOIN INCIDENT_LU_CODE LU
  ON LU.LU_CODE_ID = ID.LU_CODE_ID
  INNER JOIN U_INCIDENT_LEVELS IL
  ON LU.LU_CODE_ID = IL.LU_CODE_ID
  INNER JOIN INCIDENT_PERSON_DETAIL IPD
  ON IPD.INCIDENT_DETAIL_ID          = ID.INCIDENT_DETAIL_ID
  WHERE LU.CODE_TYPE                 = 'behaviorcode'
  ) BEHAVIOR ON BEHAVIOR.INCIDENT_ID = INCIDENTS.INCIDENT_ID
AND OFFENDER.INCIDENT_PERSON_ROLE_ID = BEHAVIOR.INCIDENT_PERSON_ROLE_ID
LEFT JOIN
  (SELECT IPD.INCIDENT_PERSON_DETAIL_ID,
    IPD.INCIDENT_PERSON_ROLE_ID,
    LU.INCIDENT_CATEGORY ACTION_DESC,
    LS.SUB_CATEGORY ACTION_SUB_DESC,
    IA.ACTION_PLAN_BEGIN_DT,
    IA.ACTION_PLAN_END_DT,
    IA.DURATION_INCIDENT_DETAIL_ID,
    LS.STATE_DETAIL_REPORT_CODE ACTION_SUB_CODE,
    LU.STATE_AGGREGATE_RPT_CODE ACTION_CODE
  FROM INCIDENT_ACTION IA
  INNER JOIN INCIDENT_DETAIL ID
  ON IA.INCIDENT_ID                = ID.INCIDENT_ID
  AND IA.ACTION_INCIDENT_DETAIL_ID = ID.INCIDENT_DETAIL_ID
  LEFT JOIN INCIDENT_LU_SUB_CODE LS
  ON ID.LU_SUB_CODE_ID = LS.LU_SUB_CODE_ID
  INNER JOIN INCIDENT_LU_CODE LU
  ON ID.LU_CODE_ID = LU.LU_CODE_ID
  INNER JOIN INCIDENT_PERSON_ACTION IPA
  ON IA.INCIDENT_ACTION_ID = IPA.INCIDENT_ACTION_ID
  INNER JOIN INCIDENT_PERSON_DETAIL IPD
  ON IPD.INCIDENT_PERSON_DETAIL_ID             = IPA.INCIDENT_PERSON_DETAIL_ID
  WHERE LOWER(LU.CODE_TYPE)                    = 'actioncode'
  ) ACTION ON ACTION.INCIDENT_PERSON_DETAIL_ID = BEHAVIOR.INCIDENT_PERSON_DETAIL_ID
AND ACTION.INCIDENT_PERSON_ROLE_ID             = OFFENDER.INCIDENT_PERSON_ROLE_ID
WHERE INCIDENTS.SCHOOL_NUMBER                  = 72
AND ACTION.ACTION_PLAN_BEGIN_DT                > '21-AUG-19'
AND ACTION.ACTION_PLAN_BEGIN_DT                < '06-JUN-20'
AND ACTION.ACTION_SUB_CODE                    IN ('SUS', 'ISP', 'CCS')