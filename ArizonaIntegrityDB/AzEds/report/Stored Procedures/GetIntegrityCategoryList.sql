/****************************************************
**Procedure Name:
**      report.GetIntegrityCategoryList
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Lists Integrity Category for Integrity report
**   
**Input:
**
**Output:
**  List of Integrity Category 
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from AzEDS Integrity Report UI
**
**Revision History:
**	P Kanyar	09/10/2015	Initial Creation
**	B Augustine	10/25/2016	added filter on report category
**
******************************************************/
CREATE PROC [report].[GetIntegrityCategoryList]		

AS	
BEGIN

SET NOCOUNT ON;

	SELECT DISTINCT 
		it.IntegrityTypeId	AS 'IntegrityCategoryId'
		,ps.Description		AS 'IntegrityCategory'		
	FROM integrity.IntegrityRuleType it 
			INNER JOIN 
		 process.ProcessSubType ps ON it.IntegrityTypeId = ps.ProcessSubTypeId	 
	WHERE ReportCategoryId = 3		--only return student data for drop down
	ORDER BY it.IntegrityTypeId

END
