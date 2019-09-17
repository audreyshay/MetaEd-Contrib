
/**********************************************************************************************************
**Procedure Name:
**      report.GetLimitedADMReportData
**
**Author:
**      
**
**Description:  
**  
** 
**Input:
**  @ExcecutionId 
**	@LocalEducationAgency  
**  @SchoolsList  
**	
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from LMTADM25 report
**
**Revision History:
**							Initial creation
**	P Kanyar	11/04/2016	Added sorting
**	CM			11/30/2016	admtypeid = 1 only
************************************************************************************************************/
CREATE PROCEDURE [report].[GetLimitedADMReportData]  
	@ExcecutionId INT,
	@LocalEducationAgency  INT,	-- Validate.
	@SchoolsList nvarchar(max) = NULL				-- comma separated list of school id(s)

AS
BEGIN 

	-- breaking comma separated list & storing in to table variables
	DECLARE @Schools TABLE ([SchoolId] int)
	INSERT INTO @Schools SELECT DISTINCT [Token] FROM [util].[Split](@SchoolsList, ',' ) 

    SET NOCOUNT ON;

	SELECT 
	    MembershipIntervalId,
		at.Description						AS AggregationTypeDesc, 
		mi.ExecutionId,
		mi.FiscalYear,
		integExecution.InitiatedDateTime	AS DataCaptureDate,
	    StudentUniqueId, 
		mi.StudentUSI,
		s.FirstName,
		s.MiddleName,
		s.LastSurname,
		s.BirthDate,
		ssa.Description						AS MembershipTypeDesc,
		ssa.EntryDate						AS MembershipEntryDate,
		ssa.ExitWithdrawDate				AS MembershipExitWithdrawDate,
		glt.CodeValue						AS EntryGradeLevelDesc,
		mi.SchoolId,
		eo.NameOfInstitution				AS SchoolName,
		AttendingLocalEducationAgencyId,
		eoDOA.NameOfInstitution				AS AttendingLEAName,
		ResidentEducationOrganizationId,
		eoDOR.NameOfInstitution				AS ResidentLEAName,
		mi.MembershipIntervalStartDate,
		mi.MembershipIntervalEndDate,
		mi.ReportingPeriodId,
		rp.Description						AS ReportingPeriodDesc,
		CASE 
			WHEN ISNUMERIC(d.CodeValue) = 1 
			THEN CONVERT(DECIMAL(10, 2), d.CodeValue) 
		ELSE 0 END							AS MembershipFTEValue,
		UnadjustedAverageDailyMembership,
		LimitedAverageDailyMembership,
		UnadjustedMembershipDays,
		LimitedMembershipDays,
		YearEndUnadjustedADM,
		YearEndAdjustedADM
	FROM   ace.MembershipInterval mi
		LEFT JOIN leadata.Student s ON mi.StudentUSI = s.StudentUSI
		LEFT JOIN leadata.Descriptor d ON  mi.MembershipFTEDescriptorId = d.DescriptorId 
			AND d.FiscalYear = mi.FiscalYear
		LEFT JOIN entity.EducationOrganization eo ON mi.SchoolId = eo.EducationOrganizationId 
			AND eo.FiscalYear = mi.FiscalYear
		LEFT JOIN ace.AggregationType at ON mi.AggregationTypeId = at.AggregationTypeId

		LEFT JOIN 
			( SELECT EntryDate, ExitWithdrawDate, StudentUSI, ssai.FiscalYear, SchoolId, MembershipTypeDescriptorId, Description 
			  FROM leadata.StudentSchoolAssociation ssai, leadata.Descriptor mt
			  WHERE ssai.MembershipTypeDescriptorId = mt.DescriptorId AND ssai.FiscalYear = mt.FiscalYear
			) ssa ON mi.StudentUSI = ssa.StudentUSI 
			AND mi.FiscalYear = ssa.FiscalYear
			AND mi.StudentSchoolAssociationEntryDate = ssa.EntryDate 
			AND mi.SchoolId = ssa.SchoolId

		LEFT JOIN entity.GradeLevelType glt ON mi.GradeLevelTypeId = glt.GradeLevelTypeId
		LEFT JOIN entity.EducationOrganization eoDOA ON mi.AttendingLocalEducationAgencyId = eoDOA.EducationOrganizationId
			AND eoDOA.FiscalYear = mi.FiscalYear
		LEFT JOIN entity.EducationOrganization eoDOR ON mi.ResidentEducationOrganizationId = eoDOR.EducationOrganizationId
			AND eoDOR.FiscalYear = mi.FiscalYear
		LEFT JOIN config.ReportingPeriod rp ON mi.reportingPeriodId = rp.ReportingPeriodId
			AND rp.FiscalYear = mi.FiscalYear
		LEFT JOIN process.Execution currentExecution ON currentExecution.ExecutionId = @ExcecutionId
		LEFT JOIN process.Execution integExecution ON integExecution.ExecutionId = currentExecution.ReferenceExecutionId
	WHERE  
		mi.ExecutionId = @ExcecutionId
		AND mi.ADMTypeId = 1
		AND UnadjustedAverageDailyMembership <> LimitedAverageDailyMembership
		AND mi.StudentUSI IN (
								SELECT StudentUSI
								FROM ace.MembershipInterval
								WHERE ExecutionId = @ExcecutionId
									AND (ResidentEducationOrganizationId = @LocalEducationAgency OR AttendingLocalEducationAgencyId = @LocalEducationAgency)
									AND (@SchoolsList IS NULL OR SchoolId IN (SELECT SchoolId FROM @Schools))
									AND UnadjustedAverageDailyMembership <> LimitedAverageDailyMembership
							  ) -- Limited students in host lea.
	ORDER BY
		 LastSurname
		,FirstName
		,StudentUniqueId
		,mi.ReportingPeriodId
		,MembershipIntervalStartDate
		,MembershipIntervalEndDate		

END