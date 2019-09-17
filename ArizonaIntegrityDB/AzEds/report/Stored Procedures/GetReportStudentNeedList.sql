/*************************************************************************************************************
**Procedure Name:
**      [report].[GetReportStudentNeedList]
**
**Author:
**      Pratibha kanyar
**
**Description:  
**	Get Student School Associations and its SubmittedBy, DOA and DOR LEA Id,
**	and Student needs and its SubmittedBy, DOA and DOR LEA Id
**               
**Input:
**	@ReportLEAId   - LEAId the report is executed for
**	@ReportLEAType - Unspecified 0, DOA 1, DOR 2
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
**	P Kanyar			10/16/2015	Initial Creation
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**	Amit Verma			05/17/2017  Added the fiscal year logic to check for DOR	
**	Harsha Kankanala	03/04/2019  Changed the stored proc where Recordownership changed from DOR 7 to Student school Association 1	
************************************************************************************************************/

CREATE PROCEDURE [report].[GetReportStudentNeedList]
	@SchoolsList as nvarchar(max),
	@ReportLEAId  as int,
	@ReportLEAType as int,						--Unspecified 0, DOA 1, DOR 2
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
			SELECT seo.StudentUSI, 
				   seo.EducationOrganizationId,
				   seo.SchoolId,
				   seo.StartDate,
				   seo.FiscalYear,
				   seo.SourceId
			FROM leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN leadata.RecordOwnership EdOrgro
						ON EdOrgro.ResourceId = seo.SourceId
						AND EdOrgro.FiscalYear = seo.FiscalYear
						AND EdOrgro.RecordOwnershipTypeId = 7					--student DOR
					INNER JOIN entity.School sch
						ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear
			WHERE (EdOrgro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND EdOrgro.FiscalYear = @FiscalYear
		) 

		SELECT distinct 
			   s.StudentUSI, 
			   s.StudentUniqueId,
			   s.FirstName,
			   s.LastSurname,
			   s.MiddleName,
			   ssa.SchoolId, 
	 		   ssa.EntryDate, 
			   ssa.EntryGradeLevelDescriptorId,
			   ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId,
   			   snro.SubmittedByEducationOrganizationId	AS NeedSubmittedByEducationOrganizationId, 
			   sch.LocalEducationAgencyId				AS DOALocalEducationAgencyId, 
			   seo.EducationOrganizationId				AS DORLocalEducationAgencyId, 
			   seo.StartDate							AS DORStartDate,								
			   sn.StudentNeedEntryDate,
			   sn.StudentNeedExitDate,
			   sn.StudentNeedDescriptorId,									
			   ssa.SourceId								AS SSAResourceId,
			   sn.SourceId								AS NeedResourceId,
			   seo.SourceId								AS SEOResourceId
		  FROM  
			   leadata.StudentSchoolAssociation ssa  
					INNER JOIN
			   leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
						AND ssaro.Fiscalyear = ssa.FiscalYear
						AND ssaro.RecordOwnershipTypeId = 1						--student school
					INNER JOIN 
			   @Schools scs ON scs.SchoolId = ssa.SchoolId
					INNER JOIN 
			   leadata.StudentNeed sn ON sn.StudentUSI = ssa.StudentUSI	
						AND sn.ReportingEducationOrganizationID	= ssa.SchoolId	
						AND sn.FiscalYear = ssa.FiscalYear		
					INNER JOIN 
			   entity.School sch ON sch.SchoolId = ssa.SchoolId 
						AND sch.FiscalYear = ssa.FiscalYear
					INNER JOIN 
			   leadata.Student s ON s.StudentUSI = ssa.StudentUSI
					INNER JOIN 
			   leadata.RecordOwnership snro ON sn.SourceId = snro.ResourceId
						AND snro.FiscalYear = sn.FiscalYear
						AND snro.RecordOwnershipTypeId = 3						--student need
					LEFT JOIN 
			   cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
						AND seo.SchoolId = ssa.SchoolId
						AND seo.FiscalYear = ssa.FiscalYear	
		WHERE ((snro.SubmittedByEducationOrganizationId = @ReportLEAId 
					AND ssaro.SubmittedByEducationOrganizationId = @ReportLEAId)		
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
			SELECT seo.StudentUSI, 
				   seo.EducationOrganizationId,
				   seo.SchoolId,
				   seo.EntryDate,
				   seo.StartDate,
				   seo.FiscalYear,
				   seo.SourceId
			FROM leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN leadata.RecordOwnership EdOrgro
						ON EdOrgro.ResourceId = seo.SourceId
						AND EdOrgro.FiscalYear = seo.FiscalYear
						AND (
						                 ( @FiscalYear < 2020 AND EdOrgro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND EdOrgro.RecordOwnershipTypeId = 1)
							)
					INNER JOIN entity.School sch
						ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear
			WHERE (EdOrgro.SubmittedByEducationOrganizationId = @ReportLEAId 
						OR sch.LocalEducationAgencyId = @ReportLEAId )
						AND EdOrgro.FiscalYear = @FiscalYear
		) 

		SELECT distinct 
			   s.StudentUSI, 
			   s.StudentUniqueId,
			   s.FirstName,
			   s.LastSurname,
			   s.MiddleName,
			   ssa.SchoolId, 
	 		   ssa.EntryDate, 
			   ssa.EntryGradeLevelDescriptorId,
			   ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId,
   			   snro.SubmittedByEducationOrganizationId	AS NeedSubmittedByEducationOrganizationId, 
			   sch.LocalEducationAgencyId				AS DOALocalEducationAgencyId, 
			   seo.EducationOrganizationId				AS DORLocalEducationAgencyId, 
			   seo.StartDate							AS DORStartDate,								
			   sn.StudentNeedEntryDate,
			   sn.StudentNeedExitDate,
			   sn.StudentNeedDescriptorId,									
			   ssa.SourceId								AS SSAResourceId,
			   sn.SourceId								AS NeedResourceId,
			   seo.SourceId								AS SEOResourceId
		  FROM  
			   leadata.StudentSchoolAssociation ssa  
					INNER JOIN
			   leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
						AND ssaro.Fiscalyear = ssa.FiscalYear
						AND ssaro.RecordOwnershipTypeId = 1						--student school
					INNER JOIN 
			   @Schools scs ON scs.SchoolId = ssa.SchoolId
					INNER JOIN 
			   leadata.StudentNeed sn ON sn.StudentUSI = ssa.StudentUSI	
						AND sn.ReportingEducationOrganizationID	= ssa.SchoolId	
						AND sn.FiscalYear = ssa.FiscalYear		
					INNER JOIN 
			   entity.School sch ON sch.SchoolId = ssa.SchoolId 
						AND sch.FiscalYear = ssa.FiscalYear
					INNER JOIN 
			   leadata.Student s ON s.StudentUSI = ssa.StudentUSI
					INNER JOIN 
			   leadata.RecordOwnership snro ON sn.SourceId = snro.ResourceId
						AND snro.FiscalYear = sn.FiscalYear
						AND snro.RecordOwnershipTypeId = 3						--student need
					LEFT JOIN 
			   cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
						AND seo.SchoolId = ssa.SchoolId
						AND seo.FiscalYear = ssa.FiscalYear	
						AND seo.EntryDate = ssa.EntryDate
		WHERE ((snro.SubmittedByEducationOrganizationId = @ReportLEAId 
					AND ssaro.SubmittedByEducationOrganizationId = @ReportLEAId)		
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
			SELECT seo.StudentUSI, 
				   seo.EducationOrganizationId,
				   seo.SchoolId,
				   seo.StartDate,
				   seo.FiscalYear,
				   seo.SourceId,
				   EdOrgro.SubmittedByEducationOrganizationId			
			FROM leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN leadata.RecordOwnership EdOrgro
						ON EdOrgro.ResourceId = seo.SourceId
						AND EdOrgro.FiscalYear = seo.FiscalYear
						AND EdOrgro.RecordOwnershipTypeId = 7					--student DOR
					INNER JOIN entity.School sch
						ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear
			WHERE seo.EducationOrganizationId = @ReportLEAId 
		) 

		SELECT distinct
			   s.StudentUSI, 
			   s.StudentUniqueId,
			   s.FirstName,
			   s.LastSurname,
			   s.MiddleName,
			   ssa.SchoolId, 
	 		   ssa.EntryDate, 
			   ssa.EntryGradeLevelDescriptorId,
			   ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId,
   			   snro.SubmittedByEducationOrganizationId	AS NeedSubmittedByEducationOrganizationId, 
			   sch.LocalEducationAgencyId				AS DOALocalEducationAgencyId, 
			   seo.EducationOrganizationId				AS DORLocalEducationAgencyId, 
			   seo.StartDate							AS DORStartDate,								
			   sn.StudentNeedEntryDate,
			   sn.StudentNeedExitDate,
			   sn.StudentNeedDescriptorId,									
			   ssa.SourceId								AS SSAResourceId,
			   sn.SourceId								AS NeedResourceId,
			   seo.SourceId								AS SEOResourceId
		  FROM  
			   leadata.StudentSchoolAssociation ssa  
					INNER JOIN
			   leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
						AND ssaro.Fiscalyear = ssa.FiscalYear
						AND ssaro.RecordOwnershipTypeId = 1						--student school
					INNER JOIN 
			   @Schools scs ON scs.SchoolId = ssa.SchoolId
					INNER JOIN 
			   leadata.StudentNeed sn ON sn.StudentUSI = ssa.StudentUSI	
						AND sn.ReportingEducationOrganizationID	= ssa.SchoolId	
						AND sn.FiscalYear = ssa.FiscalYear		
					INNER JOIN 
			   entity.School sch ON sch.SchoolId = ssa.SchoolId 
						AND sch.FiscalYear = ssa.FiscalYear
					INNER JOIN 
			   leadata.Student s ON s.StudentUSI = ssa.StudentUSI
					INNER JOIN 
			   leadata.RecordOwnership snro ON sn.SourceId = snro.ResourceId
						AND snro.FiscalYear = sn.FiscalYear
						AND snro.RecordOwnershipTypeId = 3						--student need
					LEFT JOIN 
			   cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
						AND seo.SchoolId = ssa.SchoolId
						AND seo.FiscalYear = ssa.FiscalYear	
		WHERE seo.EducationOrganizationId = @ReportLEAId  
				AND ( ssaro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ( snro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  OR snro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR snro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ssaro.FiscalYear = @FiscalYear
		END
		ELSE 
		BEGIN
		;WITH cteStudentEducationOrganization AS
		(
			SELECT seo.StudentUSI, 
				   seo.EducationOrganizationId,
				   seo.SchoolId,
				   seo.EntryDate,
				   seo.StartDate,
				   seo.FiscalYear,
				   seo.SourceId,
				   EdOrgro.SubmittedByEducationOrganizationId			
			FROM leadata.StudentSchoolAssociationLocalEducationAgency seo
					INNER JOIN leadata.RecordOwnership EdOrgro
						ON EdOrgro.ResourceId = seo.SourceId
						AND EdOrgro.FiscalYear = seo.FiscalYear
						AND (
						                 ( @FiscalYear < 2020 AND EdOrgro.RecordOwnershipTypeId = 7)			--student DOR
										  OR (@FiscalYear >= 2020 AND EdOrgro.RecordOwnershipTypeId = 1)
							)					--student DOR
					INNER JOIN entity.School sch
						ON sch.SchoolId = seo.SchoolId
						AND sch.FiscalYear = seo.FiscalYear
			WHERE seo.EducationOrganizationId = @ReportLEAId 
		) 

		SELECT distinct
			   s.StudentUSI, 
			   s.StudentUniqueId,
			   s.FirstName,
			   s.LastSurname,
			   s.MiddleName,
			   ssa.SchoolId, 
	 		   ssa.EntryDate, 
			   ssa.EntryGradeLevelDescriptorId,
			   ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId,
   			   snro.SubmittedByEducationOrganizationId	AS NeedSubmittedByEducationOrganizationId, 
			   sch.LocalEducationAgencyId				AS DOALocalEducationAgencyId, 
			   seo.EducationOrganizationId				AS DORLocalEducationAgencyId, 
			   seo.StartDate							AS DORStartDate,								
			   sn.StudentNeedEntryDate,
			   sn.StudentNeedExitDate,
			   sn.StudentNeedDescriptorId,									
			   ssa.SourceId								AS SSAResourceId,
			   sn.SourceId								AS NeedResourceId,
			   seo.SourceId								AS SEOResourceId
		  FROM  
			   leadata.StudentSchoolAssociation ssa  
					INNER JOIN
			   leadata.RecordOwnership ssaro ON ssaro.ResourceId = ssa.SourceId
						AND ssaro.Fiscalyear = ssa.FiscalYear
						AND ssaro.RecordOwnershipTypeId = 1						--student school
					INNER JOIN 
			   @Schools scs ON scs.SchoolId = ssa.SchoolId
					INNER JOIN 
			   leadata.StudentNeed sn ON sn.StudentUSI = ssa.StudentUSI	
						AND sn.ReportingEducationOrganizationID	= ssa.SchoolId	
						AND sn.FiscalYear = ssa.FiscalYear		
					INNER JOIN 
			   entity.School sch ON sch.SchoolId = ssa.SchoolId 
						AND sch.FiscalYear = ssa.FiscalYear
					INNER JOIN 
			   leadata.Student s ON s.StudentUSI = ssa.StudentUSI
					INNER JOIN 
			   leadata.RecordOwnership snro ON sn.SourceId = snro.ResourceId
						AND snro.FiscalYear = sn.FiscalYear
						AND snro.RecordOwnershipTypeId = 3						--student need
					LEFT JOIN 
			   cteStudentEducationOrganization seo ON seo.StudentUSI = ssa.StudentUSI
						AND seo.SchoolId = ssa.SchoolId
						AND seo.FiscalYear = ssa.FiscalYear	
						AND seo.EntryDate = ssa.EntryDate
		WHERE seo.EducationOrganizationId = @ReportLEAId  
				AND ( ssaro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR ssaro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ( snro.SubmittedByEducationOrganizationId = seo.EducationOrganizationId  OR snro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
						OR snro.SubmittedByEducationOrganizationId = seo.SubmittedByEducationOrganizationId )
				AND ssaro.FiscalYear = @FiscalYear
		END
	END  	       
END


/* END report.GetReportStudentNeedList */
