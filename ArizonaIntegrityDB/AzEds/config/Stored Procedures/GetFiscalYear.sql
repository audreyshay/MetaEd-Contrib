/************************************************************
**Procedure Name: ace.GetFiscalYears
**
**Author: Kalyani Kankatala
**
**Description:  Gets all the fiscal year information
**	
**Revision History:
**	Who			When		What
**	KK		07/22/2015	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetFiscalYear] 
   
AS
BEGIN

	SELECT
	FiscalYear,StartDate,EndDate,IsCurrent,IsActive
	 FROM
	config.FiscalYear
			
END