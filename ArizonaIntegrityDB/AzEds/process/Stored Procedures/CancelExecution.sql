/************************************************************
**Procedure Name: process.CancelExecution
**
**Author: Pallavi Mecconda
**
**Description:  Cancel Execution when status is still Queued
**	
**Revision History:
**	Who			When		What
**	PM			06/12/2015	Initial Creation
**
***************************************************************/
CREATE PROCEDURE [process].[CancelExecution]
	@executionId INT
   ,@cancelledBy NVARCHAR(100)
   ,@outStatus BIT OUT
AS
BEGIN
	DECLARE @status INT
	SELECT @status = StatusTypeID FROM process.Execution WHERE ExecutionId = @executionId

	IF (@status <> 1) -- queued
	BEGIN 
		SET @outStatus = 0
	END
	ELSE
		UPDATE process.Execution
		SET StatusTypeId = 4
			,CancelledByUserName = @cancelledBy
			,CancelledDateTime = GETDATE()
		WHERE ExecutionId = @executionId

		SET @outStatus = 1
END
