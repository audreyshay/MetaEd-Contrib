/**************************************************************************
** Script Name:[[vw_HavingJtedEnrollmentOnFeb012016]
** 
**
** Author: SMahapatra
** 
**
** Description: This view will return flag if the student has enrollment on or before 02/01/2016 at JTED
****************************************************************************************************************************************/

CREATE VIEW [integrity].[vw_HavingJtedEnrollmentOnFeb012016] 
AS 
  SELECT s.studentusi, 
         ssa.entrydate, 
         ssa.exitwithdrawdate 
  FROM   leadata.student s WITH (nolock) 
         JOIN leadata.studentschoolassociation ssa WITH (nolock) 
           ON S.studentusi = ssa.studentusi 
         JOIN entity.school sch WITH (nolock) 
           ON ssa.schoolid = sch.schoolid 
              AND ssa.fiscalyear = sch.fiscalyear 
         JOIN entity.localeducationagency LEA WITH (nolock) 
           ON sch.fiscalyear = LEA.fiscalyear 
              AND sch.localeducationagencyid = LEA.localeducationagencyid 
  WHERE  LEA.iscte = 1 
         AND ( ssa.entrydate <= '2016-02-01' 
               AND ssa.entrydate >= '2015-07-01' ) 
         AND ( ( ssa.exitwithdrawdate >= '2016-02-01' ) 
                OR ( SSA.exitwithdrawdate IS NULL ) ) 
         AND ssa.fiscalyear = 2016 
  GROUP  BY S.studentusi, 
            ssa.entrydate, 
            ssa.exitwithdrawdate 