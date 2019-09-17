
/**********************************************************************************************************
**Procedure Name:
**      report.INTEG15_IntegrityStudentData
**
**Author:
**      Britto Augustine
**
**Description:  
**  Get integrity result data for INTEG15 report. Returns integrity results and error messages for
**  ADM, ELL, SPED integrity category
** 
**Input:
**  @FiscalYear - Fiscal year to filter upon
**	@ReportLEAId - LEAId to filter upon
**  @SchoolsList -  SchoolId(s) to filter upon
**	@IntegrityResultTypeList - Result type to filter upon
**  @IntegrityCategoryList - category to filter upon
**
**Output: 
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from INTEG15 report IntegrityStudetndata.rdl
**
**Execution:
		declare @SchoolList as varchar(max)
		select @SchoolList =  COALESCE(@SchoolList +',' ,'') + CONVERT(NVARCHAR(5),SchoolId ) 
		FROM entity.School where Fiscalyear = 2017 and localeducationagencyid = 4235	
	    exec [report].[INTEG15_IntegrityStudentData] 2017, 4235, @SchoolList, '1,2', '4,5,6' 
**
**Revision History:
**	b Augustine	10/25/2016	Initial creation
**	Rchinta		02/13/2018  Including the Executionid IN Filter to fix the integ 15 report after 915 changes
**	P Kanyar	02/16/2018  Fixed the duplicate record showing up when Student has multiple enrollments at same school(pre 915 bug)
**	P Kanyar	02/16/2018  Fixed the 915 logic, when the latest execution is 915 for the LEA that is running the report
**							Removed the 915 logic for all processtypes except ADM, STATE SPED, STATE ELL
**  Sucharita   08/30/2018  Added logic to get ErrorDescription from Integrity.IntegrityExceptionMessage table for Fiscalyear on or before 2017
**********************************************************************************************************************************************/
CREATE PROC [report].[INTEG15_IntegrityStudentData] 
	@FiscalYear int,
	@ReportLEAId int,
	@SchoolsList nvarchar(max),						-- comma separated list of school id(s)
	@IntegrityResultTypeList nvarchar(10),			-- comma separated list of codes (1 Passed/2 Failed) 
	@IntegrityCategoryList nvarchar(50)		 		-- comma separated list of IntegrityTypeIds (ADM,DRP,GCD 4/STATE SPED 5/STATE ELL 6/FED SPED 7/SUPPORT PGM 10/ accountability 11 )

AS
BEGIN


	-- storing IntegrityRuleTypeId(s) depending on the IntegrityCategoryId(IntegrityTypeId) supplied
	DECLARE @IntegrityRuleType TABLE (IntegrityRuleTypeId INT)
	
	INSERT INTO @IntegrityRuleType
	SELECT IntegrityRuleTypeId
	FROM [integrity].[IntegrityRuleType] irt
	JOIN [util].[Split](@IntegrityCategoryList, ',' ) icl 
				ON icl.Token = irt.IntegrityTypeId  
----------------------------------------------------------------------------------------------

	-- Bringing & storing all the successful execution ids for the FY= @FiscalYear
	SELECT 
		 FiscalYear
		,ExecutionId
		,ExecutionTypeId
		,ProcessTypeId 
	INTO #Temp_Execution
	FROM process.Execution (NOLOCK)
	WHERE FiscalYear = @FiscalYear			-- may consider creating indexes on this if we have performance issues
		AND StatusTypeId = 6

	SELECT Token 
	INTO #TempIntegrityCategoryList
	FROM [util].[Split](@IntegrityCategoryList, ',' )

	DECLARE @executionType int
	DECLARE @Execution TABLE
		(
			executionid INT
		)
-----------------------------------------------

-- Mapping category to process.execution

IF EXISTS( SELECT 1 FROM #TempIntegrityCategoryList WHERE Token IN (4,5,6))  -- if it is 4 or 5 or 6  category then we include ADM process Type 
     BEGIN                      

        SELECT TOP 1 @executionType= ExecutionTypeId 
        FROM #Temp_Execution 
        WHERE ProcessTypeId = 1 
        ORDER BY ExecutionId DESC

                        --If the execution Type of the record is statewide(1) then the most recent will be executionid that we want as it is a statewide run
            IF(@executionType= 1)
                    INSERT INTO @Execution
                    SELECT TOP 1 ExecutionId 
                    FROM #Temp_Execution 
                    WHERE ProcessTypeId = 1 
                    ORDER BY ExecutionId DESC
            
			ELSE		--Else if the executionType of the record is 915(3) Then we need to pull latest 915 execution
				BEGIN
					INSERT INTO @Execution				-- get latest 915 run for the district that is running the report
					SELECT DISTINCT TOP 1 E.ExecutionId 
					FROM #Temp_Execution E 
					INNER JOIN process.ExecutionEducationOrganization Eo
						ON E.ExecutionId = Eo.ExecutionId AND E.FiscalYear= Eo.FiscalYear
					WHERE ProcessTypeId = 1 AND ExecutionTypeId = 3 AND Eo.EducationOrganizationId = @ReportLEAId
					ORDER BY E.ExecutionId DESC

					IF NOT EXISTS (SELECT 1 FROM @Execution) -- if there is no latest 915 for the lea running the report, then get the latest statewide
						INSERT INTO @Execution			-- get latest statewide run for that fiscalYear
						SELECT TOP 1 ExecutionId 
						FROM #Temp_Execution 
						WHERE ProcessTypeId = 1 AND ExecutionTypeId = 1
						ORDER BY ExecutionId DESC         
				END
	 END

	IF EXISTS( SELECT 1 FROM #TempIntegrityCategoryList WHERE Token = 7)   -- if it is FED SPED category then we include FED SPED process TYPE
		INSERT INTO @Execution
		SELECT TOP 1 ExecutionId 
		FROM #Temp_Execution 
		WHERE ProcessTypeId = 10 
		ORDER BY ExecutionId DESC
 

	IF EXISTS( SELECT 1 FROM #TempIntegrityCategoryList WHERE Token = 10)  -- if it is Support program category then we include Support program process TYPE
        INSERT INTO @Execution
        SELECT TOP 1 ExecutionId 
        FROM #Temp_Execution  
        WHERE ProcessTypeId = 9 
        ORDER BY ExecutionId DESC
 

	IF EXISTS( SELECT 1 FROM #TempIntegrityCategoryList WHERE Token = 11) -- if it is Accountability NON-Payment category then we include Accountability NON-Payment process TYPE
        INSERT INTO @Execution
        SELECT TOP 1 ExecutionId 
        FROM #Temp_Execution 
        WHERE ProcessTypeId = 11
        ORDER BY ExecutionId DESC          


	SELECT DISTINCT
		 sch.SchoolId									AS 'SchoolID'
		,sch.SchoolName									AS 'SchoolName'
		,sch.FormattedSchoolCTDS						AS 'SchoolCTDS'
		,sic.IdentificationCode							AS 'DistrictStudentID'
		,stu.StudentUniqueId							AS 'StateStudentID'
		,stu.LastSurName								AS 'LastName'
		,stu.FirstName									AS 'FirstName'
		,ISNULL(LEFT(stu.MiddleName, 1), '')			AS 'MiddleInitial'
		,pst.Description								AS 'IntegrityCategory'
		,irt.Description								AS 'IntegrityType'
		,irt.IntegrityRuleTypeId						   
		,CASE ih.IntegrityResultTypeId 					   
			WHEN 1 THEN 'P'								   
			WHEN 2 THEN 'F'								   
 		  END											AS 'IntegrityStatus'
		,ies.Description								AS 'Severity'
		,ies.ExceptionSeverityId
		,iie.ExceptionMessageCode						AS 'ErrorCode'	
		,CASE
		 when ih.FiscalYear > 2017 then 
		    iie.ExceptionDetails							
          when  ih.FiscalYear <=2017 then    
		  iem.Description                                  
		END                                               AS 'ErrorDescription'	 	
		,CONVERT(nvarchar(8),ind.SchoolEntryDate, 1)	AS 'EntryDate' 	
	FROM 
		integrity.IntegrityHistory ih WITH (NOLOCK)				
			INNER JOIN 
		@Execution E 
				ON	E.Executionid = ih.executionid			
			INNER JOIN
		integrity.IntegrityNeed ind WITH (NOLOCK) 
				ON ih.IntegrityNeedId = ind.IntegrityNeedId
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
		[integrity].[IntegrityRuleType] irt WITH(NOLOCK) 
				ON ind.IntegrityRuleTypeId = irt.IntegrityRuleTypeId
			INNER JOIN
		entity.vw_School sch WITH(NOLOCK) 
				ON sch.SchoolId = ind.SchoolId
				AND sch.FiscalYear = @FiscalYear
			INNER JOIN
		[leadata].[Student] stu WITH(NOLOCK) 
				ON stu.StudentUSI = ind.StudentUSI
			INNER JOIN
		[leadata].[StudentSchoolAssociation] ssa WITH(NOLOCK) 
				ON ssa.FiscalYear = ind.FiscalYear
				AND ssa.StudentUSI = ind.StudentUSI
				AND ssa.SchoolId = ind.SchoolId
				AND ssa.EntryDate = ISNULl(ind.SchoolEntryDate, ssa.EntryDate)		--using IsNull check because the program and attendance rules will not have SchoolEntryDate in IntegrityNeed table
																					-- this causes duplicate records (sped,fed sped, ELL ) on the report for a student if the student has multiple enrollments at same school, so using distinct
			INNER JOIN
		[leadata].[RecordOwnership] ssaro WITH(NOLOCK) 
				ON ssaro.FiscalYear = @FiscalYear
				AND ssaro.ResourceId = ssa.SourceId
				AND ssaro.RecordOwnershipTypeId = 1																				-- Student School
				AND (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId OR sch.LocalEducationAgencyId = @ReportLEAId)		-- Submitted LEA and DOA can see the data
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
			LEFT JOIN
		[leadata].[StudentIdentificationCode] sic WITH(NOLOCK) 
				ON sic.StudentUSI = ind.StudentUSI 
				AND sic.StudentIdentificationSystemTypeId = 2												-- District Student Id
				AND sic.AssigningOrganizationIdentificationCode = CONVERT(nvarchar(60),@ReportLEAId)		-- to bring District Student Id assigned by the LEA that is running the report
	WHERE	
		 ih.FiscalYear = @FiscalYear

	ORDER BY 
		 SchoolName
		,IntegrityCategory
		,irt.IntegrityRuleTypeId									
		,ies.ExceptionSeverityId
		,ErrorCode	
		,LastName
		,FirstName
		,StateStudentID

DROP TABLE #TempIntegrityCategoryList
DROP TABLE #Temp_Execution


END
GO


