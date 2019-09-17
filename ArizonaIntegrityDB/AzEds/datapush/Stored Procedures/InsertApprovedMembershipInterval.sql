/*********************************************************************************************************************        
**  Name		   :[datapush].[InsertApprovedMembershipInterval]
**        		   
**  Description    : Proc used by SSIS packages to Insert Approved Membership Interval in 
**					 ace.ApprovedMembershipInterval table
**				   
**  Author		   : Amit Verma      
**  Date		   : 2017-08-01        
**        
***Revision History:
***	Who				When		What
***	Amit Verma		08/01/2017	Initial Creation
***	Amit Verma		09/11/2017	Added the logic to Insert the data for Non Resident CEC-A and CEC-B
*** P Kanyar		09/22/2017	Modified to bring all NonResident irrespective of SpecialEnrollmentDescriptorId
***								and updated the join with ace table on SubmittedBYLEAid instead of ResidentEdOgId
***
************************************************************************************************************************/
CREATE PROCEDURE [datapush].[InsertApprovedMembershipInterval]
@FiscalYear INT,
@ExecutionId INT,
@ADMTypeId INT
AS
BEGIN
	--Get Latest DataPushHistoryId from datapush.DataPushHistory table
	DECLARE @DataPushHistoryId INT
	SELECT @DataPushHistoryId = MAX(DataPushHistoryId)  FROM [datapush].[DataPushHistory]
	WHERE ExecutionId = @ExecutionId
	
	--Get DataPushHistorySchoolLevelDetailId for above DataPushHistoryId  
	SELECT DHSD.DataPushHistorySchoolLevelDetailId, DHSD.SchoolId,DHD.LEAID 
	INTO #DataPushHistorySchoolLevelDetail
	FROM [datapush].[DataPushHistoryDetail] DHD
	     JOIN [datapush].[DataPushHistorySchoolLevelDetail] DHSD
		   ON DHD.DataPushHistoryDetailId = DHSD.DataPushHistoryDetailId
	          AND DHD.DataPushHistoryId = @DataPushHistoryId
	
	IF @ADMTypeId = 1
	BEGIN
		--Insert MembershipIntervalId and DataPushHistorySchoolLevelDetailId for Resident, Non-Resident and Non-aid Membership
		INSERT INTO [ace].[ApprovedMembershipInterval] 
		            (MembershipIntervalId,DataPushHistorySchoolLevelDetailId)
		SELECT MembershipIntervalId,DataPushHistorySchoolLevelDetailId 
		FROM (
		--All Resident Memberships without special enrollment CEC-A & CEC-B 
		SELECT DISTINCT ACE.MembershipIntervalId
			  ,DHSLD.DataPushHistorySchoolLevelDetailId												
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
			  JOIN #DataPushHistorySchoolLevelDetail DHSLD
			    ON  ACE.SchoolId = DHSLD.SchoolId 
				    AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
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
		UNION
		--All Non Resident Memberships irrespective of special enrollment
		SELECT DISTINCT ACE.MembershipIntervalId
			  ,DHSLD.DataPushHistorySchoolLevelDetailId		
		FROM  ace.MembershipInterval ACE
			  JOIN datapush.StudentDetailsGradeLevelType XGLT
			    ON XGLT.GradeLevelTypeId = ACE.GradeLevelTypeId
				   AND ACE.AttendingLocalEducationAgencyId <> ACE.ResidentEducationOrganizationId
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
			  JOIN #DataPushHistorySchoolLevelDetail DHSLD
					    ON  ACE.SchoolId = DHSLD.SchoolId 
						    AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
			  LEFT JOIN entity.ProgramService PS
			    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
				   AND PS.ProgramTypeId = 6
				   AND ACE.FiscalYear = PS.FiscalYear
				   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
			  LEFT JOIN datapush.StudentDetailsSpecialEnrollment XSPEN
			    ON XSPEN.SpecialEnrollmentDescriptorId = ACE.SpecialEnrollmentDescriptorId
		WHERE ACE.ADMTypeId = 1
			  AND ACE.FiscalYear = @FiscalYear
			  AND ACE.ExecutionId = @ExecutionId
			  AND ACE.ReportingPeriodId IN (1,2)
			  --AND (ACE.SpecialEnrollmentDescriptorId IN (10246,10247)
			  --     OR ACE.SpecialEnrollmentDescriptorId IS NULL)
		UNION
		-- All memberships with special enrollment CEC-A & CEC-B, irrespective of being Resident or Non Resident
		SELECT DISTINCT ACE.MembershipIntervalId
					  ,DHSLD.DataPushHistorySchoolLevelDetailId	
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
				   AND FT.IsFundable = 1
			  JOIN #DataPushHistorySchoolLevelDetail DHSLD
				ON  ACE.SchoolId = DHSLD.SchoolId 
				    AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
			  LEFT JOIN entity.ProgramService PS
			    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
				   AND PS.ProgramTypeId = 6
				   AND ACE.FiscalYear = PS.FiscalYear
				   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
			  LEFT JOIN datapush.StudentDetailsSpecialEnrollment XSPEN
			    ON XSPEN.SpecialEnrollmentDescriptorId = ACE.SpecialEnrollmentDescriptorId
		WHERE ACE.ADMTypeId = 1
			  AND ACE.FiscalYear = @FiscalYear
			  AND ACE.ExecutionId = @ExecutionId
			  AND ACE.ReportingPeriodId IN (1,2)
			  AND ACE.SpecialEnrollmentDescriptorId IN (10246,10247)
		UNION
		--Non Aid Membership
		SELECT DISTINCT ACE.MembershipIntervalId
			  ,DHSLD.DataPushHistorySchoolLevelDetailId	
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
			  JOIN #DataPushHistorySchoolLevelDetail DHSLD
			    ON  ACE.SchoolId = DHSLD.SchoolId
				    AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
			  LEFT JOIN entity.ProgramService PS
			    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
				   AND PS.ProgramTypeId = 6
				   AND ACE.FiscalYear = PS.FiscalYear
				   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
		WHERE ACE.ADMTypeId = 1
			  AND ACE.FiscalYear = @FiscalYear
			  AND ACE.ExecutionId = @ExecutionId
			  AND ACE.ReportingPeriodId IN (1,2)) ADM
		EXCEPT SELECT MembershipIntervalId,DataPushHistorySchoolLevelDetailId 
		       FROM [ace].[ApprovedMembershipInterval]

	END
	ELSE
	IF @ADMTypeId = 2
	--SPED
	BEGIN
	INSERT INTO [ace].[ApprovedMembershipInterval] 
		            (MembershipIntervalId,DataPushHistorySchoolLevelDetailId)
	SELECT DISTINCT ACE.MembershipIntervalId
			  ,DHSLD.DataPushHistorySchoolLevelDetailId											
	FROM  ace.MembershipInterval ACE
	      JOIN entity.School SCH
		    ON ACE.SchoolId = SCH.SchoolId
			   AND ACE.FiscalYear = SCH.FiscalYear
		  JOIN datapush.StudentDetailsGradeLevelType XGLT
		    ON XGLT.GradeLevelTypeId = ACE.GradeLevelTypeId
		  JOIN datapush.LEAList LL
		    ON ACE.SubmittedByEducationOrganizationId = LL.LEAID
			   AND ACE.SchoolId = LL.SchoolId
		  JOIN leadata.StudentNeedDescriptor SND
		    ON ACE.ProgramServiceDescriptorId = SND.StudentNeedDescriptorId
			   AND SND.StudentNeedCategoryTypeId = 1                          ----SPED
		  JOIN datapush.StudentDetailsNeed SDN
		    ON SND.StudentNeedDescriptorId = SDN.ID
		  JOIN config.SPEDServiceCodeFundability SPEDSCF
		    ON ACE.ServiceCodeDescriptorId = SPEDSCF.ServiceCodeDescriptorId
			   AND ACE.FiscalYear = SPEDSCF.FiscalYear
			   AND ACE.GradeLevelTypeId = SPEDSCF.GradeLevelTypeId
		  JOIN ace.FundingType FT
		    ON ACE.FundingTypeId = FT.FundingTypeId
			   AND FT.IsFundable = 1
		  JOIN #DataPushHistorySchoolLevelDetail DHSLD
		    ON ACE.SchoolId = DHSLD.SchoolId 
			   AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
		  LEFT JOIN entity.ProgramService PS
		    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
			   AND ACE.FiscalYear = PS.FiscalYear
			   AND PS.ProgramTypeId = 6
			   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
	WHERE ACE.ADMTypeId = 2
		  AND ACE.FiscalYear = @FiscalYear
		  AND ACE.ExecutionId = @ExecutionId
		  AND ACE.ServiceCodeDescriptorId IS NOT NULL
		  AND ACE.ReportingPeriodId IN (1,2)
	EXCEPT SELECT MembershipIntervalId,DataPushHistorySchoolLevelDetailId 
		       FROM [ace].[ApprovedMembershipInterval]
	END
	ELSE 
	IF @ADMTypeId = 3
	--ELL
	BEGIN
	INSERT INTO [ace].[ApprovedMembershipInterval] 
		            (MembershipIntervalId,DataPushHistorySchoolLevelDetailId)
	SELECT DISTINCT ACE.MembershipIntervalId
			  ,DHSLD.DataPushHistorySchoolLevelDetailId		
	FROM  ace.MembershipInterval ACE
	      JOIN entity.School SCH
		    ON ACE.SchoolId = SCH.SchoolId
			   AND ACE.FiscalYear = SCH.FiscalYear
		  JOIN datapush.StudentDetailsGradeLevelType XGLT
		    ON XGLT.GradeLevelTypeId = ACE.GradeLevelTypeId
		  JOIN datapush.LEAList LL
		    ON ACE.SubmittedByEducationOrganizationId = LL.LEAID
			   AND ACE.SchoolId = LL.SchoolId
		  JOIN datapush.StudentDetailsPreDefBilingual XPDB
		    ON XPDB.PreDefBilingualID = ACE.ProgramServiceDescriptorId
		  JOIN ace.FundingType FT
		    ON ACE.FundingTypeId = FT.FundingTypeId
			   AND FT.IsFundable = 1
		  JOIN #DataPushHistorySchoolLevelDetail DHSLD
		    ON ACE.SchoolId = DHSLD.SchoolId 
			   AND ACE.SubmittedByEducationOrganizationId = DHSLD.LEAID
		  LEFT JOIN entity.ProgramService PS
		    ON ACE.ServiceCodeDescriptorId = PS.ServiceDescriptorId
			   AND ACE.FiscalYear = PS.FiscalYear
			   AND PS.ProgramTypeId = 1
			   AND ACE.AttendingLocalEducationAgencyId = PS.EducationOrganizationId
	WHERE ACE.ADMTypeId = 3
		  AND ACE.FiscalYear = @FiscalYear
		  AND ACE.ExecutionId = @ExecutionId
		  AND ACE.ProgramServiceDescriptorId IS NOT NULL
		  AND ACE.ReportingPeriodId IN (1,2)
	EXCEPT SELECT MembershipIntervalId,DataPushHistorySchoolLevelDetailId 
		       FROM [ace].[ApprovedMembershipInterval]
	END
DROP TABLE #DataPushHistorySchoolLevelDetail
END