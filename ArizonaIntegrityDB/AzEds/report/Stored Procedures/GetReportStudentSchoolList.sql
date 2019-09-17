/****************************************************************************
**Procedure Name:
**      [report].[GetReportStudentSchoolList]
**
**Author:
**		Pratibha Kanyar 
**
**Description:  
**	Get Student School Associations and its SubmittedBy, DOA and DOR LEA Id
**  to implement the report security
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
**	Used for all the reports' stored procs that are coming of AzEDS db
**
**Revision History:
**	Who					When		What
**	P Kanyar			10/19/2015	Initial Creation
**	P Kanyar			11/28/2015	Added Fiscal Year to the result set
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**	Amit Verma			05/17/2017  Added the fiscal year logic to check for DOR
**  Harsha Kankanala        02/06/2019  Customized the stored proc for 2020 and changed the views schema
**  Harsha Kankanala        02/06/2019  Changed the RecordOwnershipTypeId to 1 instead of 7 since this year we are combining the recordownershiptypeid 7 to Studentschool 1
**  Harsha Kankanala        05/06/2019  Changed the RecordOwnershipTypeId to 1 instead of 7 since this year we are combining the recordownershiptypeid 7 to Studentschool 1 based on fiscal Year
****************************************************************************/

CREATE PROCEDURE [report].[GetReportStudentSchoolList]  
    @SchoolsList as nvarchar(max),
	@ReportLEAId  as int,
	@ReportLEAType as int,								--Unspecified 0, DOA 1, DOR 2
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
				leadata.RecordOwnership eoro ON eoro.ResourceId = seo.SourceId
						AND eoro.FiscalYear = seo.FiscalYear
						AND eoro.RecordOwnershipTypeId = 1											--Student School
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE (eoro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND eoro.FiscalYear = @FiscalYear
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
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			ssa.FiscalYear								AS FiscalYear,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
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
					AND ssaro.Fiscalyear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1						--Student School	 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear			
		WHERE (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 				
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
				leadata.RecordOwnership eoro ON eoro.ResourceId = seo.SourceId
						AND eoro.FiscalYear = seo.FiscalYear
							AND (
						                 ( @FiscalYear < 2020 AND eoro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND eoro.RecordOwnershipTypeId = 1)
							)												--Student School
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE (eoro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND eoro.FiscalYear = @FiscalYear
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
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			ssa.FiscalYear								AS FiscalYear,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
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
					AND ssaro.Fiscalyear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1						---Student School	 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear		
					AND seo.EntryDate = ssa.EntryDate	
		WHERE (ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 				
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
				eoro.SubmittedByEducationOrganizationId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership eoro ON eoro.ResourceId = seo.SourceId
						AND eoro.RecordOwnershipTypeId = 1											--Student School
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE seo.EducationOrganizationId = @ReportLEAId 
					AND eoro.FiscalYear = @FiscalYear
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
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			ssa.FiscalYear								AS FiscalYear,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
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
					AND ssaro.Fiscalyear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1						--Student School		 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear	
		 WHERE 
			seo.EducationOrganizationId = @ReportLEAId  
					AND ( ssaro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  
							OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
							OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
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
				eoro.SubmittedByEducationOrganizationId
			FROM 
				leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN 
				leadata.RecordOwnership eoro ON eoro.ResourceId = seo.SourceId
						AND eoro.FiscalYear = seo.FiscalYear
							AND (
						                 ( @FiscalYear < 2020 AND eoro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND eoro.RecordOwnershipTypeId = 1)
							)											--Student School
					INNER JOIN 
				entity.School sch ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear	
			WHERE seo.EducationOrganizationId = @ReportLEAId 
					AND eoro.FiscalYear = @FiscalYear
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
			sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			seo.EducationOrganizationId					AS DORLocalEducationAgencyId,
			ssa.FiscalYear								AS FiscalYear,
			seo.StartDate								AS DORStartDate,
			ssa.SourceId								AS SSAResourceId,
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
					AND ssaro.Fiscalyear = ssa.FiscalYear
					AND ssaro.RecordOwnershipTypeId = 1						--Student School		 		  
				LEFT JOIN 
			cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
					AND seo.SchoolId = ssa.SchoolId
					AND seo.FiscalYear = ssa.FiscalYear	
					AND seo.EntryDate = ssa.EntryDate
		 WHERE 
			seo.EducationOrganizationId = @ReportLEAId  
					AND ( ssaro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  
							OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
							OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
					AND ssaro.FiscalYear = @FiscalYear	
		END
	END        
END

/* END [report].[GetReportStudentSchoolList] */
