/********************************************************************************************************
**Implementation:
**	Used by AzEDS ACE Calculation to Set the execution StartDateTime as soon as processing starts
**
**********************************************************************************************************/

CREATE PROCEDURE [process].[SetExecutionStartTime]
	@ExecutionId int
AS
	UPDATE process.Execution
	SET StartDateTime = GETUTCDATE()
	WHERE ExecutionId = @ExecutionId
