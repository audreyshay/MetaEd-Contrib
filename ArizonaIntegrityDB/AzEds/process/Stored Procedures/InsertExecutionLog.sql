/********************************************************************************************************
**Procedure Name:
**      process.InsertExecutionLog
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts Execution Log
**               
**Input:
**       process.ExecutionLogTableType User Defined Table type
**
**Output:
**	None
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		07/06/2015	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [process].[InsertExecutionLog]
	@ExecutionLog AS process.ExecutionLogTableType READONLY
AS

BEGIN
	SET NOCOUNT ON;
	--Insert the Exectution Log	
	INSERT INTO [process].[ExecutionLog]
		SELECT  ExecutionId, 
				LogDateTime, 
				Message
		FROM @ExecutionLog;
END