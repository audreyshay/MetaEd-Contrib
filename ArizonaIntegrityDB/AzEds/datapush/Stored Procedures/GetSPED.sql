/***********************************************************************************************************************        
**
  Name				:[datapush].[GetSPED]
**        
**  Description     : Proc used by SSIS packages to pull SPED Data from ace.MembershipSummay Table
**
**  Author			: Amit Verma      
**  Date			: 2016-04-05        
**   
*** Revision History:
***	Who				When		What
***	Amit Verma		04/05/2016	Initial Creation
***	Amit Verma		06/24/2016	Added the filter to push the data only for Selected LEAs
***	Amit Verma		07/28/2016	Added a join to make sure that Max(ExecutionId) present in ACE Summary Table 
*** Amit Verma      09/06/2016  Converted FTFStatus to Integer
*** Amit Verma		09/09/2016	Pushing ReportingPeriod 5 AS ReportingPeriod 2 
*** Amit Verma		12/23/2016	Added the ExecutionId as an Input Parameter
*** Amit Verma		02/17/2017	Aggregating the LimitedAverageDailyMembership before pushing it to SFS System
*** Amit Verma		07/28/2017  Aggregating the SPED Data from MembershipInterval Table before pushing to SFS System
*** P Kanyar		09/22/2017	Changed the join for 915, on SubmittedByLEA in ace table
***
************************************************************************************************************************/  
-- EXEC [datapush].[GetSPED] 2015, 3344

CREATE PROCEDURE [datapush].[GetSPED]
@FiscalYear INT,
@ExecutionId INT 
AS 


DECLARE  @MembershipSummary TABLE ([ExecutionId]						INT
	                            ,[FiscalYear]							INT
	                            ,[ADMTypeId]							INT
	                            ,[AggregationTypeId]					INT
                                ,[ReportingPeriodTypeId]				INT
                                ,[ReportingPeriodId]					INT  
                                ,[SchoolId]								INT  
                                ,[GradeLevelTypeId]						INT  
                                ,[AttendingLocalEducationAgencyId]      INT
                                ,[ResidentEducationOrganizationId]      INT
	                            ,[FundingTypeId]                        INT
	                            ,[SpecialEnrollmentDescriptorId]	    INT
	                            ,[ServiceCodeDescriptorId]              INT
	                            ,[ProgramServiceDescriptorId]           INT
	                            ,[FTFStatus]                            BIT
                                ,LimitedMembershipDays					DECIMAL(20,6)
                                ,LimitedAbsenceDays						DECIMAL(20,6)
	                            ,LimitedAverageDailyAttendance			DECIMAL(20,4)
                                ,LimitedAverageDailyMembership			DECIMAL(20,4)
                                ,YearEndAdjustedADA						DECIMAL(20,4)
                                ,YearEndAdjustedADM						DECIMAL(20,4)
	                            ,[SubmittedByEducationOrganizationId]	INT)


DECLARE  @MembershipSummaryWithReportingPeriod TABLE (
								 [ExecutionId]							INT
	                            ,[FiscalYear]							INT
	                            ,[ADMTypeId]							INT
	                            ,[AggregationTypeId]					INT
                                ,[ReportingPeriodTypeId]				INT
                                ,[ReportingPeriodId]					INT  
                                ,[SchoolId]								INT  
                                ,[GradeLevelTypeId]						INT  
                                ,[AttendingLocalEducationAgencyId]      INT
                                ,[ResidentEducationOrganizationId]      INT
	                            ,[FundingTypeId]                        INT
	                            ,[SpecialEnrollmentDescriptorId]	    INT
	                            ,[ServiceCodeDescriptorId]              INT
	                            ,[ProgramServiceDescriptorId]           INT
	                            ,[FTFStatus]                            BIT
                                ,LimitedMembershipDays					DECIMAL(20,6)
                                ,LimitedAbsenceDays						DECIMAL(20,6)
	                            ,LimitedAverageDailyAttendance			DECIMAL(20,4)
                                ,LimitedAverageDailyMembership			DECIMAL(20,4)
                                ,YearEndAdjustedADA						DECIMAL(20,4)
                                ,YearEndAdjustedADM						DECIMAL(20,4)
	                            ,[SubmittedByEducationOrganizationId]	INT)

INSERT INTO @MembershipSummary  ([ExecutionId]					
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
			                       ,LimitedMembershipDays				
			                       ,LimitedAbsenceDays					
			                       ,LimitedAverageDailyAttendance		
			                       ,LimitedAverageDailyMembership		
			                       ,YearEndAdjustedADA					
			                       ,YearEndAdjustedADM					
			                       ,[SubmittedByEducationOrganizationId])
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
    , SUM(LimitedMembershipDays)			AS LimitedMembershipDays
    , SUM(LimitedAbsenceDays)				AS LimitedAbsenceDays
	, SUM(LimitedAverageDailyAttendance)	AS LimitedAverageDailyAttendance
    , SUM(LimitedAverageDailyMembership)	AS LimitedAverageDailyMembership
    , SUM(YearEndAdjustedADA)				AS YearEndAdjustedADA
    , SUM(YearEndAdjustedADM)				AS YearEndAdjustedADM
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

INSERT INTO @MembershipSummaryWithReportingPeriod  ([ExecutionId]					
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
			                       ,LimitedMembershipDays				
			                       ,LimitedAbsenceDays					
			                       ,LimitedAverageDailyAttendance		
			                       ,LimitedAverageDailyMembership		
			                       ,YearEndAdjustedADA					
			                       ,YearEndAdjustedADM					
			                       ,[SubmittedByEducationOrganizationId])
SELECT [ExecutionId]
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
	,[SubmittedByEducationOrganizationId]
FROM @MembershipSummary

INSERT INTO @MembershipSummaryWithReportingPeriod(
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
	,[SubmittedByEducationOrganizationId]
	)
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
		, SUM(LimitedMembershipDays)										AS [LimitedMembershipDays]
		, SUM(LimitedAbsenceDays)											AS [LimitedAbsenceDays]
		, SUM(ROUND((LimitedMembershipDays - LimitedAbsenceDays) / 100, 6)) AS [LimitedAverageDailyAttendance]
		, SUM(ROUND(LimitedMembershipDays/100, 4))							AS [LimitedAverageDailyMembership]
		, SUM(YearEndAdjustedADA)											AS [YearEndAdjustedADA]
		, SUM(YearEndAdjustedADM)											AS [YearEndAdjustedADM]
		, SubmittedByEducationOrganizationId
FROM @MembershipSummaryWithReportingPeriod ms 
WHERE ms.ReportingPeriodId IN (1,2)
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
	, SubmittedByEducationOrganizationId


SELECT ACE.FiscalYear
      ,CASE WHEN ACE.ReportingPeriodId = 5 THEN 2 
	        ELSE ACE.ReportingPeriodId END							AS ReportingPeriodId	
	  ,ACE.ResidentEducationOrganizationId							AS FundableEntityID
	  ,SDN.NeedId													AS SpedNeedID
	  ,CASE WHEN SPEDSCF.IsSelfContained = 1 THEN 1475
	        ELSE 1476
	   END															AS RefStatusID
	  ,ACE.LimitedAverageDailyMembership							AS ADMCnt
	  ,GETDATE()													AS CreationDtm
	  ,'DataPush'													AS CreationUser
	  ,CASE WHEN SCH.IsVirtual = 1 THEN 
	        CONVERT(INT, ACE.FTFStatus)	
		  	WHEN SCH.IsVirtual = 0 THEN 
			NULL END												AS FTFStatus
	  ,RP.ReportingPeriodDays										AS DaysInPeriod		
	  ,ACE.SubmittedByEducationOrganizationId
FROM  @MembershipSummaryWithReportingPeriod ACE
      JOIN entity.School SCH
	    ON ACE.SchoolId = SCH.SchoolId
		   AND ACE.FiscalYear = SCH.FiscalYear
	  JOIN datapush.StudentDetailsGradeLevelType XGLT
	    ON XGLT.GradeLevelTypeId = ACE.GradeLevelTypeId
	  JOIN datapush.LEAList LL
	    ON ACE.SubmittedByEducationOrganizationId = LL.LEAID
		   AND ACE.SchoolId = LL.SchoolId
		   AND CASE WHEN ACE.ReportingPeriodId = 5 THEN 2
		            ELSE ACE.ReportingPeriodId END = LL.ReportingPeriod 
	  JOIN leadata.StudentNeedDescriptor SND
	    ON ACE.ProgramServiceDescriptorId = SND.StudentNeedDescriptorId
		   AND SND.StudentNeedCategoryTypeId = 1                          ----SPED
	  JOIN datapush.StudentDetailsNeed SDN
	    ON SND.StudentNeedDescriptorId = SDN.ID
	  JOIN config.ReportingPeriod RP
	    ON CASE WHEN ACE.ReportingPeriodId = 5 
		        THEN 2
		        ELSE ACE.ReportingPeriodId END = RP.ReportingPeriodId
		   AND ACE.FiscalYear = RP.FiscalYear
	  JOIN config.SPEDServiceCodeFundability SPEDSCF
	    ON ACE.ServiceCodeDescriptorId = SPEDSCF.ServiceCodeDescriptorId
		   AND ACE.FiscalYear = SPEDSCF.FiscalYear
		   AND ACE.GradeLevelTypeId = SPEDSCF.GradeLevelTypeId
	  JOIN ace.FundingType FT
	    ON ACE.FundingTypeId = FT.FundingTypeId
		   AND FT.IsFundable = 1
	  LEFT JOIN entity.ProgramService PS
	    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
		   AND ACE.FiscalYear = PS.FiscalYear
		   AND PS.ProgramTypeId = 6
		   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
WHERE ACE.ADMTypeId = 2
	  AND ACE.FiscalYear = @FiscalYear
	  AND ACE.ExecutionId = @ExecutionId
	  AND ACE.ServiceCodeDescriptorId IS NOT NULL
	  AND ACE.ReportingPeriodId IN (1,5)