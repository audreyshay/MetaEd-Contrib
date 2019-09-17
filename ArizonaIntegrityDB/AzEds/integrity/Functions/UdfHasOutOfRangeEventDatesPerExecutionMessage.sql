CREATE FUNCTION [Integrity].[UdfHasOutOfRangeEventDatesPerExecutionMessage]
(
	@executionid int,
	@MessageId as [nvarchar](36),
	@fiscalYear int
)
RETURNS TABLE AS RETURN
(
	WITH  CTECCLCProgramName AS 
(SELECT distinct
   SPE.FiscalYear  AS Fiscalyear,
   SPE.StudentUSI   As Studentusi,
   SPE.EventDate    As EventDate,
   SPA.BeginDate    AS BeginDate,
   SPA.EndDate       AS EndDate,
   SPE.ProgramName   AS  ProgramName,
   SPE.ProgramEducationOrganizationId  AS ProgramEducationOrganizationId,
   SPE.EducationOrganizationId  AS EducationOrganizationId,
   DSW.SubmissionEndDate  AS DSWEndDate
FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] ih (nolock)
	INNER JOIN    leadata.StudentProgramAttendanceEvent SPE with (nolock) 
	ON IH.FiscalYear = SPE.FiscalYear
	and IH.StudentUSI = SPE.StudentUSI
	and Ih.ExecutionId = @executionid
	and ih.MessageId = @MessageId
	and ih.FiscalYear = @fiscalYear
   inner join
      leadata.StudentProgramassociation SPA with (nolock) 
      on SPE.FiscalYear = SPA.FiscalYear 
      AND SPE.StudentUSI = SPA.StudentUSI 
      AND SPE.ProgramEducationOrganizationId = SPA.ProgramEducationOrganizationId 
      AND SPE.ProgramTypeId = SPA.ProgramTypeId 
      AND SPE.ProgramName = SPA.ProgramName 
      AND SPE.EducationOrganizationId = SPA.EducationOrganizationId 
    INNER JOIN config.DataSubmissionWindow DSW with (nolock)   
	 ON SPE.FiscalYear = DSW.FiscalYear
	 and DSW.RequestTypeId = 3
where
   SPE.ProgramTypeId = 59 
   AND SPE.ProgramName like '%21st Century Community Learning Centers%' 
)

 select DISTINCT SPE.FiscalYear,
 SPE.StudentUSI,
 SPE.ProgramName,
 SPA.BeginDate,
 SPA.ProgramEducationOrganizationId,
 SPA.EducationOrganizationId from
 [integrity].[vw_GetIntegrityHistoryPerExecution] ih (nolock)
	INNER JOIN    leadata.StudentProgramAttendanceEvent SPE with (nolock) 
	ON IH.FiscalYear = SPE.FiscalYear
	and IH.StudentUSI = SPE.StudentUSI
	and Ih.ExecutionId = @executionid
	and ih.MessageId = @MessageId
	and ih.FiscalYear = @fiscalYear
 INNER JOIN leadata.StudentProgramAssociation SPA with (nolock)  ON SPE.FiscalYear =SPA.FiscalYear
                                                                    AND SPE.StudentUSI = SPA.StudentUSI
																	AND SPE.ProgramName =SPA.ProgramName
																	AND SPE.ProgramEducationOrganizationId =SPA.ProgramEducationOrganizationId
																	AND SPE.EducationOrganizationId =SPA.EducationOrganizationId
																	AND SPE.ProgramName LIKE '%21st Century Community Learning Centers%'
 where not exists (select * from CTECCLCProgramName P WHERE 
                                 SPE.FiscalYear = P.Fiscalyear AND
								 SPE.StudentUSI = p.Studentusi AND
								 SPE.ProgramName =P.ProgramName AND
								 SPE.EventDate BETWEEN  P.BeginDate AND ISNULL(P.EndDate, DSWEndDate) AND
								 SPE.ProgramEducationOrganizationId =P.ProgramEducationOrganizationId AND
								 SPE.EducationOrganizationId = P.EducationOrganizationId
								 AND SPE.ProgramName LIKE '%21st Century Community Learning Centers%') 
)

