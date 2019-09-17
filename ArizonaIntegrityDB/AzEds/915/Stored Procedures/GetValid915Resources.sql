/************************************************************
**Procedure Name: 915.GetValid915Resources
**
**Author: P Kanyar
**
**Description:  Gets Valid 915 Resources per Active Fiscal year
**	
**Revision History:
**	Who				When		What
**	P Kanyar		12/11/2017	Initial Creation
**  Vinoth K        03/06/2019  Adding the Request Type which helps API to determin what kind of request type this resource belongs too.
**
***************************************************************/
--declare 	@FiscalYear INT = 2019

CREATE PROC [915].[GetValid915Resources]
	@FiscalYear INT = NULL

AS
BEGIN

	SELECT
		fs.FiscalYear,
		rt.ResourceTypeId,
		rt.[Resource],
		rt.[RequestTypeId]
	FROM config.ResourceType rt
		JOIN config.FiscalYear fs 
			ON ( fs.FiscalYear BETWEEN [BeginFiscalYear] AND ISNULL([EndFiscalYear], 9999) 
					AND [BeginFiscalYear] IS NOT NULL
			   )
				AND fs.IsActive = 1
	WHERE fs.FiscalYear = ISNULL(@FiscalYear,fs.FiscalYear)
	ORDER BY fs.FiscalYear,
			 rt.ResourceTypeId

END
