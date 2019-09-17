
/****************************************************************************************
**Procedure Name:
**      report.DropoutTrackerDetails
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Returns information regarding subsequent enrollment for students with W4/5,S4/5 codes, 
**  totals for Students at the district,and Schools requested.
**  Additionally, it is filtered by Fiscal Year. 
**   
**Input:
**  @SchoolsList -  SchoolId to filter upon
**	@FiscalYear - fiscalyear to filter upon
**	@LocalEducationAgencyId - LEAId the report is executed for
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from DropoutTrackerDetails report
**
**Revision History:
**	P Kanyar		11/16/2015	Initial creation
**	P Kanyar		03/01/2016	Concatenated School ID with the School Name
**  Harsha Kankanala 03/19/2019 Changed the stored to check if there are concurrent enrollments in the Preceeding Fiscal Years 
*****************************************************************************************/
CREATE PROC [report].[DropoutTrackerDetails] 
 	@SchoolsList nvarchar(max),
	@FiscalYear int ,	
	@LocalEducationAgencyId int

AS
BEGIN

	DECLARE @ReportStudents TABLE (StudentUSI int
								  ,StudentUniqueId nvarchar(32)
								  ,FirstName nvarchar(75)
								  ,LastSurname nvarchar(75)
								  ,MiddleName nvarchar(75)
								  ,BirthDate date
								  ,SchoolId int
								  ,EntryDate date
								  ,EntryGradeLevelDescriptorId int
								  ,SubmittedByEducationOrganizationId int
								  ,DOALocalEducationAgencyId int
								  ,DORLocalEducationAgencyId int 
								  ,FiscalYear int
								  ,DORStartDate date
								  ,SSAResourceId uniqueidentifier
								  ,SEOResourceId uniqueidentifier )

	INSERT INTO @ReportStudents
	EXEC [report].GetReportStudentSchoolList @SchoolsList,@LocalEducationAgencyId, 0, @FiscalYear		-- 0 for unspecified report


	SELECT DISTINCT
		 SUBSTRING(LTRIM(eo.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 7, 3) AS 'SchoolCTDS'
		,eo.NameOfInstitution + ' (' + CAST(rs.SchoolId as nvarchar(20)) + ')'  AS 'SchoolName'
		,eo.CTDS
		,xgl.GradeLevel															AS 'GradeLevel'
		,xgl.SortOrder															AS 'GradeLevelSortOrder'
		,ISNULL(sic.IdentificationCode,'')										AS 'DistrictStudentID'
		,rs.StudentUSI	
		,rs.StudentUniqueId														AS 'StateStudentID'
		,rs.LastSurname															AS 'LastName'
		,rs.FirstName
		,CONVERT(nvarchar(8), ssa.EntryDate, 1)									AS 'FirstDayOfMembership'
		,CONVERT(nvarchar(8), ssa.ExitWithdrawDate, 1)							AS 'LastDayOfMembership' 
		,ISNULL(ewtd.CodeValue,'')												AS 'WithdrawalActivityCode'
		,CASE 
		 WHEN  ssa1.EntryDate IS NOT NULL THEN 'Y'
		  WHEN  ssa2.EntryDate IS NOT NULL THEN 'Y'
		  ELSE 'N/A'	END														AS 'SubsequentEnrollment'
		,CASE 
				WHEN ssa1.EntryDate IS NOT NULL  
			AND ssa1.ExitWithdrawTypeDescriptorId IN (10483,10059,10497)									-- G,W7,S7 Withdrawal codes for Graduation
				THEN 'Y'
			
		ELSE 'N/A' END													AS 'SubsequentGraduation'
	FROM
		@ReportStudents rs 
			INNER JOIN
		(select * from [leadata].[StudentSchoolAssociation] WHERE FiscalYear = @FiscalYear) ssa ON rs.SSAResourceId = ssa.SourceId
				AND ssa.ExitWithdrawTypeDescriptorId IN (10064,10057,10494,10495)									-- W4,W5,S4,S5 Withdrawal codes for status-unknown, dropout
			INNER JOIN
		[entity].[EducationOrganization] eo ON ssa.SchoolId = eo.EducationOrganizationId
				AND ssa.Fiscalyear = eo.FiscalYear
			INNER JOIN
		[leadata].[Descriptor] d on rs.EntryGradeLevelDescriptorId = d.DescriptorId
			LEFT JOIN
		[leadata].[StudentSchoolAssociation] ssa1 ON ssa1.StudentUSI = ssa.StudentUSI 
				AND ssa.FiscalYear = ssa1.FiscalYear
				AND ((ssa1.EntryDate > ssa.EntryDate AND ISNULL(ssa1.ExitWithdrawDate,'9999-09-09') > ssa.ExitWithdrawDate) 
						OR (ssa1.EntryDate <= ssa.EntryDate AND (ssa1.ExitWithdrawDate IS NULL OR ssa1.ExitWithdrawDate > ssa.ExitWithdrawDate))
					)  
				AND ssa1.SourceId <> ssa.SourceId
							LEFT JOIN
		(select * FROM [leadata].[StudentSchoolAssociation] WHERE FiscalYear >@FiscalYear) ssa2 ON ssa2.StudentUSI = ssa.StudentUSI 
				--AND ssa.FiscalYear = ssa2.FiscalYear
				AND ((ssa2.EntryDate > ssa.EntryDate AND ISNULL(ssa2.ExitWithdrawDate,'9999-09-09') > ssa.ExitWithdrawDate) 
						OR (ssa2.EntryDate <= ssa.EntryDate AND (ssa2.ExitWithdrawDate IS NULL OR ssa2.ExitWithdrawDate > ssa.ExitWithdrawDate))
					)  
				AND ssa2.SourceId <> ssa.SourceId
	
			LEFT JOIN
		[report].[XrefGradeLevelSortOrder] xgl ON xgl.GradeLevel = d.CodeValue	
			LEFT JOIN
		[leadata].[StudentIdentificationCode] sic ON rs.StudentUSI = sic.StudentUSI 
				AND sic.StudentIdentificationSystemTypeId = 2														-- for District Student Id
				AND sic.AssigningOrganizationIdentificationCode = CONVERT(nvarchar(60), @LocalEducationAgencyId)	-- To bring District Id Assigned by the LEA runnig the report												
			LEFT JOIN
		[leadata].[Descriptor] ewtd ON ssa.ExitWithdrawTypeDescriptorId = ewtd.DescriptorId		
			
	ORDER BY 
		 eo.CTDS
		,LastName 
		,FirstName
		,StateStudentID 
END

/*End DropoutTrackerDetails*/ 



