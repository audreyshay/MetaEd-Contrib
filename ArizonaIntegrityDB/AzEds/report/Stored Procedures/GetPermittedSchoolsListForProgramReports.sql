/**********************************************************************************
**Procedure Name:
**      [report].[GetPermittedSchoolsListForProgramReports]
**
**Author:
**		Amit Verma
**
**Description:  
**	SGetPermittedSchoolsListForProgramReports
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
**	Amit Verma	10/14/2016	Initial Creation 
**  Amit Verma	12/16/2016	Added Alternate Education Organization Relaionship Table
**  Amit Verma	01/19/2017	Fixed the BUG - 174596- SPED72 Report- School list by 
**							DOR is incorrect
**  Amit Verma	01/19/2017	Added @ProgramTypeId parameter to filter by ProgramType
**  Amit Verma	08/08/2017	Updated the logic to extract the SchoolList faster 
**  Amit Verma	08/15/2017	Updated the logic to extract the SchoolList from 
**							StudentProgramAssociation and StudentNeed Table instead 
**							of checking StudentProgramNeedAssociation View 
**  Vinoth		03/30/2018	Fixed the Bug 205810 for schools not showing up for DOR. 
**	Pratibha K	10/02/2018	Added new AlternateEducationOrganizationRelationshipTypeId 6 
**							to get the list of schools, & to enable the LEAs to see their data (TFS-51488)
**	Pratibha K	05/16/2019	Removed the logic to bring schools from AlternateEducationOrganizationRelationship for DOA & DOR per new requirements for SPED72
**							checked for the dependencies. Only  report SPED72 uses this proc
**
***********************************************************************************/
CREATE PROCEDURE [report].[GetPermittedSchoolsListForProgramReports] 
	@LocalEducationAgencyId INT,
	@DistrictOf NVARCHAR(10),
	@FiscalYear INT,
	@PermittedEdOrgIdList NVARCHAR(MAX) = NULL,
	@ProgramTypeId INT=6
AS        
BEGIN

/* NEW REQUIREMENTS :
  DOA report should have
  DOA = @LocalEducationAgencyId and DOR = Any district OUTSIDE @LocalEducationAgencyId 
  --that means only schools that belong to @LocalEducationAgencyId. So no need of Alternate schools

  DOR report should have
  DOR = @LocalEducationAgencyId and DOA = Any district INCLUDING @LocalEducationAgencyId 
  -- that means all the schools for which @LocalEducationAgencyId is the DOR. So no need of Alternate schools   */

    CREATE TABLE #SchoolList( EdOrgId	INT NOT NULL 
	                         ,FiscalYear INT NOT NULL) 
    

	-- If LEAId passed in is also in the @PermittedEdOrgs, then add all the schools under that LEA to permittedEdOrgs 
	-- Similary add all schools under the LEA if the PermittedEdOrgIdList contains 79275 (ADE State EntityId)


	IF @PermittedEdOrgIdList IS NOT NULL 
	INSERT INTO #SchoolList SELECT DISTINCT [Token], @FiscalYear FROM [util].[Split](@PermittedEdOrgIdList, ',') 

	
	--Create Temp Table ProgramNeedAssociation
	CREATE TABLE #ProgramNeedAssociation
	             (LocalEducationAgencyId	INT,
				  SchoolId INT,
				  StudentUSI INT, 
				  BeginDate DATE, 
				  EndDate DATE )


    --Insert StudentSchool Level Information from StudentProgramAssociation and StudentNeed Tabel to ProgramNeedAssociation Table
    INSERT INTO #ProgramNeedAssociation(LocalEducationAgencyId, 
										SchoolId,
										StudentUSI, 
										BeginDate, 
										EndDate )
	SELECT DISTINCT @LocalEducationAgencyId AS LocalEducationAgencyId 
				   ,EducationOrganizationId AS SchoolId
				   ,StudentUSI
				   ,BeginDate
				   ,EndDate  
	FROM leadata.studentProgramassociation 
	WHERE ProgramTypeId = @ProgramTypeId
		  AND FiscalYear = @FiscalYear
		  AND ProgramEducationOrganizationId = @LocalEducationAgencyId
	UNION 
	SELECT DISTINCT NULL								AS LocalEducationAgencyId
				   ,ReportingEducationOrganizationID	AS SchoolId
				   ,StudentUSI
				   ,StudentNeedEntryDate				AS BeginDate
				   ,StudentNeedExitDate					AS EndDate  
	FROM leadata.StudentNeed SN
		 JOIN leadata.StudentNeedDescriptor SND
		   ON SN.StudentNeedDescriptorId = SND.StudentNeedDescriptorId
	WHERE SND.StudentNeedCategoryTypeId = 1
	      AND FiscalYear = @FiscalYear



	
	IF @DistrictOf = 'Attendance'
		BEGIN
		    IF EXISTS(SELECT 1 FROM #SchoolList WHERE EdOrgId = @LocalEducationAgencyId OR EdOrgId = 79275)
			DELETE FROM #SchoolList
			INSERT INTO #SchoolList
			SELECT DISTINCT SCH.SchoolId
						   ,SCH.FiscalYear
			FROM #ProgramNeedAssociation SPNA
				 JOIN entity.vw_School SCH WITH(NOLOCK) 
				   ON SPNA.SchoolId = SCH.SchoolId
					  AND SCH.FiscalYear = @FiscalYear
			WHERE SCH.LocalEducationAgencyId = @LocalEducationAgencyId 
		    	  AND SCH.FiscalYear = @FiscalYear
		/*UNION
			SELECT DISTINCT AEOR.DependentEducationOrganizationId AS SchoolId
						   ,AEOR.FiscalYear
			FROM #ProgramNeedAssociation SPNA 
			     JOIN entity.AlternateEducationOrganizationRelationship AEOR WITH(NOLOCK) 
				   ON SPNA.SchoolId = AEOR.DependentEducationOrganizationId
					  AND AEOR.FiscalYear = @FiscalYear
			WHERE AEOR.ParentEducationOrganizationId = @LocalEducationAgencyId 
				  AND AEOR.FiscalYear = @FiscalYear
				  AND AlternateEducationOrganizationRelationshipTypeId IN (1,4,5,6) -- JTED, PVT School, Head Start Schools, PublicOutOfState-LEA 	 */
		END
	ELSE
		BEGIN
		    IF EXISTS(SELECT 1 FROM #SchoolList WHERE EdOrgId = @LocalEducationAgencyId OR EdOrgId = 79275)
			DELETE FROM #SchoolList
			INSERT INTO #SchoolList
			SELECT DISTINCT SPNA.SchoolId
						   ,@FiscalYear AS FiscalYear
					  FROM #ProgramNeedAssociation SPNA  
					       JOIN config.FiscalYear FY WITH(NOLOCK) 
						     ON FY.FiscalYear = @FiscalYear
				           LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA WITH(NOLOCK) 
						   	 ON SPNA.SchoolId = SEOA.SchoolId
						        AND SPNA.StudentUSI = SEOA.StudentUSI 
							    AND SEOA.FiscalYear =@FiscalYear 
								/*--AND SPNA.LocalEducationAgencyId = SEOA.EducationOrganizationId */
							    AND ((SPNA.BeginDate >= SEOA.StartDate
							          AND SPNA.BeginDate <= ISNULL(SEOA.EndDate,FY.EndDate)
							         )  
							         OR 
							         SEOA.StartDate >= SPNA.BeginDate  
							         AND SEOA.StartDate <= ISNULL(SPNA.EndDate,FY.EndDate)
							        )
				WHERE SEOA.EducationOrganizationId = @LocalEducationAgencyId
						  AND SEOA.FiscalYear = @FiscalYear
				/* UNION
				SELECT DISTINCT AEOR.DependentEducationOrganizationId AS SchoolId
							   ,@FiscalYear AS FiscalYear
				FROM #ProgramNeedAssociation SPNA 
					 JOIN entity.AlternateEducationOrganizationRelationship AEOR WITH(NOLOCK) 
					   ON SPNA.SchoolId = AEOR.DependentEducationOrganizationId
						  AND AEOR.FiscalYear = @FiscalYear
					 JOIN config.FiscalYear FY WITH(NOLOCK) 
					   ON FY.FiscalYear = @FiscalYear
					 LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA WITH(NOLOCK) 
					   ON SPNA.SchoolId = SEOA.SchoolId
					      AND SPNA.StudentUSI = SEOA.StudentUSI 
					 	  AND SEOA.FiscalYear = @FiscalYear
						  /*--AND SPNA.LocalEducationAgencyId = SEOA.EducationOrganizationId */
					 	  AND ((SPNA.BeginDate >= SEOA.StartDate
					 	        AND SPNA.BeginDate <= ISNULL(SEOA.EndDate,FY.EndDate)
					 	       )  
					 	       OR 
					 	        SEOA.StartDate >= SPNA.BeginDate  
					 	        AND SEOA.StartDate <= ISNULL(SPNA.EndDate,FY.EndDate)
					 	      )
				WHERE SEOA.EducationOrganizationId = @LocalEducationAgencyId
					  AND SEOA.FiscalYear = @FiscalYear
					  AND AEOR.AlternateEducationOrganizationRelationshipTypeId IN (1,4,5,6)		-- JTED, PVET School, Head Start Schools, PublicOutOfState-LEA */
		END

	SELECT SC.SchoolId
		  ,SchoolName + ' (' + CONVERT(NVARCHAR(20),SC.SchoolId) + ')'	AS SchoolName
	FROM entity.vw_School SC WITH(NOLOCK)
		 JOIN #SchoolList SCHL 
		   ON SCHL.EdOrgId = SC.SchoolId 
			  AND SCHL.FiscalYear = SC.FiscalYear
	WHERE SC.OperationalStatusTypeId IN (1,2,3,8,9)											--Active, Added, Changed Agency, New & Reopened status 
	ORDER BY SchoolId

	DROP TABLE #SchoolList
	DROP TABLE #ProgramNeedAssociation
END