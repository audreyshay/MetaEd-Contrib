/*************************************************************************************
**Procedure Name:
**      report.ACEStudentIntervalDetails
**
**Author:
**      Amit Verma
**
**Description:  
**  Gives ACE Students Interval Details
**   
**Input:
**  @LEA			INT,
**	@SchoolsList	NVARCHAR(max), 
**	@ExecutionId    INT
**	
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from ADM15 StudentAdjustedADMReport.rdl (ADM15 Report) 
**
**Revision History:
**	Pratibha Kanyar		03/24/2016		Initial creation
**  Amit Verma			06/23/2016      Added the ExecutionId parameter     
**  Amit Verma			07/01/2016      Added 2 mpore columns in Output dataset
**  Britto Augustine	08/12/2016      removed fiscalyear from parameter
**  Britto Augustine	11/01/2016      removed where condition and moved it into the MembershipInterval Join to improve performance
**  Amit Verma			01/05/2017		Bug fix - 170604 - Updated the Logic of DataCaptureDate
**  Harsha Kankanala	04/02/2019		Changed the query to pick up partition
**  Harsha Kankanala	04/03/2019		Changed the query to fetch track number
**************************************************************************************/	
CREATE PROC [report].[ACEStudentIntervalDetails] --4441,'5910',2481
	@LEA			INT,
	@SchoolsList	NVARCHAR(max), -- Must be a comma seperated list of all the schools
	@ExecutionId    INT
AS

SET NOCOUNT ON


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

Declare @FiscalYear Int = (Select FiscalYear from process.Execution where ExecutionId = @ExecutionId)

-- Run the main query
SELECT 
	mi.[ExecutionId]
	, adm.Description AS ADMType
	, mi.[FiscalYear]
	, CONVERT(VARCHAR(10),DATEADD("hh", -7, eIntgy.InitiatedDateTime),101) + ' ' + RIGHT(CONVERT(VARCHAR(30),DATEADD("hh", -7, eIntgy.InitiatedDateTime),100),7) AS 'DataCaptureDate'
	--, eIntgy.InitiatedDateTime AS DataCaptureDate
	, [ResidentEducationOrganizationId]
	, eoR.NameOfInstitution AS DOR_Name
	, [AttendingLocalEducationAgencyId]
	, eoA.NameOfInstitution AS DOA_Name
	, mi.[SchoolId]
	, eoS.NameOfInstitution AS SchoolName
	, at.Description AS AggregationTypeName
	, s.StudentUniqueId
	, s.LastSurname
	, s.FirstName
	, CONVERT(date, s.BirthDate) AS BirthDate
	, dMT.Description AS MembershipTypeDescriptorName
	, dSED.Description SpecialEnrollmentDescriptorName
	, dGrade.CodeValue as GradeName
	, mi.[TrackNumber]
	, [StudentSchoolAssociationEntryDate]
	, ssa.ExitWithdrawDate 
	, rp.Description AS ReportingPeriodName
	, [IsHomeBound]
	, CASE ft.IsFundable 
		WHEN 1 Then 'Fundable' 
		ELSE 'Non-Fundable' 
	  END AS Fundability
	, ft.Description AS FundingTypeName
	, [MembershipIntervalStartDate]
	, [MembershipIntervalEndDate]
	, [UnadjustedDaysEnrolled]
	, dFTE.CodeValue AS MembershipFTEDescriptorValue
	, [UnadjustedMembershipDays]
	, [UnadjustedAverageDailyMembership]
	, [YearEndUnadjustedADM]
	, [LimitedAverageDailyMembership]
	, [YearEndAdjustedADM]
	, [IsConcurrentForLimiting]
	, [UnadjustedAbsenceDays]
	, [UnadjustedAverageDailyAttendance]
	, [SPEDSupportLevelWeight]
	,LimitedMembershipDays
	,LimitedAbsenceDays
	,mi.CalendarCode
FROM 
	(select * from [ace].[MembershipInterval] 
	where ExecutionId = @ExecutionId and  ResidentEducationOrganizationId = @LEA and FiscalYear = @FiscalYear ) mi
	INNER JOIN @Schools Sch ON
		(	
			
			 mi.SchoolId = Sch.SchoolId
		)
	INNER JOIN process.Execution e  ON 
		(mi.ExecutionId = e.ExecutionId)
	INNER JOIN process.Execution eIntgy ON 
		(e.ReferenceExecutionId = eIntgy.ExecutionId)
	LEFT OUTER JOIN leadata.StudentSchoolAssociation ssa ON 
		(
			mi.FiscalYear = ssa.FiscalYear
			AND mi.StudentUSI = ssa.StudentUSI
			AND mi.SchoolId = ssa.SchoolId
			AND mi.StudentSchoolAssociationEntryDate = ssa.EntryDate
		)
	LEFT OUTER JOIN entity.EducationOrganization eoR ON 
		(
			mi.ResidentEducationOrganizationId = eoR.EducationOrganizationId
			AND mi.FiscalYear = eoR.FiscalYear
		)
  	LEFT OUTER JOIN entity.EducationOrganization eoA ON 
		(
			mi.AttendingLocalEducationAgencyId = eoA.EducationOrganizationId
			AND mi.FiscalYear = eoA.FiscalYear
		)
	LEFT OUTER JOIN entity.EducationOrganization eoS ON 
		(
			mi.SchoolId = eoS.EducationOrganizationId
			AND mi.FiscalYear = eoS.FiscalYear
		)
	LEFT OUTER JOIN leadata.Student s ON 
		(mi.StudentUSI = s.StudentUSI)
	LEFT OUTER JOIN ace.FundingType ft ON 
		(mi.FundingTypeId = ft.FundingTypeId)
	LEFT OUTER JOIN ace.ADMType adm ON 
		(mi.ADMTypeId = adm.ADMTypeId)
	LEFT OUTER JOIN leadata.Descriptor dSED ON 
		(
			mi.SpecialEnrollmentDescriptorId = dSED.DescriptorId
			AND mi.FiscalYear = dSED.FiscalYear
		)
	LEFT OUTER JOIN leadata.Descriptor dMT ON 
		(
			ssa.MembershipTypeDescriptorId = dMT.DescriptorId
			AND mi.FiscalYear = dMT.FiscalYear
		)
	LEFT OUTER JOIN leadata.Descriptor dFTE ON 
		(
			mi.MembershipFTEDescriptorId = dFTE.DescriptorId
			AND mi.FiscalYear = dFTE.FiscalYear
		)
    LEFT OUTER JOIN [entity].[GradeLevelType] dGrade ON 
            (
                    mi.GradeLevelTypeId = dGrade.GradeLevelTypeId
            )
	LEFT OUTER JOIN ace.AggregationType at ON 
		(mi.AggregationTypeId = at.AggregationTypeId)
	LEFT OUTER JOIN config.ReportingPeriod rp ON 
		(
			mi.ReportingPeriodId = rp.ReportingPeriodId
			AND mi.FiscalYear = rp.FiscalYear
		)

ORDER BY 
	eoS.NameOfInstitution
	, mi.[GradeLevelTypeId]
	, s.LastSurname
	, s.FirstName
	, s.StudentUniqueID
	, mi.[ReportingPeriodId] 
	, [MembershipIntervalStartDate]
