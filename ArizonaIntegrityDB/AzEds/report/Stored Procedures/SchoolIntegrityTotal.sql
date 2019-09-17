
/**********************************************************************************************************
**Procedure Name:
**      report.SchoolIntegrityTotal
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Gives total number of Integrity Records for each school
**   
**Input:
**  @SchoolsList -  SchoolId(s) to filter upon
**  @FiscalYear - Fiscal year to filter upon
**	@ReportLEAId - LEAId to filter upon
**	@IntegrityResultTypeList - Integrity Status of the record to filter upon
**	@IntegrityCategoryList - Integrity Category of the record to filter upon
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from Integrity Report- INTEG15
**
**Revision History:
**	P Kanyar	9/04/2015	Initial creation
**	P Kanyar	9/09/2015	Added Parameters to run the report for specific Integrity Status - NotRun,   
**							Passed, Failed & to run for specific Integrity Category types
**	P Kanyar	9/11/2015	Created & Used [Split] function in the AzEDS db 
**	P Kanyar	10/29/2015	Implemented Report Security 1 & 2, so that one LEA does not see other LEA's data
**	P Kanyar	03/17/2016	Performance tuning
**
************************************************************************************************************/

CREATE PROC [report].[SchoolIntegrityTotal]
	@SchoolsList nvarchar(max),				-- comma separated list of school id(s)
	@IntegrityResultTypeList nvarchar(10),	-- 1 Passed, 2 Failed (comma separated list of codes)
	@IntegrityCategoryList nvarchar(50),	-- ADM 4,STATE SPED 5,STATE ELL 6, FED SPED 7,OCT SPED 8,STC 9, SUPPORT PGM 10 (comma separated list of codes)
	@FiscalYear int = 2015,
	@ReportLEAId int = 4153

AS
BEGIN

	-- breaking comma separated list & storing in to table variables
	DECLARE @Schools TABLE ([SchoolId] int)
	INSERT INTO @Schools SELECT DISTINCT [Token] FROM [util].[Split](@SchoolsList, ',' ) 

	DECLARE @IntegrityResultType TABLE (IntegrityResultTypeId int)
	INSERT INTO @IntegrityResultType SELECT DISTINCT [Token] FROM [util].[Split](@IntegrityResultTypeList,',')

	DECLARE @IntegrityCategory TABLE (IntegrityCategoryId int)
	INSERT INTO @IntegrityCategory SELECT DISTINCT [Token] FROM [util].[Split](@IntegrityCategoryList,',')


	CREATE TABLE #LatestHistoryIdTable
			( IntegrityHistoryId bigint PRIMARY KEY
			 ,StudentUSI int
			 ,SchoolId int
			 ,SchoolEntryDate date
			 ,IntegrityRuleTypeId int
			 ,IntegrityResultTypeId int
			 ,IntegrityRunDateTime datetime
			 ,RN bigint )


	CREATE NONCLUSTERED INDEX IDX1 ON  #LatestHistoryIdTable
			(
			 IntegrityRuleTypeId ASC
			,IntegrityResultTypeId ASC
			)
	INCLUDE ([IntegrityHistoryId]) ON [PRIMARY]


	-- bringing latest history ids for all category types (both failed and paseed)
	INSERT INTO #LatestHistoryIdTable 
	EXEC [report].GetLatestIntegrityHistoryIdList @SchoolsList,@FiscalYear,@ReportLEAId 


	-- getting Main report data
	SELECT	
		 SUBSTRING(LTRIM(eo.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 7, 3) AS 'SchoolCTDS'
		,sq.SchoolId
		,eo.NameofInstitution + ' (' + CAST(sq.SchoolId AS nvarchar(20)) + ')'	AS 'SchoolName'
		,COUNT(IntegrityHistoryId)												AS 'TotalRecords'
	FROM 
		(
			SELECT 
				lht.IntegrityHistoryId
				--,lht.IntegrityResultTypeId
				,lht.SchoolId
				--,lht.IntegrityRunDateTime	
				--,lht.SchoolEntryDate		
			FROM 
				#LatestHistoryIdTable lht
					INNER JOIN
				@IntegrityResultType ilt ON ilt.IntegrityResultTypeId = lht.IntegrityResultTypeId
					INNER JOIN
				[integrity].[IntegrityRuleType] irt ON lht.IntegrityRuleTypeId = irt.IntegrityRuleTypeId
					INNER JOIN
				@IntegrityCategory ic ON ic.IntegrityCategoryId = irt.IntegrityTypeId
					LEFT JOIN
				[integrity].[IntegrityException] iie ON iie.IntegrityHistoryId = lht.IntegrityHistoryId
		)sq
			INNER JOIN
		[entity].[School] sch ON sch.SchoolId = sq.SchoolId 
				AND sch.FiscalYear = @FiscalYear
			INNER JOIN
		[entity].[EducationOrganization] eo ON eo.EducationOrganizationId = sq.SchoolId
				AND eo.FiscalYear = @FiscalYear
	GROUP BY
		 sq.SchoolId
		,eo.NameOfInstitution
		,eo.CTDS
	ORDER BY
		SchoolName	
		
	DROP TABLE #LatestHistoryIdTable	
						
END

/* END report.SchoolIntegrityTotal */