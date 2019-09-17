/********************************************************************************************************
**Procedure Name:
**      process.GetProcessSubTypes
**
**Author:
**      Venugopal Metukuru
**
**Description:  
**	Get the ProcessSubtypes  by Executionid
**               
**Input:
**       Execution id 
**
**Output:
**	ProcessSubtypes for Execution id 
**
**Returns:
**
**Implementation:
**	Used by AzEDS Integity Process  
**
**Revision History:
**	Who						 When		  What
**	Venugopal Metukuru		06/08/2016	  Initial Creation

**********************************************************************************************************/
CREATE PROCEDURE [process].[GetProcessSubTypes]

	@executionId INT
	
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @SubTypelistStr VARCHAR(50)
	SELECT 
	       @SubTypelistStr = COALESCE(@SubTypelistStr+',' ,'') + CONVERT(VARCHAR,ProcessSubTypeId)
	FROM [AzEds].[process].[ExecutionProcessSubType] 
	WHERE
	     ExecutionId = @executionId
	ORDER BY ProcessSubTypeId 
	SELECT @SubTypelistStr  as ExecutionSubTypes

		
END

GO


