/******************************************************************************************************
**Procedure Name: ace.InsertMembershipIntervalAndSummaryArchive
**
**Author: Viju Viswanathan
**
**Description: Archive membership interval and membership summary
**			   for the list of executions provided.
**Revision History:
**	Who			When		What
**	VV			11/01/2016	Initial Creation
**  Amit Verma	11/09/2016  Added the Temp Table to hold the data for the given Execution IDs  
********************************************************************************************************/
CREATE PROC [ace].[InsertMembershipIntervalAndSummaryArchive]	
	@ExecutionId AS ace.ExecutionIdList READONLY,
	@return_value INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN InsertArchive
        
		--Drop the temp table #MembershipInterval if it exist
		IF OBJECT_ID('tempdb..#MembershipInterval') IS NOT NULL DROP TABLE #MembershipInterval
		
		--Load the data in the temp table #MembershipInterval from ace.MembershipInterval Table for given the Execution Id 
		SELECT	mi.*
		INTO #MembershipInterval
        FROM ace.MembershipInterval mi
		  JOIN @ExecutionId e
		    ON mi.ExecutionId = e.ExecutionId

		
		 
		--Insert the Membeship interval records
		INSERT INTO ace.MembershipIntervalArchive
			   (
				 MembershipIntervalId
				 ,ExecutionId
				 ,FiscalYear
				 ,ADMTypeId
				 ,AggregationTypeId
				 ,ReportingPeriodTypeId
				 ,ReportingPeriodId
				 ,StudentUSI
				 ,SchoolId
				 ,GradeLevelTypeId
				 ,AttendingLocalEducationAgencyId
				 ,ResidentEducationOrganizationId
				 ,IsConcurrentForLimiting
				 ,MembershipFTEDescriptorId
				 ,TuitionPayerDescriptorId
				 ,ProgramServiceDescriptorId
				 ,TrackNumber
				 ,IsHomeBound
				 ,FundingTypeId
				 ,MembershipIntervalStartDate
				 ,MembershipIntervalEndDate
				 ,UnadjustedMembershipDays
				 ,UnadjustedAbsenceDays
				 ,UnadjustedAverageDailyMembership
				 ,UnadjustedAverageDailyAttendance
				 ,CreateDate
				 ,SPEDSupportLevelWeight
				 ,SpecialEnrollmentDescriptorId
				 ,ServiceCodeDescriptorId
				 ,StudentSchoolAssociationEntryDate
				 ,UnadjustedDaysEnrolled
				 ,YearEndUnadjustedADM
				 ,YearEndAdjustedADM
				 ,YearEndAdjustedADA
				 ,LimitedAverageDailyMembership
				 ,LimitedAverageDailyAttendance
				 ,LimitedMembershipDays
				 ,LimitedAbsenceDays
				 ,AttendanceMinutes
			   )
     
		SELECT	MembershipIntervalId
				,ExecutionId
				,FiscalYear
				,ADMTypeId
				,AggregationTypeId
				,ReportingPeriodTypeId
				,ReportingPeriodId
				,StudentUSI
				,SchoolId
				,GradeLevelTypeId
				,AttendingLocalEducationAgencyId
				,ResidentEducationOrganizationId
				,IsConcurrentForLimiting
				,MembershipFTEDescriptorId
				,TuitionPayerDescriptorId
				,ProgramServiceDescriptorId
				,TrackNumber
				,IsHomeBound
				,FundingTypeId
				,MembershipIntervalStartDate
				,MembershipIntervalEndDate
				,UnadjustedMembershipDays
				,UnadjustedAbsenceDays
				,UnadjustedAverageDailyMembership
				,UnadjustedAverageDailyAttendance
				,CreateDate
				,SPEDSupportLevelWeight
				,SpecialEnrollmentDescriptorId
				,ServiceCodeDescriptorId
				,StudentSchoolAssociationEntryDate
				,UnadjustedDaysEnrolled
				,YearEndUnadjustedADM
				,YearEndAdjustedADM
				,YearEndAdjustedADA
				,LimitedAverageDailyMembership
				,LimitedAverageDailyAttendance
				,LimitedMembershipDays
				,LimitedAbsenceDays
				,AttendanceMinutes
		FROM #MembershipInterval

		

		--Drop the temp table ##MembershipSummary if it exist
		IF OBJECT_ID('tempdb..#MembershipSummary') IS NOT NULL DROP TABLE #MembershipSummary

		--Load the data in the temp table #MembershipSummary from ace.MembershipSummary Table for the given Execution Id 
		SELECT	ms.*
		INTO #MembershipSummary
        FROM ace.MembershipSummary ms
		JOIN @ExecutionId e
		ON ms.ExecutionId = e.ExecutionId

		--Insert the Membeship summary records
		INSERT INTO ace.MembershipSummaryArchive
			   (
				 MembershipSummaryId
				 ,ExecutionId
				 ,FiscalYear
				 ,ADMTypeId
				 ,AggregationTypeId
				 ,ReportingPeriodTypeId
				 ,ReportingPeriodId
				 ,SchoolId
				 ,GradeLevelTypeId
				 ,AttendingLocalEducationAgencyId
				 ,ResidentEducationOrganizationId
				 ,FundingTypeId
				 ,SpecialEnrollmentDescriptorId
				 ,ServiceCodeDescriptorId
				 ,ProgramServiceDescriptorId
				 ,FTFStatus
				 ,LimitedMembershipDays
				 ,LimitedAbsenceDays
				 ,LimitedAverageDailyAttendance
				 ,LimitedAverageDailyMembership
				 ,YearEndAdjustedADM
				 ,YearEndAdjustedADA
				 ,CreateDate
			   )
     
		SELECT MembershipSummaryId
			  ,ExecutionId
			  ,FiscalYear
			  ,ADMTypeId
			  ,AggregationTypeId
			  ,ReportingPeriodTypeId
			  ,ReportingPeriodId
			  ,SchoolId
			  ,GradeLevelTypeId
			  ,AttendingLocalEducationAgencyId
			  ,ResidentEducationOrganizationId
			  ,FundingTypeId
			  ,SpecialEnrollmentDescriptorId
			  ,ServiceCodeDescriptorId
			  ,ProgramServiceDescriptorId
			  ,FTFStatus
			  ,LimitedMembershipDays
			  ,LimitedAbsenceDays
			  ,LimitedAverageDailyAttendance
			  ,LimitedAverageDailyMembership
			  ,YearEndAdjustedADM
			  ,YearEndAdjustedADA
			  ,CreateDate
		FROM #MembershipSummary


		--Insert the Limited Average Daily Membeship records
		INSERT INTO ace.LimitedAverageDailyMembershipArchive
			   (
				  ladm.LimitingByReportingPeriodId
				 ,ladm.FiscalYear
				 ,ladm.MembershipIntervalId
				 ,ladm.ReportingPeriodTypeId
				 ,ladm.ReportingPeriodId
				 ,ladm.LimitingLevelTypeId
				 ,ladm.LimitedMembershipDays
				 ,ladm.LimitedAbsenceDays
				 ,ladm.LimitedAverageDailyMembership
				 ,ladm.LimitedAverageDailyAttendance
				 ,ladm.LimitingFactor
			   )
		SELECT LimitingByReportingPeriodId
			  ,ladm.FiscalYear
			  ,ladm.MembershipIntervalId
			  ,ladm.ReportingPeriodTypeId
			  ,ladm.ReportingPeriodId
			  ,ladm.LimitingLevelTypeId
			  ,ladm.LimitedMembershipDays
			  ,ladm.LimitedAbsenceDays
			  ,ladm.LimitedAverageDailyMembership
			  ,ladm.LimitedAverageDailyAttendance
			  ,LimitingFactor
        FROM ace.LimitedAverageDailyMembership ladm
		     JOIN #MembershipInterval mi
		       ON ladm.MembershipIntervalId = mi.MembershipIntervalId
		  
		--Insert the Unit Of Work Archive records
		INSERT INTO ace.UnitOfWorkArchive
				(
				  UnitOfWorkId
				 ,ExecutionId
				 ,FiscalYear
				 ,StudentUSI
				 ,SchoolId
				 ,MessageId
				 ,ADM
				 ,SPED
				 ,ELL
				)
		SELECT	UnitOfWorkId
			   ,uow.ExecutionId
			   ,FiscalYear
			   ,StudentUSI
			   ,SchoolId
			   ,MessageId
			   ,ADM
			   ,SPED
			   ,ELL
        FROM ace.UnitOfWork uow
			 JOIN @ExecutionId e
			   ON uow.ExecutionId = e.ExecutionId
  
		--All well, commit the changes
		IF @@TRANCOUNT > 0
			SET @return_value = 1;
			COMMIT TRAN InsertArchive
	END TRY
		
	BEGIN CATCH
		--Something wrong, Rollback the changes

		IF @@TRANCOUNT > 0
			SET @return_value = 0;
			ROLLBACK TRAN InsertArchive
	END CATCH

END