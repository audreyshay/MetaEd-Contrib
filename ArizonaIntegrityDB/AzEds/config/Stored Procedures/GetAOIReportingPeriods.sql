
/************************************************************
**Procedure Name: config.[GetAOIReportingPeriods]
**
**Description:  Gets the AOI(Arizona Online Instructions) reporting periods
**	
**Revision History:
**	Who			When		What
**	CM		01/12/2016	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetAOIReportingPeriods] 
   
AS
BEGIN

	SELECT
			AOIReportingPeriodId,
			FiscalYear,
			ReportingPeriodId,
			StartDate,
			EndDate,
			DaysInReportingPeriod
	FROM AOIReportingPeriod
			
END