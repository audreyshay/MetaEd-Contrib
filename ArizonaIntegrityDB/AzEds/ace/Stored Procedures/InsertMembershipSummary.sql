/************************************************************
**Procedure Name: ace.InsertMembershipSummary
**
**Author: Chris Mullert 
**
**Description:  Summarize membership interval data. Returns 1 if destination records already exist.
**	
**Revision History:
**	Who					When		What
**	Chris Mullert 		3/17/2016	created
**
***************************************************************/

CREATE PROCEDURE [ace].[InsertMembershipSummary]
	@ExecutionId	INT
AS 
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @currentDateTime DATETIME
DECLARE @rowCount INT

SELECT @currentDateTime = GETDATE()	-- ensure all records have the same insert date/time.

-- Do not insert any records for executionId if some already exist.
SELECT @rowCount = COUNT(*) FROM [ace].[MembershipSummary] WHERE ExecutionId = @ExecutionId
IF @rowCount > 0 RETURN 1

INSERT INTO [ace].[MembershipSummary]
	(
	[ExecutionId]
	,[FiscalYear]	
	,[ADMTypeId]		
	,[AggregationTypeId]	
    ,[ReportingPeriodTypeId] 
    ,[ReportingPeriodId]     
    ,[SchoolId]              
    ,[GradeLevelTypeId]      
    ,[AttendingLocalEducationAgencyId]
    ,[ResidentEducationOrganizationId]
	,[FundingTypeId]
	,[SpecialEnrollmentDescriptorId]
	,[ServiceCodeDescriptorId]
	,[ProgramServiceDescriptorId]
	,[FTFStatus]						
    ,[LimitedMembershipDays]         
    ,[LimitedAbsenceDays]            
	,[LimitedAverageDailyAttendance]	
    ,[LimitedAverageDailyMembership] 
	,[YearEndAdjustedADA]
	,[YearEndAdjustedADM]
	,[CreateDate]
	,[SubmittedByEducationOrganizationId]
	)
SELECT 
	[ExecutionId]
	,[FiscalYear]	
	,[ADMTypeId]		
	,[AggregationTypeId]	
    ,[ReportingPeriodTypeId] 
    ,[ReportingPeriodId]     
    ,[SchoolId]              
    ,[GradeLevelTypeId]      
    ,[AttendingLocalEducationAgencyId]
    ,[ResidentEducationOrganizationId]
	,[FundingTypeId]
	,[SpecialEnrollmentDescriptorId]	
	,[ServiceCodeDescriptorId]
	,[ProgramServiceDescriptorId]
	, (CASE WHEN MembershipFTEDescriptorId = 10224 THEN 1
		ELSE 0
		END
	   ) AS [FTFStatus]
    , SUM(LimitedMembershipDays)
    , SUM(LimitedAbsenceDays)
	, SUM(LimitedAverageDailyAttendance) 
    , SUM(LimitedAverageDailyMembership) 
    , SUM(YearEndAdjustedADA) 
    , SUM(YearEndAdjustedADM) 
	, @currentDateTime
	, [SubmittedByEducationOrganizationId] 
	FROM [ace].[MembershipInterval]
	WHERE ExecutionId = @ExecutionId
	GROUP BY 
		[ExecutionId]
		,[FiscalYear]
		,[ADMTypeId]
		,[AggregationTypeId]
		,[ReportingPeriodTypeId] 
		,[ReportingPeriodId]
		,[SchoolId]
		,[GradeLevelTypeId]
		,[AttendingLocalEducationAgencyId]
		,[ResidentEducationOrganizationId]
		,[FundingTypeId]
		,[SpecialEnrollmentDescriptorId]
		,[ServiceCodeDescriptorId]
		,[ProgramServiceDescriptorId]
		,[SubmittedByEducationOrganizationId]
		-- CASE sets full-time students (FTE=1 or otherwise known as 10224) to 1, non FTE=1 students get set to 0 to indicate part-time students.
		, (CASE WHEN MembershipFTEDescriptorId = 10224 THEN 1
			ELSE 0
			END
		  );

INSERT INTO [ace].[MembershipSummary]
	(
	[ExecutionId]
	,[FiscalYear]	
	,[ADMTypeId]		
	,[AggregationTypeId]	
    ,[ReportingPeriodTypeId] 
    ,[ReportingPeriodId]     
    ,[SchoolId]              
    ,[GradeLevelTypeId]      
    ,[AttendingLocalEducationAgencyId]
    ,[ResidentEducationOrganizationId]
	,[FundingTypeId]
	,[SpecialEnrollmentDescriptorId]
	,[ServiceCodeDescriptorId]
	,[ProgramServiceDescriptorId]
	,[FTFStatus]						
    ,[LimitedMembershipDays]         
    ,[LimitedAbsenceDays]            
	,[LimitedAverageDailyAttendance]	
    ,[LimitedAverageDailyMembership] 
	,[YearEndAdjustedADA]
	,[YearEndAdjustedADM]
	,[CreateDate]                    
	,[SubmittedByEducationOrganizationId]
	)

    SELECT
		ms.ExecutionId	 
		, ms.FiscalYear
        , ms.ADMTypeId
        , ms.AggregationTypeId
        , MIN(ms.ReportingPeriodTypeId) AS ReportingPeriodTypeId
        ,'6' AS ReportingPeriodId
        , ms.SchoolId
        , ms.GradeLevelTypeId
        , ms.AttendingLocalEducationAgencyId
        , ms.ResidentEducationOrganizationId
        , ms.FundingTypeId
        , ms.SpecialEnrollmentDescriptorId
        , ms.ServiceCodeDescriptorId
        , ms.ProgramServiceDescriptorId
        , ms.FTFStatus
		, SUM(LimitedMembershipDays)
		, SUM(LimitedAbsenceDays)
		, SUM(ROUND((LimitedMembershipDays - LimitedAbsenceDays) / 200, 6))
		, SUM(ROUND(LimitedMembershipDays/200, 4)) 
		, SUM(YearEndAdjustedADA) 
		, SUM(YearEndAdjustedADM) 
		, ms.CreateDate
		,[SubmittedByEducationOrganizationId]
    FROM [ace].[MembershipSummary] ms (nolock)
		, entity.Approved200DayLocalEducationAgency a200
    WHERE 
		ms.AttendingLocalEducationAgencyId = a200.LocalEducationAgencyId
		and ms.FiscalYear = a200.FiscalYear -- 200 day schools
		and ms.ReportingPeriodId IN (1,2,3)
		and ExecutionId = @ExecutionId
	GROUP BY 
		ms.ExecutionId	 
		, ms.FiscalYear
        , ms.ADMTypeId
        , ms.AggregationTypeId
        , ms.SchoolId
        , ms.GradeLevelTypeId
        , ms.AttendingLocalEducationAgencyId
        , ms.ResidentEducationOrganizationId
        , ms.FundingTypeId
        , ms.SpecialEnrollmentDescriptorId
        , ms.ServiceCodeDescriptorId
        , ms.ProgramServiceDescriptorId
        , ms.FTFStatus
		, ms.CreateDate
		, SubmittedByEducationOrganizationId

INSERT INTO [ace].[MembershipSummary]
	(
	[ExecutionId]
	,[FiscalYear]	
	,[ADMTypeId]		
	,[AggregationTypeId]	
    ,[ReportingPeriodTypeId] 
    ,[ReportingPeriodId]     
    ,[SchoolId]              
    ,[GradeLevelTypeId]      
    ,[AttendingLocalEducationAgencyId]
    ,[ResidentEducationOrganizationId]
	,[FundingTypeId]
	,[SpecialEnrollmentDescriptorId]
	,[ServiceCodeDescriptorId]
	,[ProgramServiceDescriptorId]
	,[FTFStatus]						
    ,[LimitedMembershipDays]         
    ,[LimitedAbsenceDays]            
	,[LimitedAverageDailyAttendance]	
    ,[LimitedAverageDailyMembership] 
	,[YearEndAdjustedADA]
	,[YearEndAdjustedADM]
	,[CreateDate]                    
	,[SubmittedByEducationOrganizationId]
	)
        -- Add 100 day schools 1-100 as reportingPeriod 5.
    SELECT 
		ms.ExecutionId	 
		, ms.FiscalYear
        , ms.ADMTypeId
        , ms.AggregationTypeId
        , MIN(ms.ReportingPeriodTypeId) AS ReportingPeriodTypeId
        ,'5' AS ReportingPeriodId
        , ms.SchoolId
        , ms.GradeLevelTypeId
        , ms.AttendingLocalEducationAgencyId
        , ms.ResidentEducationOrganizationId
        , ms.FundingTypeId
        , ms.SpecialEnrollmentDescriptorId
        , ms.ServiceCodeDescriptorId
        , ms.ProgramServiceDescriptorId
        , ms.FTFStatus
		, SUM(LimitedMembershipDays)
		, SUM(LimitedAbsenceDays)
		, SUM(ROUND((LimitedMembershipDays - LimitedAbsenceDays) / 100, 6))
		, SUM(ROUND(LimitedMembershipDays/100, 4)) 
		, SUM(YearEndAdjustedADA) 
		, SUM(YearEndAdjustedADM) 
		, ms.CreateDate
		, SubmittedByEducationOrganizationId
    FROM [ace].[MembershipSummary] ms (nolock)
		
    WHERE 
		--NOT EXISTS (select LocalEducationAgencyId FROM entity.Approved200DayLocalEducationAgency two 
		--WHERE two.LocalEducationAgencyId = ms.AttendingLocalEducationAgencyId AND two.FiscalYear = ms.FiscalYear)
		--and	
		ms.ReportingPeriodId IN (1,2)
		and ExecutionId = @ExecutionId
	GROUP BY 
		ms.ExecutionId	 
		, ms.FiscalYear
        , ms.ADMTypeId
        , ms.AggregationTypeId
        , ms.SchoolId
        , ms.GradeLevelTypeId
        , ms.AttendingLocalEducationAgencyId
        , ms.ResidentEducationOrganizationId
        , ms.FundingTypeId
        , ms.SpecialEnrollmentDescriptorId
        , ms.ServiceCodeDescriptorId
        , ms.ProgramServiceDescriptorId
        , ms.FTFStatus
		, ms.CreateDate
		, SubmittedByEducationOrganizationId



END