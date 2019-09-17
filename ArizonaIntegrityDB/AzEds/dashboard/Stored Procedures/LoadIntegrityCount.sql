
/************************************************************************************************************************
**Procedure Name: dashboard.LoadIntegrityCount
**
**Author: Britto Augustine
**
**Description: get Membership, State ELL, State SPED Integrity Pass/Fail counts from the AzEDS database by LEA, School and loads it into dashboard.RecordCount table
**			   called by the AzEDS nightly processing job after Integrity is completed
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  Britto Augustine		09/12/2016	Modified to split counts by DOR and DOA
**  Britto Augustine        05/02/2017  Removed the where condition ResponsibilityDescriptorId = 236, because that is taken of by the integrity load procs.
**										 The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
***************************************************************************************************************************/
CREATE PROC dashboard.LoadIntegrityCount
	@IntegrityExecutionId as int
AS
BEGIN

	declare @EventDateId as int
	declare @FY as int 
	declare @IntegrityStartDate as date
	declare @FYStartDate as date
	declare @FYEndDate as date
	
	declare @CurrentDateTime as datetime
	set @CurrentDateTime = GETDATE()

	--cerate or get event date id
	exec dashboard.CreateEventDate @ExecutionId = @IntegrityExecutionId, @EventDateId = @EventDateId output

	IF @EventDateId IS NULL
		THROW 51000, 'Could not create EventDateId.', 1;  

	--get FY from execution
	IF EXISTS (SELECT 1 FROM process.Execution WHERE ExecutionId = @IntegrityExecutionId)
		SELECT @FY = FiscalYear
		FROM process.Execution 
		WHERE ExecutionId = @IntegrityExecutionId
	ELSE		
		THROW 51000, 'Could not find Execution record.', 1;  
			
	IF EXISTS (select 1 from config.FiscalYear where FiscalYear = @FY) 
		select @FYStartDate = StartDate, @FYEndDate = EndDate
		from config.FiscalYear
		where FiscalYear = @FY
	ELSE
		THROW 51000, 'Invalid Fiscal Year.', 1;  


	--delete existing data so we can insert it below
	delete from dashboard.RecordCount
	where EventDateId = @EventDateId 
	  and RecordCountTypeId in (600,601,602,603,604,605)


	;WITH cteStudentEducationOrganizationAssociation as 
	(
		--cte to get funding DOR 
		SELECT DISTINCT seoa.FiscalYear, seoa.StudentUSI, seoa.SchoolId, lea.LocalEducationAgencyId as ResidentLocalEducationAgencyId
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa WITH (NOLOCK)
		LEFT JOIN entity.LocalEducationAgency lea
			ON lea.FiscalYear = seoa.FiscalYear
		   AND lea.LocalEducationAgencyId = seoa.EducationOrganizationId
		WHERE seoa.FiscalYear = @FY
	)

	--insert integrtiy passed/failed counts
	INSERT into dashboard.RecordCount
		(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)

	  --ADM Integrity Passed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	600 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
		JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
		    AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingADMIntegrityPassed = 1
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

		UNION 

		--ADM Integrity Failed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	601 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
		JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
			AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingADMIntegrityPassed = 0
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

		UNION

		--State SPED Integrity Passed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	602 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
		JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
			AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingSPEDIntegrityPassed = 1
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

		UNION 

		----State SPED Integrity Failed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	603 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
			JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
			AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingSPEDIntegrityPassed = 0
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

		UNION

		--State ELL Integrity Passed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	604 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
		JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
			AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingELLIntegrityPassed = 1
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

		UNION

		--State ELL Integrity Failed Count
		SELECT 
			@EventDateId as EventDateId, @FY as FiscalYear,	605 AS RecordCountTypeId,
			s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId, count(*) AS RecordCount,
			@CurrentDateTime as CreateDate
		FROM integrity.vw_ADMIntegrityResult ir WITH (NOLOCK)
		JOIN entity.School s WITH (NOLOCK) 
			ON s.SchoolId = ir.SchoolId
			AND s.FiscalYear = ir.FiscalYear
		LEFT JOIN cteStudentEducationOrganizationAssociation dor
			ON dor.FiscalYear = ir.FiscalYear
           AND dor.StudentUSI = ir.StudentUSI
		   AND dor.SchoolId = ir.SchoolId
		WHERE ir.IsStateFundingELLIntegrityPassed = 0
			AND ir.FiscalYear = @FY
		GROUP BY s.LocalEducationAgencyId, dor.ResidentLocalEducationAgencyId, ir.SchoolId

END
