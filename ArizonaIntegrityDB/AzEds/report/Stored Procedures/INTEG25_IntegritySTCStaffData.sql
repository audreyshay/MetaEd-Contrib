/**********************************************************************************************************
**Procedure Name:
**      report.INTEG25_IntegritySTCStaffData
**
**Author:
**      Britto Augustine
**
**Description:  
**  Get integrity result data for INTEG25 report. Returns integrity results and error messages for
**  STC Staff Integrity rules
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
**	Called from INTEG25 report
**
**Execution:
		declare @SchoolList as varchar(max)
		select @SchoolList =  COALESCE(@SchoolList +',' ,'') + CONVERT(NVARCHAR(5),SchoolId ) 
		FROM entity.School where Fiscalyear = 2017 and localeducationagencyid = 4235	
	    exec [report].[INTEG25_IntegritySTCStaffData] 2017, 4235, @SchoolList, '1,2'
**
**Revision History:
**	b Augustine	10/31/2016	Initial creation
**	P Kanyar	02/20/2018	Modified to include the latest Executionid in Filter to fix report after 915 changes
**
************************************************************************************************************/
CREATE PROC [report].[INTEG25_IntegritySTCStaffData] 
	@FiscalYear int,
	@ReportLEAId int,
	@SchoolsList nvarchar(max),						-- comma separated list of school id(s)
	@IntegrityResultTypeList nvarchar(10)			-- comma separated list of codes (1 Passed/2 Failed) 

AS
BEGIN

	-- breaking @SchoolsList into a table
	DECLARE @School TABLE (SchoolId INT)
	
	INSERT INTO @School 
	SELECT DISTINCT [Token] FROM [util].[Split](@SchoolsList,',')

	-- breaking @IntegrityResultTypeList into a table
	DECLARE @IntegrityResultType TABLE (IntegrityResultTypeId INT)
	
	INSERT INTO @IntegrityResultType 
	SELECT DISTINCT [Token] FROM [util].[Split](@IntegrityResultTypeList,',')


	-- storing IntegrityRuleTypeId(s) 
	DECLARE @IntegrityRuleType TABLE (IntegrityRuleTypeId INT)
	
	INSERT INTO @IntegrityRuleType
	SELECT IntegrityRuleTypeId
	FROM [integrity].[IntegrityRuleType] irt
	WHERE ReportCategoryId = 2				-- filtering only Staff type STC errors


	-- getting the latest execution id for STC integrity
	DECLARE @ExecutionId INT

	SELECT TOP 1 @ExecutionId = ExecutionId 
        FROM process.Execution (nolock) 
        WHERE ProcessTypeId = 8				-- STC integrity 
			AND FiscalYear = @FiscalYear
			AND  StatusTypeId = 6
        ORDER BY ExecutionId DESC

				
	SELECT DISTINCT
		 sch.SchoolId										    AS "SchoolID"
		,sch.SchoolName											AS "SchoolName"
		,sch.FormattedSchoolCTDS								AS "SchoolCTDS"
		,stf.StaffUniqueId										AS "StateTeacherID"
		,stf.LastSurName										AS "LastName"
		,stf.FirstName											AS "FirstName"
		,ind.LocalcourseCode
		,pst.Description										AS "IntegrityCategory"
		,irt.Description										AS "IntegrityType"
		,CASE ih.IntegrityResultTypeId 
			WHEN 1 THEN 'P'
			WHEN 2 THEN 'F'
 		  END													AS "IntegrityStatus"
		,ies.Description										AS "Severity"
		,iem.ExceptionMessageCode								AS "ErrorCode"	
		,iem.Description										AS "ErrorDescription"
		,CONVERT(nvarchar(8), ssa.BeginDate , 1)				AS "BeginDate" 
		,ies.ExceptionSeverityId

	FROM 
		integrity.IntegrityHistory ih WITH (NOLOCK)				
			INNER JOIN
		integrity.IntegrityNeed ind WITH (NOLOCK) 
				ON ih.IntegrityNeedId = ind.IntegrityNeedId
					AND ih.FiscalYear = @FiscalYear
					AND ih.ExecutionId = @ExecutionId
			INNER JOIN 
		@School s
				ON s.SchoolId = ind.SchoolId			
			INNER JOIN			 
		@IntegrityResultType irlt
				ON irlt.IntegrityResultTypeId = ih.IntegrityResultTypeId   
			INNER JOIN			 
		@IntegrityRuleType ir
				ON ir.IntegrityRuleTypeId = ind.IntegrityRuleTypeId
			INNER JOIN 
		integrity.IntegrityRuleType irt WITH (NOLOCK) 
				ON ind.IntegrityRuleTypeId = irt.IntegrityRuleTypeId
			INNER JOIN
		entity.vw_School sch WITH (NOLOCK) 
				ON sch.SchoolId = ind.SchoolId
				AND sch.FiscalYear = @FiscalYear
			INNER JOIN
		leadata.StaffSectionAssociation ssa WITH (NOLOCK) 
				ON ind.FiscalYear = ssa.FiscalYear		
				AND ind.StaffUSI = ssa.StaffUSI	
				AND ind.SchoolId = ssa.SchoolId
				AND ind.LocalCourseCode = ssa.LocalCourseCode
				AND ind.TermTypeId = ssa.TermTypeId
				AND ind.SchoolYear = ssa.SchoolYear
			INNER JOIN 
		leadata.RecordOwnership ssaro WITH(NOLOCK) 
				ON ssaro.FiscalYear = @FiscalYear
				AND ssaro.ResourceId = ssa.SourceId
				AND ssaro.RecordOwnershipTypeId = 12																			-- staff section
				AND (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId OR sch.LocalEducationAgencyId = @ReportLEAId)		-- Submitted LEA and DOA can see the data
			INNER JOIN
		leadata.Staff stf WITH (NOLOCK) 
				ON stf.StaffUSI = ssa.StaffUSI
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
		,LastName
		,FirstName
		,stf.StaffUniqueId

END