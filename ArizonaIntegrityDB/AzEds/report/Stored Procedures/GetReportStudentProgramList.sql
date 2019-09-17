/**********************************************************************************
**Procedure Name:
**      [report].[GetReportStudentProgramList]
**
**Author:
**		Pratibha Kanyar 
**
**Description:  
**	Get Student Program Associations and its SubmittedBy, DOA and DOR LEA Id
**  to implement report FERPA security
**            
**Input:
**	@ReportLEAId   - LEAId the report is executed for
**	@ReportLEAType - Unspecified 0, DOA 1, DOR 2 report types
**	@SchoolsList   - School(s) the report is executed for
**	@FiscalYear	   - FiscalYear to filter upon
**
**Returns:
**
**Implementation:
**	Used by all report stored procs in AzEDS db
**
**Revision History:
**	Who					When		What
**	P Kanyar			10/19/2015	Initial Creation
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**	Amit Verma			05/17/2017  Added the fiscal year logic to check for DOR
**	Harsha Kankanala	05/06/2019  Changed the stored proc where Recordownership changed from DOR 7 to Student school Association 1	
***********************************************************************************/

CREATE PROCEDURE [report].[GetReportStudentProgramList]  
    @SchoolsList as nvarchar(max),
	@ReportLEAId  as int,
	@ReportLEAType as int,				--Unspecified 0, DOA 1, DOR 2
	@FiscalYear as int 

AS
BEGIN 

    SET NOCOUNT ON;
	  	  
	DECLARE @Schools TABLE ([SchoolId] int)
	INSERT INTO @Schools SELECT DISTINCT [Token] from [util].[Split](@SchoolsList, ',' ) 


IF @ReportLEAType IN (0, 1)
	BEGIN
	    IF @FiscalYear < 2018
		BEGIN
		--cte to bring StudentEdOrgs submitted by the LEA requesting the report, so we can					
		--join with that below even though the student ed org dates are outside the student school		
		--association date ranges
		;WITH cteStudentEducationOrganization AS
		(
			SELECT 
				seo.StudentUSI, 
				seo.EducationOrganizationId,
				seo.SchoolId,
				seo.StartDate,
				seo.FiscalYear,
				seo.SourceId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership seoro ON seoro.ResourceId = seo.SourceId
						AND seoro.FiscalYear = seo.FiscalYear
						AND seoro.RecordOwnershipTypeId = 7											--student DOR
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE (seoro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
					AND seoro.FiscalYear = @FiscalYear
		) 

		SELECT DISTINCT
			s.StudentUSI, 
			s.StudentUniqueId,
			s.FirstName,
			s.LastSurname,
			s.MiddleName,
			s.BirthDate,	
			ssa.SchoolId, 
	 		ssa.EntryDate, 
			ssa.EntryGradeLevelDescriptorId,
			ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
			sparo.SubmittedByEducationOrganizationId	AS SPASubmittedByEducationOrganizationId,
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
			spa.SourceId								AS SPAResourceId,
			seo.SourceId								AS SEOResourceId
		FROM 
			leadata.StudentSchoolAssociation ssa
				INNER JOIN 
			entity.School sch ON sch.SchoolId = ssa.SchoolId
					AND sch.FiscalYear = ssa.FiscalYear
				INNER JOIN 
			leadata.Student s ON s.StudentUSI = ssa.StudentUSI
				INNER JOIN 
			@Schools scs ON scs.SchoolId = ssa.SchoolId
				INNER JOIN 
			leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
					AND ssaro.FiscalYear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1											-- student school		
				INNER JOIN 
			leadata.StudentProgramAssociation spa ON spa.StudentUSI = ssa.StudentUSI
					AND spa.EducationOrganizationId = ssa.SchoolId
					AND spa.FiscalYear = ssa.FiscalYear
				INNER JOIN
			leadata.RecordOwnership sparo ON sparo.ResourceId = spa.SourceId
					AND sparo.FiscalYear = spa.FiscalYear
					AND sparo.RecordOwnershipTypeId = 4											-- Student Program  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear
		 WHERE ((ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 
					AND	sparo.SubmittedByEducationOrganizationId = @ReportLEAId	)			
					OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND ssaro.FiscalYear = @FiscalYear
		END	
		ELSE 
		BEGIN
		--cte to bring StudentEdOrgs submitted by the LEA requesting the report, so we can					
		--join with that below even though the student ed org dates are outside the student school		
		--association date ranges
		;WITH cteStudentEducationOrganization AS
		(
			SELECT 
				seo.StudentUSI, 
				seo.EducationOrganizationId,
				seo.SchoolId,
				seo.EntryDate,
				seo.StartDate,
				seo.FiscalYear,
				seo.SourceId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership seoro ON seoro.ResourceId = seo.SourceId
						AND seoro.FiscalYear = seo.FiscalYear
							AND (
						                 ( @FiscalYear < 2020 AND seoro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND seoro.RecordOwnershipTypeId = 1)
							)										--student DOR
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE (seoro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
					AND seoro.FiscalYear = @FiscalYear
		) 

		SELECT DISTINCT
			s.StudentUSI, 
			s.StudentUniqueId,
			s.FirstName,
			s.LastSurname,
			s.MiddleName,
			s.BirthDate,	
			ssa.SchoolId, 
	 		ssa.EntryDate, 
			ssa.EntryGradeLevelDescriptorId,
			ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
			sparo.SubmittedByEducationOrganizationId	AS SPASubmittedByEducationOrganizationId,
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
			spa.SourceId								AS SPAResourceId,
			seo.SourceId								AS SEOResourceId
		FROM 
			leadata.StudentSchoolAssociation ssa
				INNER JOIN 
			entity.School sch ON sch.SchoolId = ssa.SchoolId
					AND sch.FiscalYear = ssa.FiscalYear
				INNER JOIN 
			leadata.Student s ON s.StudentUSI = ssa.StudentUSI
				INNER JOIN 
			@Schools scs ON scs.SchoolId = ssa.SchoolId
				INNER JOIN 
			leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
					AND ssaro.FiscalYear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1											-- student school		
				INNER JOIN 
			leadata.StudentProgramAssociation spa ON spa.StudentUSI = ssa.StudentUSI
					AND spa.EducationOrganizationId = ssa.SchoolId
					AND spa.FiscalYear = ssa.FiscalYear
				INNER JOIN
			leadata.RecordOwnership sparo ON sparo.ResourceId = spa.SourceId
					AND sparo.FiscalYear = spa.FiscalYear
					AND sparo.RecordOwnershipTypeId = 4											-- Student Program  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear
					AND seo.EntryDate = ssa.EntryDate
		 WHERE ((ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 
					AND	sparo.SubmittedByEducationOrganizationId = @ReportLEAId	)			
					OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND ssaro.FiscalYear = @FiscalYear
		END		    
	END
ELSE
IF @ReportLEAType = 2	
	BEGIN
	    IF @FiscalYear < 2018
		BEGIN
		;WITH cteStudentEducationOrganization AS
		(
			SELECT 
				seo.StudentUSI, 
				seo.EducationOrganizationId,
				seo.SchoolId,
				seo.StartDate,
				seo.FiscalYear,
				seo.SourceId,
				seoro.SubmittedByEducationOrganizationId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership seoro ON seoro.ResourceId = seo.SourceId
						AND seoro.FiscalYear = seo.FiscalYear
						AND seoro.RecordOwnershipTypeId = 7										--student DOR
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE seo.EducationOrganizationId = @ReportLEAId 
					AND seoro.FiscalYear = @FiscalYear
		)	 

		SELECT DISTINCT
			s.StudentUSI, 
			s.StudentUniqueId,
			s.FirstName,
			s.LastSurname,
			s.MiddleName,
			s.BirthDate,	
			ssa.SchoolId, 
	 		ssa.EntryDate, 
			ssa.EntryGradeLevelDescriptorId,
			ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
			sparo.SubmittedByEducationOrganizationId	AS SPASubmittedByEducationOrganizationId,
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
			spa.SourceId								AS SPAResourceId,
			seo.SourceId								AS SEOResourceId
		FROM 
			leadata.StudentSchoolAssociation ssa
				INNER JOIN 
			entity.School sch ON sch.SchoolId = ssa.SchoolId
					AND sch.FiscalYear = ssa.FiscalYear
				INNER JOIN 
			leadata.Student s ON s.StudentUSI = ssa.StudentUSI
				INNER JOIN 
			@Schools scs ON scs.SchoolId = ssa.SchoolId
				INNER JOIN 
			leadata.RecordOwnership ssaro ON ssa.SourceId = ssaro.ResourceId
					AND ssaro.FiscalYear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1										-- student school	
				INNER JOIN 
			leadata.StudentProgramAssociation spa ON spa.StudentUSI = ssa.StudentUSI
					AND spa.EducationOrganizationId = ssa.SchoolId
					AND spa.FiscalYear = ssa.FiscalYear
				INNER JOIN
			leadata.RecordOwnership sparo ON sparo.ResourceId = spa.SourceId
					AND sparo.FiscalYear = spa.FiscalYear
					AND sparo.RecordOwnershipTypeId = 4										-- Student Program  	 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear
		WHERE seo.EducationOrganizationId = @ReportLEAId  
				AND ( ssaro.SubmittedByEducationOrganizationId = @ReportLEAId  OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ( sparo.SubmittedByEducationOrganizationId = @ReportLEAId  OR sparo.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR sparo.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ssaro.FiscalYear = @FiscalYear	
		END
		ELSE 
		BEGIN
		;WITH cteStudentEducationOrganization AS
		(
			SELECT 
				seo.StudentUSI, 
				seo.EducationOrganizationId,
				seo.SchoolId,
				seo.EntryDate,
				seo.StartDate,
				seo.FiscalYear,
				seo.SourceId,
				seoro.SubmittedByEducationOrganizationId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership seoro ON seoro.ResourceId = seo.SourceId
						AND seoro.FiscalYear = seo.FiscalYear
						AND (
						                 ( @FiscalYear < 2020 AND seoro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND seoro.RecordOwnershipTypeId = 1)
							)										--student DOR
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE seo.EducationOrganizationId = @ReportLEAId 
					AND seoro.FiscalYear = @FiscalYear
		)	 

		SELECT DISTINCT
			s.StudentUSI, 
			s.StudentUniqueId,
			s.FirstName,
			s.LastSurname,
			s.MiddleName,
			s.BirthDate,	
			ssa.SchoolId, 
	 		ssa.EntryDate, 
			ssa.EntryGradeLevelDescriptorId,
			ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
			sparo.SubmittedByEducationOrganizationId	AS SPASubmittedByEducationOrganizationId,
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
			spa.SourceId								AS SPAResourceId,
			seo.SourceId								AS SEOResourceId
		FROM 
			leadata.StudentSchoolAssociation ssa
				INNER JOIN 
			entity.School sch ON sch.SchoolId = ssa.SchoolId
					AND sch.FiscalYear = ssa.FiscalYear
				INNER JOIN 
			leadata.Student s ON s.StudentUSI = ssa.StudentUSI
				INNER JOIN 
			@Schools scs ON scs.SchoolId = ssa.SchoolId
				INNER JOIN 
			leadata.RecordOwnership ssaro ON ssa.SourceId = ssaro.ResourceId
					AND ssaro.FiscalYear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1										-- student school	
				INNER JOIN 
			leadata.StudentProgramAssociation spa ON spa.StudentUSI = ssa.StudentUSI
					AND spa.EducationOrganizationId = ssa.SchoolId
					AND spa.FiscalYear = ssa.FiscalYear
				INNER JOIN
			leadata.RecordOwnership sparo ON sparo.ResourceId = spa.SourceId
					AND sparo.FiscalYear = spa.FiscalYear
					AND sparo.RecordOwnershipTypeId = 4										-- Student Program  	 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear
					AND seo.EntryDate = ssa.EntryDate
		WHERE seo.EducationOrganizationId = @ReportLEAId  
				AND ( ssaro.SubmittedByEducationOrganizationId = @ReportLEAId  OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ( sparo.SubmittedByEducationOrganizationId = @ReportLEAId  OR sparo.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR sparo.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ssaro.FiscalYear = @FiscalYear	
		END
	END        
END
