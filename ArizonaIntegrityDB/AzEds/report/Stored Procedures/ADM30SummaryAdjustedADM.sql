
/******************************************************************************************************************
**Procedure Name:
**      report.ADM30SummaryAdjustedADM
**
**Author:
**      Harsha Kankanala
**
**Description:  
**  Gives Total NON AOI, AOI FT, AOI PT ADMs for different Grades & Reporting periods
**   
**Input:
**	@LEAId - DOR district to filter upon
**  @FiscalYear - Fiscal year to filter upon
**	@ExecutionID - latest Aggregation Execution ID coming from GetLatestExecIdDataCaptureDate
**
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from ADM30SummaryAdjustedADM.rdl (ADM20 Report)
**
**Revision History:
**	Harsha Kankanala    3/21/2019   Initial Creation
** Harsha Kankanala     05/16/2019  Changed the stored proc to point to Column  UnadjustedAverageDailyMembership for PreLimited after loading into Summary Table
***************************************************************************************************************/
CREATE  PROC [report].[ADM30SummaryAdjustedADM] --4235,'78917,4984,4983,4980,4982,4981,4979,78932,78930,4975,4974,4957,4954,4946,4977,4951,4924,91812,4955,4916,4918,4921,4940,79490,4925,4915,90753,4927,79807,4960,4936,79225,4941,4959,4919,6229,4945,4917,4943,4973,4971,4931,4947,4933,492,4938,4922,89593,4930,4926,90752,4952,4937,4953,4920,4969,4929,79489,4958,4956,4913,4939,4967,4935,4934,78938,4932,4949,4944,4962,4948,4923,4970,4961,90303,92351,79687,80046',2019,'Submitted', 11432,'PreLimitedADM'
	@LEAId INT, 
	@SchoolsList	NVARCHAR(max),
	@FiscalYear INT,
	@District       VARCHAR(100),
	@ExecutionID INT,			-- latest Aggregation Execution ID coming from GetLatestExecIdDataCaptureDate stored proc,
	@ReportType NVARCHAR(30) --pre-limited


AS
BEGIN

SET NOCOUNT ON;

-- Reporting Period Type Projected or Actual
	SELECT ReportingPeriodId,
	       MIN(ReportingPeriodTypeId) AS ReportingPeriodTypeId
	INTO #ReportingPeriod
    FROM [ace].[MembershipSummary] 
	WHERE ExecutionId = @ExecutionID  
		  AND ResidentEducationOrganizationId = @LEAId 
		  AND FiscalYear = @FiscalYear
		  AND ADMTypeId = 1
		  AND ReportingPeriodId IN (1,5,6)
	GROUP BY ReportingPeriodId

	SELECT GLT.GradeLevelTypeId,
	       GLT.CodeValue AS Grade,
		   GLT.GradeGroup,
		   RP.ReportingPeriodId,
		   RP.ReportingPeriodTypeId
	INTO #GradeAndReportingPeriod
	FROM #ReportingPeriod RP 
	CROSS JOIN entity.GradeLevelType GLT
	WHERE GLT.GradeGroup IS NOT NULL

	DECLARE @Schools TABLE 
(
	[SchoolId] int
)

-- Turn the list of schools into a table
INSERT INTO @Schools
SELECT DISTINCT 
	[Token] 
FROM 
	[util].[Split](@SchoolsList, ',') 

--Load Into Temp Table and reuse the table 
select * 
INTO #MembershipSummary
from [ace].[MembershipSummary] 
WITH(NOLOCK) 
WHERE ExecutionId = @ExecutionID  
AND ResidentEducationOrganizationId = @LEAId 
AND FiscalYear = @FiscalYear



IF (@ReportType = 'LimitedADM' )
BEGIN
IF (@District = 'Residence')
BEGIN
 SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.ResidentEducationOrganizationId,
	   --MS.FundingTypeId,
	   MS.FTFStatus,
	   MS.LimitedAverageDailyMembership,
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	  
	INTO #MembershipSummaryResident
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		   INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMSummaryResident 
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int)
   

   
			BEGIN
			INSERT INTO #ADMSummaryResident 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryResident MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryResident MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryResident MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryResident MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryResident MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolID
	INTO #ADMReportResident
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,Schoolid
			FROM #ADMSummaryResident
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId 
		   ,Schoolid
		   ,EO.NameOfInstitution
	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMReportResident ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
		LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
			 

	DROP TABLE #ADMSummaryResident
	DROP TABLE #MembershipSummaryResident
	--DROP TABLE #ReportingPeriod
	DROP TABLE #ADMReportResident
--	DROP TABLE #GradeAndReportingPeriod

END

ELSE IF (@District = 'Attendance')
BEGIN
 SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.AttendingLocalEducationAgencyId,
	   --MS.FundingTypeId,
	   MS.FTFStatus,
	   MS.LimitedAverageDailyMembership,
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	  
	INTO #MembershipSummaryAttending
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		   INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE
		  FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMSummaryAttending 
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int)
   

   
			BEGIN
			INSERT INTO #ADMSummaryAttending 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryAttending MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryAttending MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryAttending MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryAttending MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryAttending MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolID
	INTO #ADMReportAttending
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,Schoolid
			FROM #ADMSummaryAttending
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId 
		   ,Schoolid
		   ,EO.NameOfInstitution
	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMReportAttending ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
           LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMSummaryAttending
	DROP TABLE #MembershipSummaryAttending
	DROP TABLE #ReportingPeriod
	DROP TABLE #ADMReportAttending
--	DROP TABLE #GradeAndReportingPeriod

END
ELSE IF (@District = 'Submitted')
BEGIN
 SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.SubmittedByEducationOrganizationId,
	   --MS.FundingTypeId,
	   MS.FTFStatus,
	   MS.LimitedAverageDailyMembership,
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	  
	INTO #MembershipSummarySubmitted
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		   INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMSummarySubmitted 
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int)
   

   
			BEGIN
			INSERT INTO #ADMSummarySubmitted  
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummarySubmitted MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummarySubmitted MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummarySubmitted MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummarySubmitted MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummarySubmitted MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolID
	INTO #ADMReportSubmitted
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,Schoolid
			FROM #ADMSummarySubmitted
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId 
		   ,Schoolid
		   ,EO.NameOfInstitution
	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMReportSubmitted ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
			 LEFT  JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMSummarySubmitted
	DROP TABLE #MembershipSummarySubmitted
	--DROP TABLE #ReportingPeriod
	DROP TABLE #ADMReportSubmitted
--	DROP TABLE #GradeAndReportingPeriod

END
ELSE IF (@District = 'ALL')
BEGIN
 SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.ResidentEducationOrganizationId,
	   --MS.FundingTypeId,
	   MS.FTFStatus,
	   MS.LimitedAverageDailyMembership,
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	  
	INTO #MembershipSummaryALL
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		   INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE 
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMSummaryALL 
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int)
   

   
			BEGIN
			INSERT INTO #ADMSummaryALL 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryALL MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryALL MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryALL MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryALL MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.LimitedAverageDailyMembership),4)	AS TOTAL_ADM
							,MS.SchoolId
						FROM #MembershipSummaryALL MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,MS.SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolID
	INTO #ADMReportALL
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,Schoolid
			FROM #ADMSummaryALL
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId 
		   ,Schoolid
		   ,EO.NameOfInstitution
	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMReportALL ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
			      LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMSummaryALL
	DROP TABLE #MembershipSummaryALL
	--DROP TABLE #ReportingPeriod
	DROP TABLE #ADMReportALL
--	DROP TABLE #GradeAndReportingPeriod

END
END
IF (@ReportType = 'PreLimitedADM')
BEGIN
IF (@District = 'Residence')
BEGIN

SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.ResidentEducationOrganizationId,
	   --MS.FundingTypeId,
	    [FTFStatus],
	   MS.[UnadjustedAverageDailyMembership],
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	INTO #MembershipIntervalResidence
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		     INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE 
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMIntervalResidence
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int )
   

   
			BEGIN
			INSERT INTO #ADMIntervalResidence 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalResidence MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId

					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalResidence MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalResidence MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalResidence MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalResidence MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolId
	INTO #ADMIntervalReportResidence
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,SchoolId
			FROM #ADMIntervalResidence
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId,
		   Schoolid,
		   EO.NameOfInstitution

	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMIntervalReportResidence ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
			    LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMIntervalResidence
	DROP TABLE #MembershipIntervalResidence
	DROP TABLE #ReportingPeriod
	DROP TABLE #ADMIntervalReportResidence
	--DROP TABLE #GradeAndReportingPeriod
END
ELSE IF (@District = 'Attendance')
BEGIN

SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.AttendingLocalEducationAgencyId,
	   --MS.FundingTypeId,
	    [FTFStatus],
	   MS.[UnadjustedAverageDailyMembership],
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	INTO #MembershipIntervalAttending
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		     INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE 
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMIntervalAttending
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int )
   

   
			BEGIN
			INSERT INTO #ADMIntervalAttending 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalAttending MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId

					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalAttending MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalAttending MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalAttending MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalAttending MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolId
	INTO #ADMIntervalReportAttending
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,SchoolId
			FROM #ADMIntervalAttending
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId,
		   Schoolid,
		   EO.NameOfInstitution

	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMIntervalReportAttending ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
			    LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMIntervalAttending
	DROP TABLE #MembershipIntervalAttending
--	DROP TABLE #ReportingPeriod
	DROP TABLE #ADMIntervalReportAttending
	--DROP TABLE #GradeAndReportingPeriod
END
ELSE IF (@District = 'Submitted')
BEGIN

SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.SubmittedByEducationOrganizationId,
	   [FTFStatus],
	   MS.[UnadjustedAverageDailyMembership],
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	INTO #MembershipIntervalSubmitted
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		     INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE 
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMIntervalSubmitted
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int )
   

   
			BEGIN
			INSERT INTO #ADMIntervalSubmitted 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalSubmitted MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId

					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalSubmitted MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalSubmitted MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalSubmitted MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalSubmitted MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolId
	INTO #ADMIntervalReportSubmitted
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,SchoolId
			FROM #ADMIntervalSubmitted
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId,
		   Schoolid,
		   EO.NameOfInstitution

	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMIntervalReportSubmitted ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
			      LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMIntervalSubmitted
	DROP TABLE #MembershipIntervalSubmitted
	--DROP TABLE #ReportingPeriod
	DROP TABLE #ADMIntervalReportSubmitted
	--DROP TABLE #GradeAndReportingPeriod
END
ELSE IF (@District = 'ALL')
BEGIN

SELECT MS.ExecutionId,
       MS.FiscalYear,
	   MS.ADMTypeId,
	   MS.AggregationTypeId,
	   MS.ReportingPeriodTypeId,
	   MS.ReportingPeriodId,
	   MS.GradeLevelTypeId,
	   MS.ResidentEducationOrganizationId,
	   --MS.FundingTypeId,
	  [FTFStatus],
	   MS.[UnadjustedAverageDailyMembership],
	   MS.SchoolId,
	   GLT.CodeValue							AS Grade,
	   GLT.GradeGroup
	INTO #MembershipIntervalALL
	FROM #MembershipSummary MS 
		 JOIN [entity].[GradeLevelType] GLT WITH(NOLOCK)
		   ON MS.GradeLevelTypeId = GLT.GradeLevelTypeId
		 JOIN ace.FundingType FT
		   ON MS.FundingTypeId = FT.FundingTypeId
		     INNER JOIN @Schools Sch ON
		(	
			
			
		 MS.SchoolId = Sch.SchoolId
		)
	WHERE 
		   FT.IsFundable = 1
		  AND GLT.GradeGroup IS NOT NULL

    
	
	    


	
	
	-- To get Total ADMs for the latest executionid

	CREATE TABLE #ADMIntervalALL
		( GradeGroup int
		,Grade nvarchar(50)
		,GradeLevelTypeId int
		,ReportingPeriodId int
		,ADMGroupId int
		,TOTAL_ADM	decimal(20,4)
		,Schoolid int )
   

   
			BEGIN
			INSERT INTO #ADMIntervalALL 
				SELECT
					 GradeGroup
					,Grade
					,GradeLevelTypeId
					,ReportingPeriodId
					,ADMGroupId
					,TOTAL_ADM
					,Schoolid
				FROM
					(
						-- NON AOI ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,1												AS ADMGroupId		-- NON AOI ADM	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalALL MS
						WHERE MS.AggregationTypeId = 1			 	-- B&M (NON AOI)
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId

					UNION

						-- AOI FULL TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,2												AS ADMGroupId		--'AOI_FULL-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalALL MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 1					-- FULL TIME (FTE = 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
			
					UNION

						-- AOI PART TIME ADM 
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,3												AS ADMGroupId		--'AOI_PART-TIME_ADM'
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalALL MS
						WHERE MS.AggregationTypeId = 2				-- AOI
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.FTFStatus = 0					-- PART TIME (FTE < 1)
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,SchoolId
					UNION
					    -- DRP
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,4												AS ADMGroupId		-- DRP	
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalALL MS
						WHERE MS.AggregationTypeId = 4				-- DRP
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					UNION
					    -- GCD
						SELECT 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,MS.ReportingPeriodId
							,5												AS ADMGroupId		-- GCD
							,ROUND(SUM(MS.UnadjustedAverageDailyMembership),4)	AS TOTAL_ADM
							,SchoolId
						FROM #MembershipIntervalALL MS
						WHERE MS.AggregationTypeId = 3				--GCD 
							  AND MS.ADMTypeId = 1					-- Regular ADM
							  AND MS.ReportingPeriodId IN (1,5,6)	
						GROUP BY 
							 MS.GradeGroup
							,MS.Grade
							,MS.GradeLevelTypeId
							,ReportingPeriodId
							,SchoolId
					)SQ
			END
   
	
	-- PIVOTING THE REPORT DATA
	SELECT 
		  CumGradeGroup
		 ,GradeSection = CASE WHEN GradeGroup = 1	  THEN 'S1'
							 WHEN GradeGroup IN (2,3) THEN 'S2'
							 WHEN GradeGroup = 4	  THEN 'S3'	 
							 END
		,GradeGroup 
		,Grade 
		,GradeLevelTypeId 
		,ReportingPeriodId 
		,[1]	AS 'NON_AOI_ADM'	
		,[2]	AS 'AOI_FULL-TIME_ADM'
		,[3]	AS 'AOI_PART-TIME_ADM'
		,[4]	AS 'DRP_ADM'
		,[5]	AS 'GCD_ADM'
		,SchoolId
	INTO #ADMIntervalReportALL
	FROM
		(
			SELECT 
				'S' AS CumGradeGroup
				,GradeGroup 
				,Grade
				,GradeLevelTypeId
				,ReportingPeriodId
				,ADMGroupId
				,TOTAL_ADM
				,SchoolId
			FROM #ADMIntervalALL
		)P
		PIVOT
		(
			MAX(TOTAL_ADM)
			FOR ADMGroupId IN ([1], [2], [3], [4], [5] )
		) AS PVT
	WHERE 
		[1] IS NOT NULL OR [2] IS NOT NULL OR [3] IS NOT NULL OR [4] IS NOT NULL OR [5] IS NOT NULL
 
	ORDER BY 
		 GradeLevelTypeId
		,ReportingPeriodId
    
	--Report Data Joined with Reporting Period Type (Actual or Projected)
	SELECT CASE WHEN ADMR.CumGradeGroup IS NULL THEN 'S'
		   ELSE ADMR.CumGradeGroup END AS CumGradeGroup,
		   --CASE WHEN ADMR.GradeSection IS NULL THEN 'S'+ CONVERT(VARCHAR(10),GRP.GradeGroup)
		   --ELSE ADMR.GradeSection END 
		   GradeSection = CASE WHEN GRP.GradeGroup = 1	  THEN 'S1'
							 WHEN GRP.GradeGroup IN (2,3) THEN 'S2'
							 WHEN GRP.GradeGroup = 4	  THEN 'S3'	 
							 END, 
		   GRP.GradeGroup,
		   GRP.Grade,
		   GRP.GradeLevelTypeId,
		   CASE WHEN ADMR.ReportingPeriodId IS NULL THEN 
		             GRP.ReportingPeriodId 
			    ELSE ADMR.ReportingPeriodId END AS ReportingPeriodId,
		   ADMR.NON_AOI_ADM,	
		   ADMR.[AOI_FULL-TIME_ADM],
		   ADMR.[AOI_PART-TIME_ADM],
		   ADMR.DRP_ADM,
		   ADMR.GCD_ADM,
           GRP.ReportingPeriodTypeId,
		   Schoolid,
		   EO.NameOfInstitution

	FROM #GradeAndReportingPeriod GRP
	     LEFT JOIN #ADMIntervalReportALL ADMR
	       ON ADMR.ReportingPeriodId = GRP.ReportingPeriodId
		      AND ADMR.GradeLevelTypeId = GRP.GradeLevelTypeId
		    LEFT JOIN (SELECT * FROM [report].[vw_FormattedEducationorganizationCTDS] WHERE FiscalYear = @FiscalYear) EO
		      ON Schoolid = EO.EducationOrganizationId
			  WHERE Schoolid IS NOT NULL
	DROP TABLE #ADMIntervalALL
	DROP TABLE #MembershipIntervalALL
	DROP TABLE #ReportingPeriod
	DROP TABLE #ADMIntervalReportALL
	DROP TABLE #GradeAndReportingPeriod
END
END
END
