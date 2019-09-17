/**************************************************************************
** Script Name:[integrity].[vw_NoProgramAssociationForProgramAttendanceEvent] 
** 
**
** Author: SMahapatra
** 
**
** Description: This view will return ALL ProgramNames for ProgramAttendanceEvent for which there is no StudentProgramAssociation record
****************************************************************************************************************************************/

CREATE VIEW [integrity].[vw_NoProgramAssociationForProgramAttendanceEvent] AS With CTEStudentProgramAttendanceEvent as 
(
   SELECT distinct
      SPE.FiscalYear,
      SPE.StudentUSI,
      SPE.ProgramName,
      SPE.EducationOrganizationId 
   FROM
      leadata.StudentProgramAttendanceEvent SPE with (nolock) 
      LEFT join
         leadata.StudentProgramassociation SPA with (nolock) 
         on SPE.FiscalYear = SPA.FiscalYear 
         AND SPE.StudentUSI = SPA.StudentUSI 
         AND SPE.ProgramEducationOrganizationId = SPA.ProgramEducationOrganizationId 
         AND SPE.ProgramTypeId = SPA.ProgramTypeId 
         AND SPE.ProgramName = SPA.ProgramName 
         AND SPE.EducationOrganizationId = SPA.EducationOrganizationId 
   where
      SPE.ProgramTypeId = 59 
      AND SPA.SourceId IS NULL 
)
SELECT
   SEA2.FiscalYear,
   SEA2.Studentusi,
   SEA2.EducationOrganizationId,
   ProgramList = STUFF(( 
   SELECT
      ', ' + ProgramName 
   from
      CTEStudentProgramAttendanceEvent SEA1 
   WHERE
      SEA1.FiscalYear = SEA2.FiscalYear 
      and SEA1.StudentUsi = SEA2.StudentUsi 
      and SEA1.EducationOrganizationId = SEA2.EducationOrganizationId FOR XML PATH('')), 1, 1, '') 
   FROM
      CTEStudentProgramAttendanceEvent SEA2 
   GROUP BY
      SEA2.FiscalYear,
      SEA2.Studentusi,
      SEA2.EducationOrganizationId 
      GO