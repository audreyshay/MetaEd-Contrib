/****************************************************************************************************************
**Function Name:
**      report.GetLatestIntegrityHistoryIdList
**
**Author:
**      Jeff Stokes
**
**Description:  
**  returns the Latest Integrity History Id for selected integrity category and rule type from
**  integrity.IntegrityHistory Table.
**   
**Input:
**  @SchoolsList -  SchoolId(s) to filter upon
**  @FiscalYear - Fiscal year to filter upon
**
**Output:
**  @LatestIntegrityHistoryId Table
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from Integrity report (SPED72) Stored procs 
**
**	Notes:
**	Changed a table valued function in to this stored proc
**
**Revision History:
**	Jeff Stokes	08/11/2016	Initial creation
**
*******************************************************************************************************************/
CREATE FUNCTION [report].[GetLatestIntegrityHistoryIdList_SPED72]
(
	@FiscalYear int,
	@SchoolsList nvarchar(max)				-- comma separated list of school id(s)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		IntegrityHistoryId,
		FiscalYear,
		StudentUSI,
		SchoolId,
		SchoolEntryDate,
		IntegrityRuleTypeId,
		IntegrityResultTypeId,
		IntegrityRunDateTime,
		LocalcourseCode,
		TermTypeId,
		SchoolYear,
		StaffUSI,
		SectionBeginDate
	FROM
		(	
			SELECT
				RANK() OVER (PARTITION BY iin.StudentUSI, iin.SchoolId, iin.SchoolEntryDate, iin.IntegrityRuleTypeId ORDER BY iih.IntegrityRunDateTime DESC) AS RN, 
				iih.IntegrityHistoryId,
				iih.FiscalYear,
				iin.StudentUSI,
				iin.SchoolId,
				iin.SchoolEntryDate,
				iin.IntegrityRuleTypeId,
				iih.IntegrityResultTypeId,
				iih.IntegrityRunDateTime,
				iin.LocalcourseCode,
				iin.TermTypeId,
				iin.SchoolYear,
				iin.StaffUSI,
				iin.SectionBeginDate
			FROM 
				[integrity].[IntegrityHistory] iih WITH(NOLOCK)
				INNER JOIN [integrity].[IntegrityNeed] iin WITH(NOLOCK) ON 
					(
						iin.IntegrityNeedId = iih.IntegrityNeedId AND 
						iin.FiscalYear = iih.FiscalYear	
					)
				INNER JOIN [util].[Split](@SchoolsList, ',' ) sch ON 
					(sch.Token = iin.SchoolId)
			WHERE
				iih.FiscalYear = @FiscalYear AND 
				iih.IntegrityResultTypeId IN (1,2)
		) Main
	WHERE
		RN = 1
)