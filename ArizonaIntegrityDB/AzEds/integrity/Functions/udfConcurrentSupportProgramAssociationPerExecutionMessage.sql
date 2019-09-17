/**************************************************************************
** Script Name: integrity.udfConcurrentSupportProgramAssociationPerExecutionMessage
** 
**
** Author: Rohith Chintamaneni
** 
**
** Description: Retrieves IsConcurrentlyEnrolled per execution and message
**
** Input: @@Executionid			    INT
**        @messageid	        [nvarchar](36)
**        @FiscalYear               INT
** 
** Output: Table
**
** Returns: Table
**
** Implementation:
** 
**
** Revision History: Created - Rohith Chintamaneni - 05/22/2019
** using a user defined funtion to return IsConcurrentlyEnrolled for integrity execution and message. This will replace [integrity].[vw_ConcurrentSupportProgramAssociation] 
**************************************************************************/

CREATE FUNCTION integrity.udfConcurrentSupportProgramAssociationPerExecutionMessage
(	
	@executionid int,
	@MessageId as [nvarchar](36),
	@fiscalYear int
)
RETURNS @ConcurrentSupportProgramAssociations TABLE
(
	   StudentUSI int, 
	   ProgramName nvarchar(60),
	   ProgramTypeId int, 
	   FiscalYear int, 
	   ProgramEducationOrganizationId int,
	   IsConcurrentlyEnrolled bit
)
AS
BEGIN
   

    INSERT @ConcurrentSupportProgramAssociations
    SELECT SPA1.StudentUSI, 
	   SPA1.ProgramName,
	   SPA1.ProgramTypeId, 
	   SPA1.FiscalYear, 
	   SPA1.ProgramEducationOrganizationId,
	   CONVERT(BIT,CASE WHEN COUNT(*) >=1 THEN 1 ELSE 0 END) as IsConcurrentlyEnrolled
FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
	INNER JOIN   leadata.StudentProgramAssociation SPA1
			 ON  ih.studentusi = spa1.studentusi
				AND ih.FiscalYear = spa1.FiscalYear 
				AND ih.ExecutionId = @executionid 
				AND ih.MessageId = @MessageId 
				AND ih.FiscalYear = @fiscalYear
	 INNER JOIN leadata.StudentProgramAssociation SPA2
			 ON (SPA1.BeginDate < SPA2.EndDate OR SPA2.EndDate IS NULL)
				AND (SPA1.EndDate > SPA2.BeginDate OR SPA1.EndDate IS NULL)
				AND  SPA1.StudentUSI = SPA2.StudentUSI
				--AND SPA1.EducationOrganizationId <> SPA2.EducationOrganizationId
				AND SPA1.ProgramEducationOrganizationId <> SPA2.ProgramEducationOrganizationId
				AND SPA1.ProgramName = SPA2.ProgramName
				AND SPA1.FiscalYear = SPA2.FiscalYear
GROUP BY SPA1.StudentUSI, SPA1.ProgramName, SPA1.ProgramTypeId,SPA1.FiscalYear,SPA1.ProgramEducationOrganizationId

    RETURN

END
GO