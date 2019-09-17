/********************************************************************************************************
**Implementation:
**	Used by AzEDS ACE Calculation to Set the MessageLog StartDateTime as soon as processing starts
**
**********************************************************************************************************/

CREATE PROCEDURE [process].[SetMessageLogStartTime]
	@ExecutionId int,
	@MessageID nvarchar(36)
AS
	UPDATE process.MessageLog
	SET StartDateTime = GETUTCDATE()
	WHERE ExecutionId = @ExecutionId
	AND MessageId = @MessageID

