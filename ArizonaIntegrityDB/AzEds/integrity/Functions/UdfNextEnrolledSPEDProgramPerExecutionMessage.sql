/************************************************************
** Author:		Sucharita
** Create date: 06/25/2019
** Description:	Returns next enrolled SPED program
**  Revision History:
**	Who			When		What
**  Sucharita     7/18/2019   Added spa1.Begindate in partition by caluse
**  Vinoth		8/29/2019	Modified the function to get the all program acorss the school for the same district
************************************************************/
CREATE FUNCTION [integrity].[UdfNextEnrolledSPEDProgramPerExecutionMessage]
(	
	-- Add the parameters for the function here
	@executionid int,
	@MessageId as [nvarchar](36),
	@FiscalYear int
)
RETURNS TABLE 
AS
RETURN 
(
	select FiscalYear,StudentUsi,ProgramTypeId,ProgramName,ProgramEducationOrganizationId,BeginDate,EducationOrganizationId,NextProgramName
from 
(SELECT  SPA1.FiscalYear,SPA1.StudentUSI,spa1.ProgramTypeId,spa1.ProgramName,SPA1.ProgramEducationOrganizationId,spa1.BeginDate
	   ,SPA1.EducationOrganizationId,SPA2.ProgramName AS NextProgramName	   
	   , ROW_NUMBER()over (Partition by SPA1.FiscalYear,SPA1.StudentUSI,spa1.ProgramTypeId,spa1.ProgramName ORDER BY spa2.BeginDate asc) latest 
FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
	INNER JOIN   leadata.StudentProgramAssociation SPA1 with (nolock)
			 ON  ih.studentusi = SPA1.studentusi
				AND ih.FiscalYear = SPA1.FiscalYear 
				AND ih.ExecutionId =  @executionid
				AND ih.MessageId = @MessageId
				AND ih.FiscalYear = @FiscalYear
				and SPA1.ProgramTypeId =6			
	inner JOIN leadata.StudentProgramAssociation SPA2 with (nolock)
                 ON  SPA1.FiscalYear = SPA2.Fiscalyear				
					AND SPA1.StudentUSI = SPA2.StudentUSI					
					AND SPA1.ProgramTypeId =SPA2.ProgramTypeId	
					AND SPA1.ProgramEducationOrganizationId=SPA2.ProgramEducationOrganizationId					
					AND SPA2.BeginDate> SPA1.BeginDate  
			        AND SPA1.ProgramTypeId =6) A
			where latest =1
			
	
)
GO
