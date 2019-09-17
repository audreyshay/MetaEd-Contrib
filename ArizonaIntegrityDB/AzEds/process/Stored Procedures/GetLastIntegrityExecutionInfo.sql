/********************************************************************************************************
**Procedure Name:
**      process.GetLastIntegrityExecutionInfo
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get the last integrity execution information
**               
**Input:
**       
**
**Output:
**	Get the last integrity execution information
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		08/26/2015	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [process].[GetLastIntegrityExecutionInfo]
	AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 [ExecutionId]
      ,[ProcessTypeId]
      ,[ExecutionTypeId]
      ,[InitiatedDateTime]
      ,[StartDateTime]
      ,[EndDateTime]
      ,[CancelledDateTime]
      ,[InitiatedByUserName]
      ,[CancelledByUserName]
      ,[FiscalYear]
      ,[StatusTypeId]
      ,[Comment]
      ,[ReferenceExecutionId]
	FROM [process].[Execution]

	WHERE StatusTypeId = 6 and ProcessTypeId  in (3,1)
	ORDER BY ExecutionId DESC

END
RETURN 0
