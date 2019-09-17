/************************************************************
**Procedure Name: config.GetFiscalYears
**
**Description:  Gets the List of Fiscal Years 
**	
**Revision History:
**	Who				When		What
**	B Augustine		7/2/2015	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetFiscalYears] 
   
AS
BEGIN

	SELECT FiscalYear, StartDate, EndDate, IsCurrent, IsActive
	FROM [config].[FiscalYear]
	WHERE IsActive = 1
	ORDER BY FiscalYear DESC

END

GO