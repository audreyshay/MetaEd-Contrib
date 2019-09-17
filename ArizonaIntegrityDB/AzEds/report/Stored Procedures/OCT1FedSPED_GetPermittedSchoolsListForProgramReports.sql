/**********************************************************************************
**Procedure Name:
**      [report].[OCT1FedSPED_GetPermittedSchoolsListForProgramReports]
**
**Author:
**		Amit Verma
**
**Description:  
**	GetPermittedSchoolsListForProgramReports for OCT1 FED SPED 
**            
**Input:
**	@LocalEducationAgencyId - District the report is executed for
**  @DistrictOf             - Attendance OR Residence
**	@FiscalYear	            - FiscalYear to filter upon
**  @PermittedEdOrgIdList   - Permitted EdOrg List
**	@ProgramTypeId			- ProgramTypeId to filter upon


**
**Returns:
**
**Implementation:
** 
**Revision History:
**	Who			When		What
**	Amit Verma	11/29/2016	Initial Creation 
**  Amit Verma	12/16/2016	Added Alternate Education Organization Relaionship Table
**  Amit Verma  12/21/2016  Added the Logic to check for Satelite campus only
**  Amit Verma	01/19/2017	Added @ProgramTypeId parameter to filter by ProgramType
**	Pratibha K	10/02/2018	Added new AlternateEducationOrganizationRelationshipTypeId 6 
**							to get the list of schools, & to enable the LEAs to see their data (TFS-51488)
**  Sucharita   02/19/2019  Commented the logic which checks if student has any SPED program participation in DOR
**                          Also commented the logic for getting AlternateEducationOrganizationRelationship for the DOR
**	Pratibha K	05/06/2019	Commented/ removed the logic to pull alternate schools for DOA since the new requirement is to  
**							not show schools of other districts inside DOA report
**
***************************************************************************************************************************/
--declare
--	@LocalEducationAgencyId INT= 4243,	@DistrictOf NVARCHAR(10)= N'Attendance',	@FiscalYear INT = 2019, -- RESIDANCE
--	@PermittedEdOrgIdList NVARCHAR(MAX) = NULL,	@ProgramTypeId INT= 6

CREATE PROCEDURE [report].[OCT1FedSPED_GetPermittedSchoolsListForProgramReports] 
	@LocalEducationAgencyId INT,
	@DistrictOf NVARCHAR(10),
	@FiscalYear INT,
	@PermittedEdOrgIdList NVARCHAR(MAX) = NULL,
	@ProgramTypeId INT

AS        
BEGIN
 
 	/*
		The new requirement is as follows - 05/06/2019
		If for a student,
		1.DOA = DOR = Scottsdale , then he should show up on Scottsdale DOR report.
		2.DOA = Scottsdale , DOR = Phoenix, then he should show up on Scottsdale DOA report with Phoenix as DOR
		3.DOA = Ace pvt, DOR = Scottsdale, then he should show up on Scottsdale DOR report 

		ie., DOA report should have
		DOA = @LocalEducationAgencyId and DOR = Any district OUTSIDE @LocalEducationAgencyId

		DOR report should have
		DOR = @LocalEducationAgencyId and DOA = Any district INCLUDING @LocalEducationAgencyId
	*/
  
    
	CREATE TABLE #SchoolList( EdOrgId	INT NOT NULL 
	                         ,FiscalYear INT NOT NULL) 

	-- If LEAId passed in is also in the @PermittedEdOrgs, then add all the schools under that LEA to permittedEdOrgs 
	-- Similary add all schools under the LEA if the PermittedEdOrgIdList contains 79275 (ADE State EntityId)


	IF @PermittedEdOrgIdList IS NOT NULL 
	INSERT INTO #SchoolList SELECT DISTINCT [Token], @FiscalYear FROM [util].[Split](@PermittedEdOrgIdList, ',') 	

	CREATE TABLE #ProgramNeed (NeedDescriptorId	INT)

	INSERT INTO #ProgramNeed
	SELECT DISTINCT NeedDescriptorId
	FROM entity.ProgramNeedCodeMapping
	WHERE FiscalYear = @FiscalYear
	      AND ProgramTypeId = @ProgramTypeId


	IF @DistrictOf = 'Attendance'
		BEGIN
		    IF EXISTS(SELECT 1 FROM #SchoolList WHERE EdOrgId = @LocalEducationAgencyId OR EdOrgId = 79275)
			DELETE FROM #SchoolList
			INSERT INTO #SchoolList
			SELECT DISTINCT SCH.SchoolId
						   ,SCH.FiscalYear
			FROM oct1.StudentProgramNeedAssociation SPNA WITH(NOLOCK) 
				 JOIN entity.vw_School SCH WITH(NOLOCK) 
				   ON SPNA.SchoolId = SCH.SchoolId
					  AND SPNA.FiscalYear = SCH.FiscalYear
			WHERE SCH.LocalEducationAgencyId = @LocalEducationAgencyId 
				  AND SCH.FiscalYear = @FiscalYear
				  AND (SPNA.ProgramTypeId = @ProgramTypeId
				      OR (SPNA.NeedDescriptorId IN (SELECT NeedDescriptorId FROM #ProgramNeed)))
			/*UNION
			SELECT DISTINCT AEOR.DependentEducationOrganizationId AS SchoolId
						   ,AEOR.FiscalYear
			FROM oct1.StudentProgramNeedAssociation SPNA WITH(NOLOCK) 
			     JOIN entity.AlternateEducationOrganizationRelationship AEOR WITH(NOLOCK) 
				   ON SPNA.SchoolId = AEOR.DependentEducationOrganizationId
					  AND SPNA.FiscalYear = AEOR.FiscalYear
			WHERE AEOR.ParentEducationOrganizationId = @LocalEducationAgencyId 
				  AND AEOR.FiscalYear = @FiscalYear
				  AND AlternateEducationOrganizationRelationshipTypeId IN (1,4,5,6) -- JTED, PVT School, Head Start Schools, PublicOutOfState-LEA
				   AND (SPNA.ProgramTypeId = @ProgramTypeId
				        OR (SPNA.NeedDescriptorId IN (SELECT NeedDescriptorId FROM #ProgramNeed))) */
		END
	ELSE
		BEGIN
		    IF EXISTS(SELECT 1 FROM #SchoolList WHERE EdOrgId = @LocalEducationAgencyId OR EdOrgId = 79275)
			DELETE FROM #SchoolList
			INSERT INTO #SchoolList
			SELECT DISTINCT SPNA.SchoolId
						   ,SPNA.FiscalYear
					  FROM oct1.[StudentProgramNeedAssociation] SPNA WITH(NOLOCK) 
					       JOIN config.FiscalYear FY WITH(NOLOCK) 
						     ON SPNA.FiscalYear = FY.FiscalYear
				           LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA WITH(NOLOCK) 
						   	 ON SPNA.SchoolId = SEOA.SchoolId
						        AND SPNA.StudentUSI = SEOA.StudentUSI 
							    AND SPNA.FiscalYear = SEOA.FiscalYear 
								/*--AND SPNA.ProgramEducationOrganizationId = SEOA.EducationOrganizationId
							    --AND ((SPNA.ProgramBeginDate >= SEOA.StartDate
							    --      AND SPNA.ProgramBeginDate <= ISNULL(SEOA.EndDate,FY.EndDate)
							    --     )  
							    --     OR 
							    --     SEOA.StartDate >= SPNA.ProgramBeginDate  
							    --     AND SEOA.StartDate <= ISNULL(SPNA.ProgramEndDate,FY.EndDate)
							    --    ) */
				WHERE SEOA.EducationOrganizationId = @LocalEducationAgencyId
						  AND SPNA.FiscalYear = @FiscalYear
						   AND (SPNA.ProgramTypeId = @ProgramTypeId
								OR (SPNA.NeedDescriptorId IN (SELECT NeedDescriptorId FROM #ProgramNeed)))
			/*	--UNION
				--SELECT DISTINCT AEOR.DependentEducationOrganizationId AS SchoolId
				--			   ,SPNA.FiscalYear
				--FROM oct1.StudentProgramNeedAssociation SPNA WITH(NOLOCK)
				--	 JOIN entity.AlternateEducationOrganizationRelationship AEOR WITH(NOLOCK) 
				--	   ON SPNA.SchoolId = AEOR.DependentEducationOrganizationId
				--		  AND SPNA.FiscalYear = AEOR.FiscalYear
				--	 JOIN config.FiscalYear FY WITH(NOLOCK) 
				--	   ON SPNA.FiscalYear = FY.FiscalYear
				--	 LEFT JOIN leadata.StudentEducationOrganizationAssociation SEOA WITH(NOLOCK) 
				--	   ON SPNA.SchoolId = SEOA.SchoolId
				--	      AND SPNA.StudentUSI = SEOA.StudentUSI 
				--	 	  AND SPNA.FiscalYear = SEOA.FiscalYear 
				--		  AND SPNA.ProgramEducationOrganizationId = SEOA.EducationOrganizationId
				--	 	  AND ((SPNA.ProgramBeginDate >= SEOA.StartDate
				--	 	        AND SPNA.ProgramBeginDate <= ISNULL(SEOA.EndDate,FY.EndDate)
				--	 	       )  
				--	 	       OR 
				--	 	        SEOA.StartDate >= SPNA.ProgramBeginDate  
				--	 	        AND SEOA.StartDate <= ISNULL(SPNA.ProgramEndDate,FY.EndDate)
				--	 	      )
				--WHERE SEOA.EducationOrganizationId = @LocalEducationAgencyId
				--	  AND SEOA.FiscalYear = @FiscalYear
				--	  AND AEOR.AlternateEducationOrganizationRelationshipTypeId IN (1,4,5,6) -- JTED, PVT School, Head Start Schools, PublicOutOfState-LEA
				--	   AND (SPNA.ProgramTypeId = @ProgramTypeId
				--			OR (SPNA.NeedDescriptorId IN (SELECT NeedDescriptorId FROM #ProgramNeed))) */
		END

	SELECT SC.SchoolId
		  ,SchoolName + ' (' + CONVERT(NVARCHAR(20),SC.SchoolId) + ')'	AS SchoolName
	FROM entity.vw_School SC WITH(NOLOCK)
		 JOIN #SchoolList SCHL 
		   ON SCHL.EdOrgId = SC.SchoolId 
			  AND SCHL.FiscalYear = SC.FiscalYear
	WHERE SC.OperationalStatusTypeId IN (1,2,3,8,9)					--Active, Added, Changed Agency, New & Reopened status 
	ORDER BY SchoolId

	DROP TABLE #SchoolList
	DROP TABLE #ProgramNeed

END