/*******************************************************************************************************
**Procedure Name:
**      [report].[ELL71_ELLProgramParticipationDetails]
**
**Author:
**		Pratibha Kanyar
**
**Description:  
**	
**            
**Input:
**	@LocalEducationAgency - District the report is executed for
**	@SchoolsList          - List of Schools 
**	@FiscalYear	          - FiscalYear to filter upon
**
**Returns:
**
**Implementation:
** 
**Revision History:
**	Who			When		What
**	P Kanyar	12/20/2016	Initial Creation 
**	P Kanyar	01/05/2017	Changed datatype of ResourceIds, removed ell.IntegrityResultTypeId IN (1,2)   
**	P Kanyar	02/08/2017	Added Grade to sorting     
**  Harsha Kankanala 04/29/2019  Changed the stored proc to fetch Calendar Code for 2020 and Track Number for before 2020
**********************************************************************************************************/
CREATE PROCEDURE [report].[ELL71_ELLProgramParticipationDetails]  
	@LocalEducationAgencyId INT,
	@SchoolsList AS NVARCHAR(MAX),
	@FiscalYear INT

AS 
BEGIN 

--DECLARE
--	@LocalEducationAgencyId INT =  4235,  -- 4160
--	@SchoolsList AS NVARCHAR(MAX) = '4980,4925,7318',  --4742 4980,4925, ,7318     
--	@FiscalYear INT = 2017

    SET NOCOUNT ON;
	IF (@FiscalYear<2020)
	Begin
	--Create Temp table for Student Program data with FERPA security implemented
	CREATE TABLE #ReportStudentProgram_sp
	 (
		 StudentUSI int
		,StudentUniqueId nvarchar(32)
		,FirstName nvarchar(75)
		,LastSurname nvarchar(75)
		,MiddleName nvarchar(75)
		,BirthDate date
		,SchoolId int
		,EntryDate date
		,EntryGradeLevelDescriptorId int
		,SSASubmittedByEducationOrganizationId int
		,SPASubmittedByEducationOrganizationId int
		,DOALocalEducationAgencyId int
		,DORLocalEducationAgencyId int 
		,DORStartDate date
		,SSAResourceId nvarchar(50) 
		,SPAResourceId nvarchar(50)
		,SEOResourceId nvarchar(50)  
	 )

	INSERT INTO #ReportStudentProgram_sp
	exec [report].[GetReportStudentProgramList] @SchoolsList, @LocalEducationAgencyId, 1, @FiscalYear

-----------------------------------------------------------------------------------------

	--Create Temp table for Latest Integrity History Ids for given Schools and Fiscal Year for ELL Integrity only
	CREATE TABLE #LatestIntegHistoryId_ELL
		(
			 IntegrityHistoryId BIGINT 
			,FiscalYear INT
			,StudentUSI INT
			,SchoolId INT
			,SchoolEntryDate date
			,IntegrityRuleTypeId INT
			,IntegrityResultTypeId INT 
			,IntegrityRunDateTime DATETIME
			,LocalCourseCode VARCHAR(60)
			,TermTypeId INT
			,SchoolYear INT
			,StaffUSI INT
			,SectionBeginDate DATE
		)

	-- storing Latest Integrity History Ids for given Schools and Fiscal Year for ELL Integrity only
	INSERT INTO #LatestIntegHistoryId_ELL
	SELECT * FROM report.GetLatestIntegrityHistoryIdList_SPED72 (@FiscalYear, @SchoolsList)
	WHERE IntegrityRuleTypeId = 7															-- State ELL Integrity


---------------------------------------------------------------------------------------------------------------
-- bringing report data

SELECT DISTINCT 
	--IntegrityHistoryId
	 fec.NameOfInstitution								AS 'SchoolName'
	,fec.FormattedCTDS									AS 'SchoolCTDS'	
	,ell.IntegrityResultTypeId
	,sic.IdentificationCode								AS 'DistrictStudentID'
	,rsp.StudentUSI
	,rsp.StudentUniqueId								AS 'StateStudentID'
	,st.LastSurname										AS 'LastName'
	,st.FirstName										AS 'FirstName'
	,st.MiddleName
	,CONVERT(NVARCHAR(8),st.BirthDate,1)				AS 'DOB'
	,CASE sxt.CodeValue 
          WHEN 'Female' THEN 'F'
          WHEN 'Male' THEN 'M'
          ELSE 'NP' END									AS 'Gender'
	,gd.CodeValue										AS 'Grade'
	,xso.SortOrder
	,sepa.TrackNumber					                AS 'Track'
	,psd.CodeValue										AS 'ELLProgram'
	,spa.BeginDate
	,spa.EndDate
	,CONVERT(NVARCHAR(8),spa.BeginDate,1)				AS 'ServiceBeginDate'
	,ISNULL(CONVERT(NVARCHAR(8),spa.EndDate,1),'N/A')	AS 'ServiceEndDate'
	,ISNULL(exd.Description,'N/A')						AS 'ELLProgramExitReason'
FROM 
	#ReportStudentProgram_sp rsp

	INNER JOIN [util].[Split](@SchoolsList, ',' ) sc 
		ON sc.Token = rsp.SchoolId

	INNER JOIN leadata.Student st WITH(NOLOCK)
		ON st.StudentUniqueId = rsp.StudentUniqueId

	INNER JOIN leadata.StudentProgramAssociation spa WITH(NOLOCK)
		ON spa.SourceId = rsp.SPAResourceId
			AND spa.FiscalYear = @FiscalYear
			AND spa.ProgramTypeId = 1		-- ell

	 LEFT JOIN entity.ProgramService ps WITH(NOLOCK)
	     ON spa.FiscalYear = ps.FiscalYear
		    AND spa.ProgramEducationOrganizationId = ps.EducationOrganizationId
			AND spa.ProgramTypeId = ps.ProgramTypeId 
			AND spa.ProgramName = ps.ProgramName

	 LEFT JOIN leadata.Descriptor psd WITH(NOLOCK)
	     ON ps.ServiceDescriptorId = psd.DescriptorId
		    AND ps.FiscalYear = psd.FiscalYear

	LEFT JOIN leadata.StudentEnrollmentProgramAssociation sepa WITH(NOLOCK)
		ON sepa.FiscalYear = spa.FiscalYear
			AND sepa.StudentUSI = spa.StudentUSI
			AND sepa.SchoolId = spa.EducationOrganizationId
			AND sepa.ProgramBeginDate = spa.BeginDate
			AND sepa.ProgramEducationOrganizationId = spa.ProgramEducationOrganizationId
			AND sepa.ProgramName = spa.ProgramName
			AND sepa.ProgramTypeId = spa.ProgramTypeId

	LEFT JOIN #LatestIntegHistoryId_ELL ell WITH(NOLOCK)
		on ell.FiscalYear = spa.FiscalYear
			AND ell.StudentUSI = spa.StudentUSI
			AND ell.SchoolId = spa.EducationOrganizationId

	LEFT JOIN leadata.SexType sxt WITH(NOLOCK)
		ON sxt.SexTypeId = st.SextypeId

	LEFT JOIN leadata.Descriptor gd WITH(NOLOCK)
		ON gd.FiscalYear = sepa.FiscalYear
			AND gd.DescriptorId = sepa.EntryGradeLevelDescriptorId

	LEFT JOIN [report].[XrefGradeLevelSortOrder] xso WITH(NOLOCK)
			on xso.GradeLevel = gd.CodeValue

	LEFT JOIN leadata.Descriptor exd WITH(NOLOCK)
		ON exd.FiscalYear = spa.FiscalYear
			AND exd.DescriptorId = spa.ReasonExitedDescriptorId

	LEFT JOIN report.vw_FormattedEducationorganizationCTDS fec WITH(NOLOCK)
		ON fec.EducationOrganizationId = spa.EducationOrganizationId
			AND fec.FiscalYear = spa.FiscalYear

	LEFT JOIN leadata.StudentIdentificationCode sic WITH(NOLOCK) 
	       ON sic.StudentUSI = rsp.StudentUSI
	          AND sic.StudentIdentificationSystemTypeId = 2																			-- District Student Id
			  AND CONVERT(VARCHAR(60),sic.AssigningOrganizationIdentificationCode) = CONVERT(VARCHAR(60),@LocalEducationAgencyId)	-- District Id Assigned by the LEA runnig the report


ORDER BY
	 fec.NameOfInstitution
	,xso.SortOrder
	,st.LastSurname
	,st.FirstName
	,st.MiddleName
	,rsp.StudentUniqueId
	,spa.BeginDate
	,spa.EndDate

	
DROP TABLE #LatestIntegHistoryId_ELL
DROP TABLE #ReportStudentProgram_sp

END
ELSE 
BEGIN
CREATE TABLE #ReportStudentProgram_sp2020
	 (
		 StudentUSI int
		,StudentUniqueId nvarchar(32)
		,FirstName nvarchar(75)
		,LastSurname nvarchar(75)
		,MiddleName nvarchar(75)
		,BirthDate date
		,SchoolId int
		,EntryDate date
		,EntryGradeLevelDescriptorId int
		,SSASubmittedByEducationOrganizationId int
		,SPASubmittedByEducationOrganizationId int
		,DOALocalEducationAgencyId int
		,DORLocalEducationAgencyId int 
		,DORStartDate date
		,SSAResourceId nvarchar(50) 
		,SPAResourceId nvarchar(50)
		,SEOResourceId nvarchar(50)  
	 )

	INSERT INTO #ReportStudentProgram_sp2020
	exec [report].[GetReportStudentProgramList] @SchoolsList, @LocalEducationAgencyId, 1, @FiscalYear

-----------------------------------------------------------------------------------------

	--Create Temp table for Latest Integrity History Ids for given Schools and Fiscal Year for ELL Integrity only
	CREATE TABLE #LatestIntegHistoryId_ELL2020
		(
			 IntegrityHistoryId BIGINT 
			,FiscalYear INT
			,StudentUSI INT
			,SchoolId INT
			,SchoolEntryDate date
			,IntegrityRuleTypeId INT
			,IntegrityResultTypeId INT 
			,IntegrityRunDateTime DATETIME
			,LocalCourseCode VARCHAR(60)
			,TermTypeId INT
			,SchoolYear INT
			,StaffUSI INT
			,SectionBeginDate DATE
		)

	-- storing Latest Integrity History Ids for given Schools and Fiscal Year for ELL Integrity only
	INSERT INTO #LatestIntegHistoryId_ELL2020
	SELECT * FROM report.GetLatestIntegrityHistoryIdList_SPED72 (@FiscalYear, @SchoolsList)
	WHERE IntegrityRuleTypeId = 7															-- State ELL Integrity


---------------------------------------------------------------------------------------------------------------
-- bringing report data

SELECT DISTINCT 
	--IntegrityHistoryId
	 fec.NameOfInstitution								AS 'SchoolName'
	,fec.FormattedCTDS									AS 'SchoolCTDS'	
	,ell.IntegrityResultTypeId
	,sic.IdentificationCode								AS 'DistrictStudentID'
	,rsp.StudentUSI
	,rsp.StudentUniqueId								AS 'StateStudentID'
	,st.LastSurname										AS 'LastName'
	,st.FirstName										AS 'FirstName'
	,st.MiddleName
	,CONVERT(NVARCHAR(8),st.BirthDate,1)				AS 'DOB'
	,CASE sxt.CodeValue 
          WHEN 'Female' THEN 'F'
          WHEN 'Male' THEN 'M'
          ELSE 'NP' END									AS 'Gender'
	,gd.CodeValue										AS 'Grade'
	,xso.SortOrder
	,sepa.CalendarCode				                    AS 'CalendarCode'
	,psd.CodeValue										AS 'ELLProgram'
	,spa.BeginDate
	,spa.EndDate
	,CONVERT(NVARCHAR(8),spa.BeginDate,1)				AS 'ServiceBeginDate'
	,ISNULL(CONVERT(NVARCHAR(8),spa.EndDate,1),'N/A')	AS 'ServiceEndDate'
	,ISNULL(exd.Description,'N/A')						AS 'ELLProgramExitReason'
FROM 
	#ReportStudentProgram_sp2020 rsp

	INNER JOIN [util].[Split](@SchoolsList, ',' ) sc 
		ON sc.Token = rsp.SchoolId

	INNER JOIN leadata.Student st WITH(NOLOCK)
		ON st.StudentUniqueId = rsp.StudentUniqueId

	INNER JOIN leadata.StudentProgramAssociation spa WITH(NOLOCK)
		ON spa.SourceId = rsp.SPAResourceId
			AND spa.FiscalYear = @FiscalYear
			AND spa.ProgramTypeId = 1		-- ell

	 LEFT JOIN entity.ProgramService ps WITH(NOLOCK)
	     ON spa.FiscalYear = ps.FiscalYear
		    AND spa.ProgramEducationOrganizationId = ps.EducationOrganizationId
			AND spa.ProgramTypeId = ps.ProgramTypeId 
			AND spa.ProgramName = ps.ProgramName

	 LEFT JOIN leadata.Descriptor psd WITH(NOLOCK)
	     ON ps.ServiceDescriptorId = psd.DescriptorId
		    AND ps.FiscalYear = psd.FiscalYear

	LEFT JOIN leadata.StudentEnrollmentProgramAssociation sepa WITH(NOLOCK)
		ON sepa.FiscalYear = spa.FiscalYear
			AND sepa.StudentUSI = spa.StudentUSI
			AND sepa.SchoolId = spa.EducationOrganizationId
			AND sepa.ProgramBeginDate = spa.BeginDate
			AND sepa.ProgramEducationOrganizationId = spa.ProgramEducationOrganizationId
			AND sepa.ProgramName = spa.ProgramName
			AND sepa.ProgramTypeId = spa.ProgramTypeId

	LEFT JOIN #LatestIntegHistoryId_ELL2020 ell WITH(NOLOCK)
		on ell.FiscalYear = spa.FiscalYear
			AND ell.StudentUSI = spa.StudentUSI
			AND ell.SchoolId = spa.EducationOrganizationId

	LEFT JOIN leadata.SexType sxt WITH(NOLOCK)
		ON sxt.SexTypeId = st.SextypeId

	LEFT JOIN leadata.Descriptor gd WITH(NOLOCK)
		ON gd.FiscalYear = sepa.FiscalYear
			AND gd.DescriptorId = sepa.EntryGradeLevelDescriptorId

	LEFT JOIN [report].[XrefGradeLevelSortOrder] xso WITH(NOLOCK)
			on xso.GradeLevel = gd.CodeValue

	LEFT JOIN leadata.Descriptor exd WITH(NOLOCK)
		ON exd.FiscalYear = spa.FiscalYear
			AND exd.DescriptorId = spa.ReasonExitedDescriptorId

	LEFT JOIN report.vw_FormattedEducationorganizationCTDS fec WITH(NOLOCK)
		ON fec.EducationOrganizationId = spa.EducationOrganizationId
			AND fec.FiscalYear = spa.FiscalYear

	LEFT JOIN leadata.StudentIdentificationCode sic WITH(NOLOCK) 
	       ON sic.StudentUSI = rsp.StudentUSI
	          AND sic.StudentIdentificationSystemTypeId = 2																			-- District Student Id
			  AND CONVERT(VARCHAR(60),sic.AssigningOrganizationIdentificationCode) = CONVERT(VARCHAR(60),@LocalEducationAgencyId)	-- District Id Assigned by the LEA runnig the report


ORDER BY
	 fec.NameOfInstitution
	,xso.SortOrder
	,st.LastSurname
	,st.FirstName
	,st.MiddleName
	,rsp.StudentUniqueId
	,spa.BeginDate
	,spa.EndDate

	
DROP TABLE #LatestIntegHistoryId_ELL2020
DROP TABLE #ReportStudentProgram_sp2020


END
END
GO


