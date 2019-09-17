/*********************************************************************************************************************        
**  Name			:[datapush].[ADMSNonAidMemberships]
**        
**  Description     : Proc used by SSIS packages to pull Non Aid Membership from ace.MembershipSummay Table
**
**  Author			: Amit Verma      
**  Date			: 2016-04-05        
**        
**
*** Revision History:
***	Who				When		What
***	Amit Verma		04/05/2016	Initial Creation
***	Amit Verma		06/24/2016	Added the filter to push the data only for Selected LEAs
***	Amit Verma		07/28/2016	Added a join to make sure that Max(ExecutionId) present in ACE Summary Table 
*** Amit Verma		12/23/2016	Added the ExecutionId as an Input Parameter
*** Amit Verma		07/26/2017	DataPush logic at School Level 
************************************************************************************************************************/
--EXEC [datapush].[ADMSNonAidMemberships] 2015

CREATE PROCEDURE [datapush].[ADMSNonAidMemberships]
@FiscalYear INT,
@ExecutionId INT
AS 

SELECT ACE.FiscalYear
      ,ACE.AttendingLocalEducationAgencyId							AS EntityOwnerID
	  ,ACE.SchoolId													AS EntityDependentID
	  ,XGLT.ID														AS RefGradeID
	  ,'01'															AS ClusterID
	  ,'1'															AS RegisterID
	  ,CASE WHEN PS.ServiceDescriptorId IS NULL THEN NULL
	        ELSE 1 
	   END															AS NeedInternalCode
	  ,SUM(ACE.LimitedMembershipDays)								AS MemDaysCnt 
	  ,ACE.ReportingPeriodId	
	  ,GETDATE()													AS CreationDtm
	  ,'DataPush'													AS CreationUser
	  ,CASE WHEN ACE.AggregationTypeId = 2 
	        THEN CONVERT(INT,CASE 
			                 WHEN ACE.MembershipFTEDescriptorId = 10224 
							 THEN 1
							 ELSE 0
							 END)              
            WHEN ACE.AggregationTypeId = 1 THEN 
                NULL  END											AS FTFStatus
	  ,RP.ReportingPeriodDays										AS DaysInPeriod
	  ,ACE.SubmittedByEducationOrganizationId
FROM  ace.MembershipInterval ACE
	  JOIN datapush.StudentDetailsGradeLevelType XGLT
	    ON XGLT.GradeLevelTypeId = ACE.GradeLevelTypeId
	  JOIN datapush.LEAList LL
	    ON ACE.SubmittedByEducationOrganizationId = LL.LEAID
		   AND ACE.SchoolId = LL.SchoolId
		   AND ACE.ReportingPeriodId = LL.ReportingPeriod
	  JOIN config.ReportingPeriod RP
	    ON ACE.ReportingPeriodId = RP.ReportingPeriodId
		   AND ACE.FiscalYear = RP.FiscalYear
	  JOIN ace.FundingType FT
	    ON ACE.FundingTypeId = FT.FundingTypeId
		   AND FT.IsFundable = 0
	  LEFT JOIN entity.ProgramService PS
	    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
		   AND PS.ProgramTypeId = 6
		   AND ACE.FiscalYear = PS.FiscalYear
		   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
WHERE ACE.ADMTypeId = 1
	  AND ACE.FiscalYear = @FiscalYear
	  AND ACE.ExecutionId = @ExecutionId
	  AND ACE.ReportingPeriodId IN (1,2)
GROUP BY ACE.FiscalYear
      ,ACE.AttendingLocalEducationAgencyId							
	  ,ACE.SchoolId													
	  ,XGLT.ID															
	  ,CASE WHEN PS.ServiceDescriptorId IS NULL THEN NULL
	        ELSE 1 
	   END									
	  ,ACE.ReportingPeriodId													
	  ,CASE WHEN ACE.AggregationTypeId = 2 
	        THEN CONVERT(INT,CASE 
			                 WHEN ACE.MembershipFTEDescriptorId = 10224 
							 THEN 1
							 ELSE 0
							 END)              
            WHEN ACE.AggregationTypeId = 1 THEN 
                NULL  END											
	  ,RP.ReportingPeriodDays										
	  ,ACE.SubmittedByEducationOrganizationId