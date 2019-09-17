/************************************************************
**Procedure Name: config.GetFiscalYears
**
**Description:  Gets the List of Fiscal Years 
**	
**Revision History:
**	Who				When		What
**	B Augustine		7/2/2015	Initial Creation
**  B Augustine     4/5/2017    Added no lock, because I noticed that some calls to this proc 
**                              from the REST API were taking too long
***************************************************************/
CREATE PROC [config].[GetCurrentFiscalYear] 
   
AS
BEGIN

	SELECT FiscalYear, StartDate, EndDate, IsCurrent, IsActive
	FROM [config].[FiscalYear] (nolock)
	WHERE IsCurrent = 1
			
END

GO
