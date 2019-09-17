/******************************************************************************************
** Script Name:[leadata].[StudentEnrollmentNeedAssociationwithDOR]
**
** Author: P Kanyar
**
** Description: View that establishes a relationship between StudentNeed and SchoolAssociation 
** and EdOrgAssociation of a student at a school in a given fiscalyear based on the time span of the  
** Need , enrollment and DOR association -- this is created for SPED72 report where Need records without Program has to be shown. 
** So with the new requirements for SPED72, need to pull DOR instead of showing * for DORCTDS for students with Need but no SPED Program
**
** Revision History: Created - P Kanyar - 05/29/2019
**
********************************************************************************************/
	CREATE VIEW [leadata].[StudentEnrollmentNeedAssociationwithDOR]
	AS
	SELECT DISTINCT FiscalYear,
					StudentUSI,
					NeedBeginDate,
					SchoolId,
					NeedEndDate,
					[PrimaryStudentNeedIndicator],
				    StudentNeedDescriptorId,
				    NeedCode,
					EnrollmentEntryDate,
					EnrollmentExitWithdrawDate,
				    EntryGradeLevelDescriptorId,
					DOR
	FROM (
			SELECT SN.FiscalYear, 
				   SN.StudentUSI, 
				   SN.[StudentNeedEntryDate]			AS NeedBeginDate,
				   SN.ReportingEducationOrganizationID	AS SchoolId, 
				   SN.[StudentNeedExitDate]				AS NeedEndDate,
				   SN.[PrimaryStudentNeedIndicator],
				   SN.StudentNeedDescriptorId,
				   SND.CodeValue						AS NeedCode,
				   SSA.EntryDate						AS EnrollmentEntryDate,
				   SSA.ExitWithdrawDate					AS EnrollmentExitWithdrawDate,
				   SSA.EntryGradeLevelDescriptorId,
				   SEOA.EducationOrganizationId			AS DOR,
				   ROW_NUMBER() OVER (PARTITION BY SN.FiscalYear,SN.StudentUSI,SN.[StudentNeedEntryDate],SN.[PrimaryStudentNeedIndicator], SN.StudentNeedDescriptorId,
													SN.ReportingEducationOrganizationID,SSA.SchoolId,SSA.EntryDate,SEOA.EducationOrganizationId,SEOA.StartDate ORDER BY SSA.EntryDate ASC) AS RN 
			FROM leadata.StudentNeed SN WITH(NOLOCK)

				LEFT JOIN leadata.StudentSchoolAssociation SSA WITH(NOLOCK)
					ON SSA.FiscalYear = SN.FiscalYear    
					   AND SSA.StudentUSI = SN.StudentUSI   
					   AND SSA.SchoolId = SN.ReportingEducationOrganizationID

				LEFT JOIN config.FiscalYear CFY WITH(NOLOCK)
					ON CFY.FiscalYear = SN.FiscalYear 

			    LEFT JOIN leadata.Descriptor SND
					ON SN.FiscalYear = SND.FiscalYear  
						AND SN.StudentNeedDescriptorId = SND.DescriptorId

				LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA WITH(NOLOCK) 
				   ON SEOA.FiscalYear = SN.FiscalYear   
					  AND SEOA.StudentUSI = SN.StudentUSI 
					  AND SEOA. SchoolId = SN.ReportingEducationOrganizationID 
					  AND SEOA.EntryDate = SSA.EntryDate
					  AND (( SN.[StudentNeedEntryDate] >= SEOA.StartDate
							 AND SN.[StudentNeedEntryDate] <= ISNULL(SEOA.EndDate,CFY.EndDate)   
						   ) 
						   OR 
							( SEOA.StartDate >= SN.[StudentNeedEntryDate]  
							  AND SEOA.StartDate <= ISNULL(SN.[StudentNeedExitDate],CFY.EndDate)		
							)
						  )

			WHERE
				(SN.[StudentNeedEntryDate] >= SSA.EntryDate 
					AND SN.[StudentNeedEntryDate] <= ISNULL(SSA.ExitWithdrawDate,CFY.EndDate)	
					) 
				OR (SSA.EntryDate >= SN.[StudentNeedEntryDate] 
						AND SSA.EntryDate <= ISNULL(SN.[StudentNeedExitDate],CFY.EndDate)		
					) 
		 )A 
	WHERE RN = 1

GO