/**************************************************************************
** Script Name:ConcurrentMembershipsForAStudent
** 
**
** Author: PSharma
** 
**
** Description: Returns the Enrollments which have concurrency
**
**
** 
** 
**
** Revision History: Created - PSharma 05/18/2016
** Rohith 5/20/2016 - updating the or condition with SSA2 entry date
** Sucharita 5/03/2019 Commented join with config.FiscalYear on fy.IsCurrent flag as the view will not return any record when we run integrity for the previous year
**************************************************************************************************************************************************************************/

CREATE VIEW [integrity].[ConcurrentMembershipsForAStudent]
AS
	SELECT
	  ssa2.StudentUSI					AS StudentUSI,
	  ssa2.EntryDate					AS ConcurrentEntryDate,
	  ssa2.ExitWithdrawDate				AS ConcurrentExitDate,
	  ssa2.MembershipTypeDescriptorId	AS ConcurrentMembershipType,
	  ssa2.SchoolId						AS ConcurrentSchoolId,
	  ssa2.FiscalYear					AS FiscalYearForConcurrentEnrollment
	FROM leadata.studentschoolassociation ssa1
	JOIN config.FiscalYear fy
	  ON fy.IsActive = 1
	  --fy.IsCurrent = 1	   
	JOIN leadata.studentschoolassociation ssa2
	  ON ssa1.StudentUSI = ssa2.StudentUSI
	  AND ssa1.SchoolId <> ssa2.SchoolId
	  AND ((ssa1.EntryDate BETWEEN ssa2.EntryDate AND COALESCE(ssa2.ExitWithdrawDate, '6-30-' + CONVERT(varchar(4), fy.FiscalYear)))
	  OR (ssa2.EntryDate BETWEEN ssa1.EntryDate AND COALESCE(ssa1.ExitWithdrawDate, '6-30-' + CONVERT(varchar(4), fy.FiscalYear))))
	WHERE ssa1.FiscalYear = fy.FiscalYear
	AND ssa2.FiscalYear = fy.FiscalYear
	AND ssa1.EntryDate > '6-30-' + CONVERT(varchar(4), fy.FiscalYear - 1)
	AND ssa2.EntryDate > '6-30-' + CONVERT(varchar(4), fy.FiscalYear - 1)
	GROUP BY  ssa2.FiscalYear,ssa2.StudentUSI,ssa2.SchoolId,ssa2.EntryDate,ssa2.ExitWithdrawDate,ssa2.MembershipTypeDescriptorId
	
