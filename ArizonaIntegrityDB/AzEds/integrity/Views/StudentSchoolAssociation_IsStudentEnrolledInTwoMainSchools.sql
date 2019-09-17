/******************************************************************************************
** Script Name:[integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools] 
** 
**
** Author: Amit Verma
** 
**
** Description: View to identified ELL has Subsequent SPED Program based on 
**              the StudentUSI and EducationOrganizationId.
**
**
** Revision History: Created - Amit Verma - 12/15/2015
** 
**
********************************************************************************************/
CREATE VIEW [integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools] 
AS
SELECT ssa.StudentUSI
      ,ssa.FiscalYear
	  ,CONVERT(BIT, CASE 
					WHEN COUNT(*) > 1 THEN 1 
					ELSE 0 
					END 
			   ) AS IsStudentEnrolledInTwoMainSchools 
FROM leadata.StudentSchoolAssociation ssa
WHERE ((ssa.EntryDate <= GETDATE() AND ssa.ExitWithdrawDate IS NULL) OR
		    (ssa.EntryDate <= GETDATE() AND ssa.ExitWithdrawDate >= GETDATE()))
	   AND ssa.MembershipTypeDescriptorId = 10217
GROUP BY ssa.StudentUSI, ssa.FiscalYear