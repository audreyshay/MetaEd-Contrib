/********************************************************************************************************
**Procedure Name: 
**     [StudentAnalysis].[GetStudentIntegrityData]
** 
**Author: 
**      Pratibha Kanyar 
** 
**Description:   
**  Finds Integrity Data for the student  
**                
**Input: 
**  @permittedEdOrgs as NVARCHAR(MAX) = null, @StudentUniqueID NVARCHAR(32), @Schools NVARCHAR(MAX)
**
**Output: 
**  Student Integrity Data
** 
**Returns: 
** 
**Revision History: 
**  Who			When		What 
**  P Kanyar    02/20/2017  Initial Creation 
**  Rchinta		4/3/2017 changing the column Name to integrityStatusResult
**********************************************************************************************************/
--DECLARE	
--	@FiscalYear		 AS INT = '2017',
--	@PermittedEdOrgs AS NVARCHAR(MAX) = '4235', 
--	@StudentUniqueID AS NVARCHAR(32) = '92114871'

--declare @Schools AS	[StudentAnalysis].[EntityList] ; 
--insert into @Schools VALUES( 4970),(7318)	

CREATE PROCEDURE [StudentAnalysis].[GetStudentIntegrityData]
	@FiscalYear		 AS INT,
	@PermittedEdOrgs AS NVARCHAR(MAX), 
	@Schools		 AS [StudentAnalysis].[EntityList] READONLY ,	
	@StudentUniqueID AS NVARCHAR(32)

AS
BEGIN

SET NOCOUNT ON;

		SELECT DISTINCT 
			 v_sc.SchoolCTDS						AS 'CTDS'
			,ind.SchoolId							AS 'SchoolID'
			,pst.Description						AS 'IntegrityCategory'
			,irt.Description						AS 'IntegrityType'
			,CASE ih.IntegrityResultTypeId 
				WHEN 1 THEN 'P'
				WHEN 2 THEN 'F'
 			 END									AS 'IntegrityStatusResult'
			,ies.Description						AS 'Severity'
			,iem.ExceptionMessageCode				AS 'ErrorCode'	
			,iem.Description						AS 'ErrorDescription'
			,ind.SchoolEntryDate					AS 'EntryDate' 
		FROM 
			integrity.IntegrityHistory ih WITH (NOLOCK)				--getting all the data from IntegrityHistory because integrity runs state wide every night. when that changes this has to updated
				
			INNER JOIN integrity.IntegrityNeed ind WITH (NOLOCK) 
				ON ih.IntegrityNeedId = ind.IntegrityNeedId
					AND ih.FiscalYear = ind.FiscalYear
					AND ind.StudentUniqueId = @StudentUniqueID
					AND ind.FiscalYear = @FiscalYear

			INNER JOIN @Schools sl 
				ON sl.EdorgId = ind.SchoolId 
				 
			INNER JOIN [integrity].[IntegrityRuleType] irt WITH(NOLOCK) 
				ON ind.IntegrityRuleTypeId = irt.IntegrityRuleTypeId

			INNER JOIN entity.vw_School v_sc WITH(NOLOCK) 
				ON v_sc.SchoolId = ind.SchoolId
					AND v_sc.FiscalYear = ind.FiscalYear			-- Integ history & need table have 2016 & 2017 in prod

			INNER JOIN [leadata].[StudentSchoolAssociation] ssa WITH(NOLOCK) 
				ON ssa.FiscalYear = ind.FiscalYear
					AND ssa.StudentUSI = ind.StudentUSI
					AND ssa.SchoolId = ind.SchoolId
					AND ssa.EntryDate = ISNULL(ind.SchoolEntryDate, ssa.EntryDate)
				
			INNER JOIN [leadata].[RecordOwnership] ssaro WITH(NOLOCK) 
				ON ssaro.FiscalYear = ssa.FiscalYear
					AND ssaro.ResourceId = ssa.SourceId
					AND ssaro.RecordOwnershipTypeId = 1													 -- Student School

			INNER JOIN [StudentAnalysis].[GetLocalEducationAgencyIdList](@PermittedEdOrgs,@FiscalYear) lid 
				ON lid.LocalEducationAgencyId = ssaro.SubmittedByEducationOrganizationId				 -- it is for security, one of these can see tha data 
					OR lid.LocalEducationAgencyId = 79275												 -- School,DOA, district that submitted records or State Admin
					OR lid.LocalEducationAgencyId = v_sc.LocalEducationAgencyId
			
			INNER JOIN [StudentAnalysis].[GetEdorglist](@permittedEdOrgs,@FiscalYear) ge
				ON ge.EdOrgId = ssa.Schoolid

			INNER JOIN [process].[ProcessSubType] pst WITH(NOLOCK) 
				ON pst.ProcessSubTypeId = irt.IntegrityTypeId

			LEFT JOIN [integrity].[IntegrityException] iie WITH(NOLOCK) 
				ON iie.IntegrityHistoryId = ih.IntegrityHistoryId

			LEFT JOIN [integrity].[IntegrityExceptionMessage] iem WITH(NOLOCK) 
				ON iem.ExceptionMessageCode = iie.ExceptionMessageCode

			LEFT JOIN [integrity].[ExceptionSeverity] ies WITH(NOLOCK) 
				ON ies.ExceptionSeverityId = iie.ExceptionSeverityId
	WHERE	
		 ih.FiscalYear = @FiscalYear
			AND ih.IntegrityResultTypeId in (1,2)				-- Integrity passed and failed
	
END

/* End [StudentAnalysis].[GetStudentIntegrityData] */