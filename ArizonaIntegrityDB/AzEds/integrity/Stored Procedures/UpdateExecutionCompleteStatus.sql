
/********************************************************************************************************
**Procedure Name:
**      [integrity].[UpdateExecutionCompleteStatus]
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**	Updates  complete Status on process.execution table and message log table
**               
**Input:
**
**Output:
**	
**
**Returns:
**
**Implementation:
**	
**
**Revision History:
**	Who			When		What
**	Rohith	11/04/2015	Initial Creation
**  Rohith	2/12/2016   C# project is modified to process the messages 5 times before it pushes in deadletterqueue. This SP change updates the status correctly. Even though if we have some messages failed due to deadlock and processed again.
**	Rohith  3/8/2016	Instead of a single larger transaction I am having multiple smaller transactions to avoid deadlocks
**	Rohith  4/13/2016   Updating the logic to update the status as 6 when there are no messages in process publisher
**  Britto  4/13/2016   removed transactions
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[UpdateExecutionCompleteStatus]
	@ExecutionId as int,
	@MessageId as [nvarchar](36) = NULL
AS
BEGIN 
      SET NOCOUNT ON;
		  
	  	
		declare @countOfPassedMessageids int, @countOfFailedMessageids int, @countOfSubmittedMessageids int;
		
		-- update Message Log table 
		update process.MessageLog 
		set [PassedRecordCount] = Submittedrecordcount,
			[Failedrecordcount] = Null,
			[EndDateTime]= GETUTCDATE()
		where MessageId = ISNULL(@MessageId, '0') and ExecutionId = @ExecutionId



		select @countOfSubmittedMessageids = count(*) from process.MessageLog (NOLOCK)
		where ExecutionId = @ExecutionId

		select @countOfPassedMessageids = count(*) from process.MessageLog ML (NOLOCK)		
		where ml.ExecutionId = @ExecutionId and passedrecordcount is not null	
		
		select @countOfFailedMessageids = count(*) from process.MessageLog ML (NOLOCK)		
		where ml.ExecutionId = @ExecutionId and failedrecordcount is not null		
		 

		if(@countOfSubmittedMessageids = @countOfPassedMessageids)
		Begin

			--update the execution table as success. since all messages have been processed correctly
			UPDATE process.execution 
				   SET statusTypeid = 6,
				   enddatetime = GETUTCDATE() 
			WHERE  executionid =   @ExecutionId

		END	
		ELSE 
		BEGIN
		if(@countOfSubmittedMessageids = (@countOfPassedMessageids + @countOfFailedMessageids))
		 -- At the end of process, if there are any failed messages then we update the failure status, 
		  UPDATE process.execution 
				  SET    statustypeid = 5, 
				         enddatetime = GETUTCDATE() 
				  WHERE  executionid = @ExecutionId 

		END
END
