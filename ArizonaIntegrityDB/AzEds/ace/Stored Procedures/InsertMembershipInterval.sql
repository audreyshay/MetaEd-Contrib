/********************************************************************************************************
**Procedure Name:
**      ace.InsertMembershipInterval
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts Membership Interval records after ACE Calculation
**               
**Input:
**      ace.MembershipIntervalTableType User Defined Table type
**		ace.StatewideLimitingTableType  User Define Table Type
**
**Output:
**	None
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	VIJU					06/29/2015	Initial Creation
**	VIJU					07/31/2015	Modified to insert Statewide limited data
**	PM						08/03/2015	Modified the procedure to match schema changes
**	VIJU					09/03/2015	Modified the procedure to match schema changes
**	VIJU					09/18/2015	Modified the procedure to match schema changes
**	VIJU					09/24/2015	Modified the procedure to match schema changes
**	VIJU					10/30/2015  Modified the procedure to match schema changes 
**	Chris M					01/27/2016  Added nolock hint to avoid deadlock on backwards call to MI table interfering with other asnyc inserts.
**	Chris M					02/17/2016  Added AttendanceMinutes. [AttendanceMinutes] [decimal] (10, 4) NULL 
**	Chris M					03/09/2016  Removing LimitingReasonType 
**	Chris M					01/11/2019  Adding new fields, IsChronicallyIll, CalendarCode
**********************************************************************************************************/
CREATE PROCEDURE [ace].[InsertMembershipInterval]
	@MembershipInterval  AS ace.MembershipIntervalTableType READONLY,
	@LimitedDays AS ace.LimitingTableType READONLY
AS

BEGIN
	SET NOCOUNT ON;
	--Insert the Membership Intervals and Limited data

	INSERT INTO [ace].[MembershipInterval]
			([ExecutionId]
			,[FiscalYear]
			,[ADMTypeId]
			,[AggregationTypeId]
			,[ReportingPeriodTypeId]
			,[ReportingPeriodId]
			,[StudentUSI]
			,[SchoolId]
			,[GradeLevelTypeId]
			,[AttendingLocalEducationAgencyId]
			,[ResidentEducationOrganizationId]
			,[IsConcurrentForLimiting]
			,[MembershipFTEDescriptorId]
			,[TuitionPayerDescriptorId]
			,[ProgramServiceDescriptorId]
			,[TrackNumber]
			,[CalendarCode]
			,[IsHomeBound]
			,[FundingTypeId]
			,[MembershipIntervalStartDate]
			,[MembershipIntervalEndDate]
			,[UnadjustedMembershipDays]
			,[UnadjustedAbsenceDays]
			,[UnadjustedAverageDailyMembership]
			,[UnadjustedAverageDailyAttendance]
			,[CreateDate]
			,[SPEDSupportLevelWeight]
			,[SpecialEnrollmentDescriptorId]
			,[ServiceCodeDescriptorId]
			,[StudentSchoolAssociationEntryDate]
			,[UnadjustedDaysEnrolled]
			,[YearEndUnadjustedADM]
			,[YearEndAdjustedADM]
			,[YearEndAdjustedADA]
			,[LimitedAverageDailyMembership]
			,[LimitedAverageDailyAttendance]
			,[LimitedMembershipDays]
			,[LimitedAbsenceDays]
			,[AttendanceMinutes]
			,[SubmittedByEducationOrganizationId]
			,[IsChronicallyIll]
			)
		SELECT
			ExecutionID
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
			,CalendarCode
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
			,SubmittedByEducationOrganizationId
			,IsChronicallyIll
		FROM @MembershipInterval
	
	--Insert the Limited Days and Limited ADM

	INSERT INTO [ace].[LimitedAverageDailyMembership]
            ([FiscalYear]
            ,[MembershipIntervalId]
            ,[ReportingPeriodTypeId]
            ,[ReportingPeriodId]
			,[LimitingLevelTypeId]
			,[LimitedMembershipDays]
			,[LimitedAbsenceDays]
			,[LimitedAverageDailyMembership]
			,[LimitedAverageDailyAttendance]
			,[LimitingFactor])
	SELECT	l.FiscalYear 
			,mi.MembershipIntervalId
			,l.ReportingPeriodTypeId
			,l.ReportingPeriodId
			,l.LimitingLevelId
			,l.LimitedMembershipDays
			,l.LimitedAbsenceDays
			,l.LimitedAverageDailyMembership
			,l.LimitedAverageDailyAttendance
			,l.LimitingFactor

		FROM [ace].[MembershipInterval] mi (nolock)
		JOIN @LimitedDays l
		  ON mi.FiscalYear = l.FiscalYear
		 AND mi.ReportingPeriodId = l.MembershipIntervalReportingPeriodId
		 AND mi.ExecutionId = l.ExecutionId
		 AND mi.ADMTypeId = l.ADMTypeId
		 AND mi.AggregationTypeId = l.AggregationTypeId
		 AND mi.StudentUSI = l.StudentUSI
		 AND mi.SchoolId = l.SchoolId
		 AND mi.MembershipIntervalStartDate = l.MembershipIntervalStartDate
END