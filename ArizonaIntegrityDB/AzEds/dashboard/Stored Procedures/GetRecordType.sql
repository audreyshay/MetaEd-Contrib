/**************************************************************************
**Procedure Name:
**      dashboard.GetRecordType
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Gives a lst of Record Types for Verification DashBoard on AzEDS Portal
**   
**Input:
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from Verification DashBoard on AzEDS Portal
**
**Revision History:
**	P Kanyar	02/11/2016	Initial creation
**  M Killens	02/18/2016  Limit to AzEDS, Alias Columns for ORM
**
***************************************************************************/
CREATE PROC [dashboard].[GetRecordType]

AS
BEGIN

SET NOCOUNT ON;

SELECT 
	RecordCountTypeId	AS ResourceId
	,ISNULL(DisplayName, Description)	AS ResourceName
FROM dashboard.RecordCountType
WHERE 
	RecordCountTypeId IN  (300, 350, 351, 375)
ORDER BY 
	RecordCountTypeId

END

/* END [dashboard].[GetRecordType] */