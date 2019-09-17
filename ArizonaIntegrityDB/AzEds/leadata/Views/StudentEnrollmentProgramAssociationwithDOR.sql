/******************************************************************************************
** Script Name:[leadata].[StudentEnrollmentProgramAssociationwithDOR]
**
** Author: P Kanyar
**
** Description: View that establishes a relationship between ProgramAssociation and SchoolAssociation 
** and EdOrgAssociation of a student at a school in a given fiscalyear based on the time span of the  
** program , enrollment and DOR association
**
** Revision History: Created - P Kanyar - 12/06/2016
** P Kanyar - 05/14/2019	Added EntryDate to the StudentSchoolAssociationLocalEducationAgency join 
**							removed hardcoding for FY end date
**
********************************************************************************************/

	CREATE VIEW [leadata].[StudentEnrollmentProgramAssociationwithDOR]
	AS
	SELECT DISTINCT FiscalYear,
					StudentUSI,
					ProgramTypeId,
					ProgramName,
					ProgramEducationOrganizationId,
					ProgramBeginDate,
					SchoolId,
					EnrollmentEntryDate,
					EnrollmentExitWithdrawDate,
					EntryTypeDescriptorId,
				    ExitWithdrawTypeDescriptorId,
				    TrackEducationOrganizationId,
				    EntryGradeLevelDescriptorId,
					MembershipTypeDescriptorId,
					TrackNumber,
					MainSPEDSchool,
					DOR
	FROM (
			SELECT SPA.FiscalYear, 
				   SPA.StudentUSI, 
				   SPA.ProgramTypeId, 
				   SPA.ProgramName, 
				   SPA.ProgramEducationOrganizationId, 
				   SPA.BeginDate						AS ProgramBeginDate,
				   SPA.EducationOrganizationId			AS SchoolId, 
				   SSA.EntryDate						AS EnrollmentEntryDate,
				   SSA.ExitWithdrawDate					AS EnrollmentExitWithdrawDate,
				   SSA.EntryTypeDescriptorId,
				   SSA.ExitWithdrawTypeDescriptorId,
				   SSA.TrackEducationOrganizationId,
				   SSA.EntryGradeLevelDescriptorId,
				   SSA.MembershipTypeDescriptorId,
				   SSA.TrackNumber,
				   SSEPA.MainSPEDSchool,
				   SEOA.EducationOrganizationId			AS DOR,
				   ROW_NUMBER() OVER (PARTITION BY  SPA.FiscalYear,SPA.StudentUSI,SPA.ProgramName,SPA.ProgramEducationOrganizationId,SPA.BeginDate,
													SPA.EducationOrganizationId,SSA.SchoolId,SSA.EntryDate,SEOA.EducationOrganizationId,SEOA.StartDate ORDER BY SSA.EntryDate ASC) AS RN 
			FROM leadata.StudentProgramAssociation SPA

				LEFT JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA WITH(NOLOCK)
				   ON SPA.FiscalYear = SSEPA.FiscalYear    
					  AND SPA.StudentUSI = SSEPA.StudentUSI    
					  AND SPA.ProgramTypeId = SSEPA.ProgramTypeId     
					  AND SPA.ProgramName = SSEPA.ProgramName    
					  AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
					  AND SPA.BeginDate= SSEPA.BeginDate 
					  AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId

				LEFT JOIN leadata.StudentSchoolAssociation SSA
					ON SSA.FiscalYear = SPA.FiscalYear    
					   AND SSA.StudentUSI = SPA.StudentUSI   
					   AND SSA.SchoolId = SPA.EducationOrganizationId

				LEFT JOIN config.FiscalYear CFY
					ON CFY.FiscalYear = SPA.FiscalYear 

				LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA WITH(NOLOCK) 
				   ON SEOA.FiscalYear = SPA.FiscalYear   
					  AND SEOA.StudentUSI = SPA.StudentUSI 
					  AND SEOA. SchoolId = SPA.EducationOrganizationId 
					  AND SEOA.EntryDate = SSA.EntryDate
					  AND (( SPA.BeginDate >= SEOA.StartDate
							 AND SPA.BeginDate <= ISNULL(SEOA.EndDate,CFY.EndDate)   --CONVERT(DATE,('06-30-'+ CONVERT(NVARCHAR(10),SEOA.FiscalYear)))
						   ) 
						   OR 
							( SEOA.StartDate >= SPA.BeginDate  
							  AND SEOA.StartDate <= ISNULL(SPA.EndDate,CFY.EndDate)		
							)
						  )

			WHERE
				(SPA.BeginDate >= SSA.EntryDate 
					AND SPA.BeginDate <= ISNULL(SSA.ExitWithdrawDate,CFY.EndDate)	
					) 
				OR (SSA.EntryDate >= SPA.BeginDate 
						AND SSA.EntryDate <= ISNULL(SPA.EndDate,CFY.EndDate)		
					) 
		 )A 
	WHERE RN = 1
GO