/*************************************************************************************
**Procedure Name:
**      report.GetAllExecIdDataCaptureDate
**
**Author:
**      Amit Verma
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
**	Amit Verma	05/24/2016	Initial creation
**	P Kanyar	07/14/2016	Added param @LocalEducationAgencyId to filter upon,
**	P Kanyar	07/15/2016	changed the order by of DataCaptureDate to desc 
**	P Kanyar	11/03/2017	Added ExecutionTypeId of 3 to bring DataCapture for 915 ACE runs 
**	Harsha Kankanala	11/28/2018	Customized the stored proc for ADM15A
**	Harsha Kankanala	12/11/2018  Corrected the table name 
**	Harsha Kankanala	3/21/2019   Created the stored proc for 30
**************************************************************************************/	

CREATE PROC [report].[GetAllExecIdDataCaptureDateADM30]	
@FiscalYear INT,
@CaptureDate DATETIME = NULL,
@LocalEducationAgencyId INT,
@District VARCHAR(250) 
AS
BEGIN

SET NOCOUNT ON;
     


	SELECT 
			 MAX(AggE.ExecutionId)			AS 'AggregationExecutionID'
			,AggE.ReferenceExecutionId		AS 'IntegrityExecutionID' 
			,CONVERT(varchar(10),DATEADD("hh", -7, IntegE.InitiatedDateTime),101) + ' ' + RIGHT(CONVERT(varchar(30),DATEADD("hh", -7, IntegE.InitiatedDateTime),100),7) AS 'DataCaptureDate'
			,AggE.FiscalYear
      INTO  #Execution
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
				AND (@CaptureDate IS NULL OR CONVERT(varchar(10),DATEADD("hh", -7, IntegE.InitiatedDateTime),101) + ' ' + RIGHT(CONVERT(varchar(30),DATEADD("hh", -7, IntegE.InitiatedDateTime),100),7) = @CaptureDate)
				GROUP BY 
			AggE.ReferenceExecutionId,IntegE.InitiatedDateTime,AggE.FiscalYear
		ORDER BY 
			CONVERT(DATETIME,DATEADD("hh", -7, IntegE.InitiatedDateTime)) DESC


		CREATE NONCLUSTERED INDEX IX_EXECUTION
		ON #Execution (FISCALYEAR)
		INCLUDE (AggregationExecutionID,DataCaptureDate)

	IF (@District = 'Residence')
	BEGIN	
	-- Get Integrity Execution Id and Data Capture Date for the above Aggregation ID

		SELECT 
			 AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		FROM 
			#Execution Agge
			JOIN
			(Select ExecutionId,FiscalYear,ResidentEducationOrganizationId from ace.MembershipSummary  WITH (NOLOCK) Where FiscalYear = @FiscalYear) ACE ON ACE.ExecutionId = AggE.AggregationExecutionID
				AND ACE.FiscalYear = AggE.FiscalYear
				AND ACE.ResidentEducationOrganizationId = @LocalEducationAgencyId
             group by  AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		

	END
	ELSE IF (@District = 'Attendance')
	BEGIN	
	-- Get Integrity Execution Id and Data Capture Date for the above Aggregation ID

			SELECT 
			 AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		FROM 
			#Execution Agge
			JOIN
			(Select ExecutionId,FiscalYear,AttendingLocalEducationAgencyId from ace.MembershipSummary ACE WITH (NOLOCK) Where FiscalYear = @FiscalYear) ACE ON ACE.ExecutionId = AggE.AggregationExecutionID
				AND ACE.FiscalYear = AggE.FiscalYear
				AND ACE.AttendingLocalEducationAgencyId = @LocalEducationAgencyId
		 group by  AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate

	END
	ELSE IF (@District = 'Submitted')
	BEGIN	
	-- Get Integrity Execution Id and Data Capture Date for the above Aggregation ID

			SELECT 
			 AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		FROM 
			#Execution Agge
			JOIN
			(SELECT ExecutionId,FiscalYear,SubmittedByEducationOrganizationId FROM ace.MembershipSummary  WITH (NOLOCK) Where FiscalYear = @FiscalYear) ACE ON ACE.ExecutionId = AggE.AggregationExecutionID
				AND ACE.FiscalYear = AggE.FiscalYear
				AND ACE.SubmittedByEducationOrganizationId = @LocalEducationAgencyId
				 group by  AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate

	END
	ELSE 
	BEGIN	
	-- Get Integrity Execution Id and Data Capture Date for the above Aggregation ID

			SELECT 
			 AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		FROM 
			#Execution Agge
			JOIN
			(SELECT ExecutionId,FiscalYear,SubmittedByEducationOrganizationId,AttendingLocalEducationAgencyId,ResidentEducationOrganizationId  FROM ace.MembershipSummary WITH (NOLOCK) Where FiscalYear = @FiscalYear) ACE ON ACE.ExecutionId = AggE.AggregationExecutionID
				AND ACE.FiscalYear = AggE.FiscalYear
				AND (ACE.SubmittedByEducationOrganizationId = @LocalEducationAgencyId OR ACE.AttendingLocalEducationAgencyId = @LocalEducationAgencyId OR ACE.ResidentEducationOrganizationId = @LocalEducationAgencyId) --11/28/2018 Corrected the issue where ResidentEducationOrganizationId is not being used
		 group by  AggregationExecutionID
			,IntegrityExecutionID
			,DataCaptureDate
		DROP TABLE #Execution
	END



END



GO

