/*************************************************************************************
**Procedure Name:
**     StudentAnalysis.GetStudentADMData
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Gives ADM Data for a student
**   
**Input:
**  @permittedEdOrgs as NVARCHAR(MAX) = null, @Schools NVARCHAR(MAX)
**	@StudentUniqueID NVARCHAR(32)
**  @Schools AS	[StudentAnalysis].[EntityList] ; insert into @Schools VALUES( 4970),(7318)	
**	@ExecutionId    INT
**	
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from Student Analysis Tool - ADM Tab
**
**Revision History:
**	P Kanyar		03/07/2017		Initial creation
**	P Kanyar		03/10/2017		Removed spaces between column names
**	Rchinta			04/04/2017		Adding the DistrictID to Proc
**	P Kanyar		06/26/2017		Removed joins with process.execution
**	P Kanyar		08/28/2017		Added 2 fields to the result set -DaysEnrolledinPeriod,MembershipFTE
**
**************************************************************************************/	
--DECLARE	
--	@FiscalYear		 AS INT = '2017',
--	@PermittedEdOrgs AS NVARCHAR(MAX) = '4235', --79275 ,5908
--	@StudentUniqueID AS NVARCHAR(32) = '77197789', 
--	@AgExecutionID	 AS INT = 3344,
--	@DataCaptureDate AS NVARCHAR(20) = '02/15/2017 11:07AM'
--declare @Schools AS	[StudentAnalysis].[EntityList] ; 
--insert into @Schools VALUES( 4980),(5908)	
-------------------------------------------------------------------------
CREATE PROC [StudentAnalysis].[GetStudentADMData]
	@FiscalYear		 AS INT,
	@PermittedEdOrgs AS NVARCHAR(MAX), 
	@Schools		 AS [StudentAnalysis].[EntityList] READONLY ,	
	@StudentUniqueID AS NVARCHAR(32),
	@AgExecutionID	 AS INT,
	@DataCaptureDate AS NVARCHAR(20)

AS
BEGIN

	SET NOCOUNT ON

	SELECT 
		 vuS.SchoolCTDS								AS 'CTDS'
		,mi.SchoolId								AS 'SchoolID'
		,@DataCaptureDate							AS 'DataCaptureDate'
		,adm.Description							AS 'ADMType'
		,at.Description								AS 'ADMAggregationType'
		,mi.ResidentEducationOrganizationId			AS 'DistrictOfResidence'
		,vuR.LocalEducationAgencyName				AS 'DORName' 
		,gl.CodeValue								AS 'GradeLevel'
		,rp.Description								AS 'ReportingPeriodName'
		,CASE mi.IsHomeBound WHEN 1 THEN 'Yes'		
							 ELSE 'No'						
		  END										AS 'HomeboundStudent'
		,CASE ft.IsFundable WHEN 1 THEN 'Fundable' 
							ELSE 'Non-Fundable' 
		  END										AS 'FundableInterval'
		,MembershipIntervalStartDate
		,MembershipIntervalEndDate
		,UnadjustedAverageDailyMembership			AS 'ADMBeforeLimiting'
		,LimitedAverageDailyMembership				AS 'LimitedADM'
		,vuR.LocalEducationAgencyId					AS 'Districtid'
		,mi.UnadjustedDaysEnrolled					AS 'DaysEnrolledinPeriod'
		,dfte.CodeValue								AS 'MembershipFTE'
	FROM 
		ace.MembershipInterval mi (NOLOCK)

		INNER JOIN @Schools sch 
			ON sch.EdorgId = mi.SchoolId
				AND mi.ExecutionId = @AgExecutionID 
				AND mi.FiscalYear = @FiscalYear

		INNER JOIN leadata.Student st (NOLOCK)
			ON st.StudentUSI = mi.StudentUSI
				AND st.StudentUniqueId = @StudentUniqueID

		INNER JOIN [StudentAnalysis].[GetLocalEducationAgencyIdList](@PermittedEdOrgs,@FiscalYear) lid 
			ON lid.LocalEducationAgencyId = mi.AttendingLocalEducationAgencyId			-- DOA/ School/ State can see data
					OR lid.LocalEducationAgencyId = 79275 

		INNER JOIN [StudentAnalysis].[GetEdorglist](@permittedEdOrgs,@FiscalYear) ge
			ON ge.EdOrgId = mi.Schoolid

		LEFT JOIN entity.vw_LocalEducationAgency vuR (NOLOCK)
			ON mi.ResidentEducationOrganizationId = vuR.LocalEducationAgencyId
				AND mi.FiscalYear = vuR.FiscalYear

		LEFT JOIN entity.vw_School vuS (NOLOCK)
			ON mi.SchoolId = vuS.SchoolId
				AND mi.FiscalYear = vuS.FiscalYear

		LEFT JOIN ace.FundingType ft (NOLOCK) 
			ON mi.FundingTypeId = ft.FundingTypeId

		LEFT JOIN ace.ADMType adm (NOLOCK)  
			ON mi.ADMTypeId = adm.ADMTypeId

		LEFT JOIN ace.AggregationType at (NOLOCK) 
			ON mi.AggregationTypeId = at.AggregationTypeId

		LEFT JOIN entity.GradeLevelType gl (NOLOCK)
			ON mi.GradeLevelTypeId = gl.GradeLevelTypeId

		LEFT JOIN config.ReportingPeriod rp (NOLOCK)
			ON mi.ReportingPeriodId = rp.ReportingPeriodId
				AND mi.FiscalYear = rp.FiscalYear

		LEFT JOIN leadata.Descriptor dFTE  (NOLOCK)
			ON mi.MembershipFTEDescriptorId = dFTE.DescriptorId
				AND mi.FiscalYear = dFTE.FiscalYear

	END

/* end [StudentAnalysis].[GetStudentADMData] */