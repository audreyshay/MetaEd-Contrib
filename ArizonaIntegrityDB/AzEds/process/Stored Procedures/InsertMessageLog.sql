/********************************************************************************************************
**Procedure Name:
**      process.InsertMessageLog
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts Message Log
**               
**Input:
**       ExecutionId, MessageId, SubmittedRecordCount
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
**	Viju Viswanathan		07/09/2015	Initial Creation
**	Viju Viswanathan		05/11/2016	Modified to use single insert.
**********************************************************************************************************/
CREATE PROCEDURE [process].[InsertMessageLog]
	@executionId INT
   ,@messageId NVARCHAR(36)
   ,@submittedRecordCount INT
AS

BEGIN
	SET NOCOUNT ON;
	--Insert the Exectution Log	
	INSERT INTO [process].[MessageLog]
				([ExecutionId],
				[MessageId],
				[SubmittedRecordCount]
				)
		VALUES  (@executionId, 
				@messageId, 
				@submittedRecordCount)		
END