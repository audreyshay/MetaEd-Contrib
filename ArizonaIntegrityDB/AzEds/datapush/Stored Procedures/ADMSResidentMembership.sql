/*********************************************************************************************************************        
**  Name		   :[datapush].[ADMSResidentMembership]
**        		   
**  Description    : Proc used by SSIS packages to pull Resident Membership from 
**				     ace.MembershipSummay Table
**				   
**  Author		   : Amit Verma      
**  Date		   : 2016-04-05        
**        
***Revision History:
***	Who				When		What
***	Amit Verma		04/05/2016	Initial Creation
***	Amit Verma		06/24/2016	Added the filter to push the data only for Selected LEAs
***	Amit Verma		07/28/2016	Added a join to make sure that Max(ExecutionId) present in ACE Summary Table 
*** Amit Verma      09/06/2016  Converted FTFStatus to Integer
*** Amit Verma		12/23/2016	Added the ExecutionId as an Input Parameter
*** Amit Verma		06/14/2017	Excluding CECA and CECB from ResidentMembership
*** Amit Verma		07/26/2017	DataPush logic at School Level 
*** Amit Verma		09/11/2017	Added the logic to push the data where SpecialEnrollmentDescriptorId is NULL
************************************************************************************************************************/
-- EXEC [datapush].[ADMSResidentMembership] 2015


CREATE PROCEDURE [datapush].[ADMSResidentMembership]
@FiscalYear INT,
@ExecutionId INT
AS 

SELECT ACE.FiscalYear
      ,ACE.AttendingLocalEducationAgencyId							AS EntityOwnerID
	  ,ACE.SchoolId													AS EntityDependentID
	  ,'01'															AS ClusterID
	  ,XGLT.ID														AS RefGradeID
	  ,'1'															AS RegisterID
	  ,CASE WHEN PS.ServiceDescriptorId IS NULL THEN NULL
	        ELSE 1 
	   END															AS NeedInternalCode
	  ,SUM(ACE.LimitedMembershipDays)								AS MemDaysCnt 
	  ,SUM(ACE.LimitedAbsenceDays)									AS AbsDaysCnt 
	  ,SUM(ACE.LimitedAverageDailyAttendance)						AS RepotedAda
	  ,SUM(ACE.LimitedAverageDailyMembership)						AS ReportedAdm
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
		   AND ACE.AttendingLocalEducationAgencyId = ACE.ResidentEducationOrganizationId
	  JOIN datapush.LEAList LL
	    ON ACE.SubmittedByEducationOrganizationId = LL.LEAID
		   AND ACE.SchoolId = LL.SchoolId
		   AND ACE.ReportingPeriodId = LL.ReportingPeriod
	  JOIN config.ReportingPeriod RP
	    ON ACE.ReportingPeriodId = RP.ReportingPeriodId
		   AND ACE.FiscalYear = RP.FiscalYear
	  JOIN ace.FundingType FT
	    ON ACE.FundingTypeId = FT.FundingTypeId
		   AND FT.IsFundable = 1
	  LEFT JOIN entity.ProgramService PS
	    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
		   AND PS.ProgramTypeId = 6
		   AND ACE.FiscalYear = PS.FiscalYear
		   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
WHERE ACE.ADMTypeId = 1
	  AND ACE.FiscalYear =  @FiscalYear
	  AND ACE.ExecutionId = @ExecutionId
	  AND ACE.ReportingPeriodId IN (1,2)
	  AND (ACE.SpecialEnrollmentDescriptorId NOT IN (10246,10247)
	       OR ACE.SpecialEnrollmentDescriptorId IS NULL)
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