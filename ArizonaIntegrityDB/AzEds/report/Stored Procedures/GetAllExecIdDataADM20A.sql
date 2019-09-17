/*************************************************************************************
**Procedure Name:
**      report.GetAllExecIdDataADM20A
**
**Author:
**      Harsha Kankanala
**
**Description:  
**  Gives Aggregation Execution ID, & corresponding Integrity Execution ID and 
**	Integrity Run date (Data Capture Date)
**   
**Input:
**      @FiscalYear INT,
**		@CaptureDate DATETIME = NULL
**		@LocalEducationAgencyId INT
**
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from ADM15 StudentAdjustedADMReport.rdl (ADM15 Report) 
**
**Revision History:
**	Harsha Kankanala	11/28/2018	Customized the stored proc for ADM20A

**************************************************************************************/	

CREATE PROC [report].[GetAllExecIdDataADM20A]	
@FiscalYear INT,
@Executionid int,
@LocalEducationAgencyId INT

AS
BEGIN

SET NOCOUNT ON;


	
	

		SELECT 
			 MAX(AggE.ExecutionId)			AS 'AggregationExecutionID'
			,AggE.ReferenceExecutionId		AS 'IntegrityExecutionID' 
			,CONVERT(varchar(10),DATEADD("hh", -7, IntegE.InitiatedDateTime),101) + ' ' + RIGHT(CONVERT(varchar(30),DATEADD("hh", -7, IntegE.InitiatedDateTime),100),7) AS 'DataCaptureDate'
		FROM 
			[process].[Execution] AggE WITH(NOLOCK)
			JOIN 
			[process].[Execution] IntegE WITH(NOLOCK) ON AggE.ReferenceExecutionId = IntegE.ExecutionId
				AND AggE.FiscalYear = IntegE.FiscalYear
				AND AggE.FiscalYear = @FiscalYear
				AND AggE.StatusTypeId = 6
				AND IntegE.StatusTypeId = 6
				AND AggE.ExecutionTypeId IN (1,3)
				AND AggE.ProcessTypeId = 2
				
			JOIN
			ace.MembershipSummary ACE WITH (NOLOCK) ON ACE.ExecutionId = AggE.ExecutionId
				AND ACE.FiscalYear = AggE.FiscalYear
				AND ACE.AttendingLocalEducationAgencyId = @LocalEducationAgencyId
				WHERE Agge.Executionid =@Executionid
		GROUP BY 
			AggE.ReferenceExecutionId,IntegE.InitiatedDateTime
		ORDER BY 
			CONVERT(DATETIME,DATEADD("hh", -7, IntegE.InitiatedDateTime)) DESC





END

GO

