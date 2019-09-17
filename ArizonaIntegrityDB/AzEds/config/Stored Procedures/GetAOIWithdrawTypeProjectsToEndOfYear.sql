
/************************************************************
**Procedure Name: config.[GetAOIWithdrawTypeProjectsToEndOfYear]
**
**Description:  Gets the AOI(Arizona Online Instructions) withdraw types that will project adm to the end of the year even if an exit date is present
**	
**Revision History:
**	Who			When		What
**	CM		09/09/2016	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetAOIWithdrawTypeProjectsToEndOfYear] 
   
AS
BEGIN

	SELECT
			FiscalYear,
			ExitWithdrawTypeDescriptorId
	FROM AOIWithdrawTypeProjectsToEndOfYear
			
END