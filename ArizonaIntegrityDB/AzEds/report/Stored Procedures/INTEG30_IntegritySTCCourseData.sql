/******************************************************************************************************************
**Procedure Name:
**      report.INTEG30_IntegritySTCCourseData
**
**Author:
**      Britto Augustine
**
**Description:  
**  Get integrity result data for INTEG30 report. Returns integrity results and error messages for
**  STC Course Integrity rules
** 
**Input:
**  @FiscalYear - Fiscal year to filter upon
**	@ReportLEAId - LEAId to filter upon
**  @SchoolsList -  SchoolId(s) to filter upon
**	@IntegrityResultTypeList - Result type to filter upon
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from INTEG30 report
**
**Execution:
		declare @SchoolList as varchar(max)
		select @SchoolList =  COALESCE(@SchoolList +',' ,'') + CONVERT(NVARCHAR(5),SchoolId ) 
		FROM entity.School where Fiscalyear = 2017 and localeducationagencyid = 4235	
	    exec [report].[INTEG30_IntegritySTCCourseData] 2017, 4235, @SchoolList, '1,2'
**
**Revision History:
**	b Augustine	10/25/2016	Initial creation
**	P Kanyar	02/21/2018	Modified to include the latest Executionid in Filter to fix report after 915 changes
------------------------------------------------------------------------------------------------------------
**  P Kanyar	03/01/2019	Added new column SessionName in the joins for AZEDS 5.0 changes
**
********************************************************************************************************************/
--declare @FiscalYear int=2020,@ReportLEAId int=4242,	@SchoolsList nvarchar(max)='5110,5111',	@IntegrityResultTypeList nvarchar(10)='1'				

CREATE PROC [report].[INTEG30_IntegritySTCCourseData] 
	@FiscalYear int,
	@ReportLEAId int,
	@SchoolsList nvarchar(max),						-- comma separated list of school id(s)
	@IntegrityResultTypeList nvarchar(10)			-- comma separated list of codes (1 Passed/2 Failed) 
AS
BEGIN

	-- storing IntegrityRuleTypeId(s) 
	DECLARE @IntegrityRuleType TABLE (IntegrityRuleTypeId INT)
	
	INSERT INTO @IntegrityRuleType
	SELECT IntegrityRuleTypeId
	FROM [integrity].[IntegrityRuleType] irt
	WHERE ReportCategoryId = 1				-- filtering only Course type errors



	-- getting the latest execution id for STC integrity
	DECLARE @ExecutionId INT

	SELECT TOP 1 @ExecutionId = ExecutionId 
        FROM process.Execution (nolock) 
        WHERE ProcessTypeId = 8				-- STC integrity 
			AND FiscalYear = @FiscalYear
			AND  StatusTypeId = 6
        ORDER BY ExecutionId DESC

				
	SELECT DISTINCT
		 sch.SchoolId							AS "SchoolID"
		,sch.SchoolName							AS "SchoolName"
		,sch.FormattedSchoolCTDS				AS "SchoolCTDS"
		,co.LocalcourseCode
		,co.LocalCourseTitle				
		,sse.SessionName
		,pst.Description						AS "IntegrityCategory"
		,irt.Description						AS "IntegrityType"
		,CASE ih.IntegrityResultTypeId 
			WHEN 1 THEN 'P'
			WHEN 2 THEN 'F'
 		  END									AS "IntegrityStatus"
		,ies.Description						AS "Severity"
		,iem.ExceptionMessageCode				AS "ErrorCode"	
		,iem.Description						AS "ErrorDescription"
		,CONVERT(nvarchar(8),sse.BeginDate , 1)	AS "BeginDate" 
		,ies.ExceptionSeverityId
	FROM 
		integrity.IntegrityHistory ih WITH (NOLOCK)				
			INNER JOIN
		integrity.IntegrityNeed ind WITH (NOLOCK) 
				ON ih.IntegrityNeedId = ind.IntegrityNeedId
					AND ih.FiscalYear = @FiscalYear
					AND ih.ExecutionId = @ExecutionId
			INNER JOIN 
		[util].[Split](@SchoolsList,',') s
				ON s.Token = ind.SchoolId		
			INNER JOIN			 
		[util].[Split](@IntegrityResultTypeList,',') irlt 
				ON irlt.token = ih.IntegrityResultTypeId 
			INNER JOIN			 
		@IntegrityRuleType ir
				ON ir.IntegrityRuleTypeId = ind.IntegrityRuleTypeId
			INNER JOIN 
		integrity.IntegrityRuleType irt WITH(NOLOCK) 
				ON ind.IntegrityRuleTypeId = irt.IntegrityRuleTypeId
			INNER JOIN
		entity.vw_School sch WITH(NOLOCK) 
				ON sch.SchoolId = ind.SchoolId
				AND sch.FiscalYear = @FiscalYear
			INNER JOIN
		leadata.[Section] sec WITH(NOLOCK) 
				 ON ind.FiscalYear = sec.FiscalYear			
				AND ind.SchoolId = sec.SchoolId
				AND ind.TermTypeId = sec.TermTypeId
				AND ind.SchoolYear = sec.SchoolYear  
				AND ind.LocalCourseCode = sec.LocalCourseCode
			INNER JOIN 
		[leadata].[RecordOwnership] ssaro WITH(NOLOCK) 
				ON ssaro.FiscalYear = @FiscalYear
				AND ssaro.ResourceId = sec.SourceId
				AND ssaro.RecordOwnershipTypeId = 6																				-- Course section
				AND (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId OR sch.LocalEducationAgencyId = @ReportLEAId)		-- Submitted LEA and DOA can see the data
			INNER JOIN
		leadata.[Session] sse WITH(NOLOCK) 
				 ON sec.FiscalYear = sse.FiscalYear			
				AND sec.SchoolId = sse.SchoolId
				AND sec.TermTypeId = sse.TermTypeId
				AND sec.SchoolYear = sse.SchoolYear  
				AND sec.SessionName = sse.SessionName	-- added for azeds 5.0 changes
			INNER JOIN
		leadata.CourseOffering co WITH(NOLOCK) 
				 ON sec.FiscalYear = co.FiscalYear  
				AND sec.SchoolId = co.SchoolId
				AND sec.TermTypeId = co.TermTypeId
				AND sec.SchoolYear = co.SchoolYear
				AND sec.LocalCourseCode = co.LocalCourseCode
				AND sec.SessionName = co.SessionName	-- added for azeds 5.0 changes
			INNER JOIN
		[process].[ProcessSubType] pst WITH(NOLOCK) 
				ON pst.ProcessSubTypeId = irt.IntegrityTypeId
			LEFT JOIN
		[integrity].[IntegrityException] iie WITH(NOLOCK) 
				ON iie.IntegrityHistoryId = ih.IntegrityHistoryId
			LEFT JOIN
		[integrity].[IntegrityExceptionMessage] iem WITH(NOLOCK) 
				ON iem.ExceptionMessageCode = iie.ExceptionMessageCode
			LEFT JOIN
		[integrity].[ExceptionSeverity] ies WITH(NOLOCK) 
				ON ies.ExceptionSeverityId = iie.ExceptionSeverityId
	ORDER BY 
		 SchoolName
		,IntegrityStatus
		,ies.ExceptionSeverityId
		,ErrorCode	
		,LocalCourseCode

END