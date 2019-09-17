
/******************************************************************************************
** Script Name:[leadata].[StudentEnrollmentProgramAssociation]
** 
**
** Author: PSharma
** 
**
** Description: View that establishes a relationship between ProgramAssociation and SchoolAssociation of a student at a school in a given fiscalyearbased on the time span of the program and enrollment 
**
**
** Revision History: Created - Amit Verma - 12/15/2015
** 
**Revision Histroy :4/29/2019 - Harsha Kankanala -- Added Calendar Code to the view to populate in Report for 2020
** Rchinta 5/20/2019 : just adding comments no code change, we have directly used the view logic in proc [integrity].[GetMembershipRuleDRPGCD], when ever view logic changes we have to make sure the proc logic also reflects the same change. Refrencing the view directly in proc is giving a negative performance
********************************************************************************************/
CREATE VIEW [leadata].[StudentEnrollmentProgramAssociation]
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
				CalendarCode
FROM (
		SELECT SPA.FiscalYear, 
			   SPA.StudentUSI, 
			   SPA.ProgramTypeId, 
			   SPA.ProgramName, 
			   SPA.ProgramEducationOrganizationId, 
			   SPA.BeginDate AS ProgramBeginDate,
			   SPA.EducationOrganizationId AS SchoolId, 
			   SSA.EntryDate AS EnrollmentEntryDate,
			   SSA.ExitWithdrawDate AS EnrollmentExitWithdrawDate,
			   SSA.EntryTypeDescriptorId,
			   SSA.ExitWithdrawTypeDescriptorId,
			   SSA.TrackEducationOrganizationId,
			   SSA.EntryGradeLevelDescriptorId,
			   SSA.MembershipTypeDescriptorId,
			   SSA.TrackNumber,
			   SSA.CalendarCode,
			   ROW_NUMBER() OVER (PARTITION BY  SPA.FiscalYear,SPA.StudentUSI,SPA.ProgramName,SPA.ProgramEducationOrganizationId,SPA.BeginDate,
												SPA.EducationOrganizationId,SSA.SchoolId,SSA.EntryDate ORDER BY SSA.EntryDate ASC) AS RN
		FROM leadata.StudentProgramAssociation SPA
			LEFT JOIN leadata.StudentSchoolAssociation SSA
				ON SSA.StudentUSI = SPA.StudentUSI 
				   AND SSA.SchoolId = SPA.EducationOrganizationId
				   AND SSA.FiscalYear = SPA.FiscalYear
		WHERE
			(SPA.BeginDate >= SSA.EntryDate 
			 AND SPA.BeginDate <= ISNULL(SSA.ExitWithdrawDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
			 ) 
			OR (SSA.EntryDate >= SPA.BeginDate 
				 AND SSA.EntryDate <= ISNULL(SPA.EndDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
				) 
	  )A 
WHERE RN = 1


GO


