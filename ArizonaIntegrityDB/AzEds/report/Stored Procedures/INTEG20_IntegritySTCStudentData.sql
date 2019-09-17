
/**********************************************************************************************************
**Procedure Name:
**      report.INTEG20_IntegritySTCStudentData
**
**Author:
**      Britto Augustine
**
**Description:  
**  Get integrity result data for INTEG20 report. Returns integrity results and error messages for
**  STC Student Integrity rules
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
**	Called from INTEG20 report
**
**Execution:
		declare @SchoolList as varchar(max)
		select @SchoolList =  COALESCE(@SchoolList +',' ,'') + CONVERT(NVARCHAR(5),SchoolId ) 
		FROM entity.School where Fiscalyear = 2017 and localeducationagencyid = 4235	
	    exec [report].[INTEG20_IntegritySTCStudentData] 2017, 4235, @SchoolList, '1,2'
**
**Revision History:
**	b Augustine	10/31/2016	Initial creation
**	P Kanyar	02/16/2018	Modified to include the latest Executionid in Filter to fix the report after 915 changes
**
************************************************************************************************************/
CREATE PROC [report].[INTEG20_IntegritySTCStudentData] 
	@FiscalYear int,
	@ReportLEAId int,
	@SchoolsList nvarchar(max),								-- comma separated list of school id(s)
	@IntegrityResultTypeList nvarchar(10)					-- comma separated list of codes (1 Passed/2 Failed) 

AS
BEGIN

	-- storing IntegrityRuleTypeId(s) 
	DECLARE @IntegrityRuleType TABLE (IntegrityRuleTypeId INT)
	
	INSERT INTO @IntegrityRuleType
	SELECT IntegrityRuleTypeId
	FROM [integrity].[IntegrityRuleType] irt
	WHERE ReportCategoryId = 4				-- filtering only student type STC errors


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
		,sic.IdentificationCode									AS "DistrictStudentID"
		,stu.StudentUniqueId									AS "StateStudentID"
		,stu.LastSurName										AS "LastName"
		,stu.FirstName											AS "FirstName"
		,ISNULL(LEFT(stu.MiddleName, 1), '')					AS "MiddleInitial"
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
		 [util].[Split](@SchoolsList,',') s 
				ON s.Token = ind.SchoolId		
			INNER JOIN			 
		[util].[Split](@IntegrityResultTypeList,',') irlt   
				ON irlt.Token = ih.IntegrityResultTypeId 
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
		leadata.StudentSectionAssociation ssa WITH (NOLOCK) 
				 ON ind.FiscalYear = ssa.FiscalYear		
				AND ind.StudentUSI = ssa.StudentUSI	
				AND ind.SchoolId = ssa.SchoolId
				AND ind.LocalCourseCode = ssa.LocalCourseCode
				AND ind.TermTypeId = ssa.TermTypeId
				AND ind.SchoolYear = ssa.SchoolYear
			INNER JOIN 
		leadata.RecordOwnership ssaro WITH(NOLOCK) 
				ON ssaro.FiscalYear = @FiscalYear
				AND ssaro.ResourceId = ssa.SourceId
				AND ssaro.RecordOwnershipTypeId = 11																			-- student section
				AND (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId OR sch.LocalEducationAgencyId = @ReportLEAId)		-- Submitted LEA and DOA can see the data
			INNER JOIN
		leadata.Student stu WITH (NOLOCK) 
				ON stu.StudentUSI = ssa.StudentUSI
			INNER JOIN
		[process].[ProcessSubType] pst WITH (NOLOCK) 
				ON pst.ProcessSubTypeId = irt.IntegrityTypeId
			LEFT JOIN
		[integrity].[IntegrityException] iie WITH (NOLOCK) 
				ON iie.IntegrityHistoryId = ih.IntegrityHistoryId
			LEFT JOIN
		[integrity].[IntegrityExceptionMessage] iem WITH (NOLOCK) 
				ON iem.ExceptionMessageCode = iie.ExceptionMessageCode
			LEFT JOIN
		[integrity].[ExceptionSeverity] ies WITH (NOLOCK) 
				ON ies.ExceptionSeverityId = iie.ExceptionSeverityId
			LEFT JOIN
		[leadata].[StudentIdentificationCode] sic WITH(NOLOCK) 
				 ON sic.StudentUSI = ssa.StudentUSI 
				AND sic.StudentIdentificationSystemTypeId = 2												-- District Student Id
				AND sic.AssigningOrganizationIdentificationCode = CONVERT(nvarchar(60), @ReportLEAId)		-- to bring District Student Id assigned by the LEA that is running the report
	ORDER BY 
		 SchoolName
		,IntegrityStatus
		,ies.ExceptionSeverityId
		,ErrorCode	
		,LastName
		,FirstName
		,stu.StudentUniqueId

END