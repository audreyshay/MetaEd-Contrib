/********************************************************************************************************
**Procedure Name: 
**      [integrity].[UpdateExecutionFailureStatus] 
** 
**Author: 
**      Rohith Chintamaneni 
** 
**Description:   
**  Updates failed Status on process.execution table 
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
**  Who      When    What 
**  Rohith  07/09/2015  Initial Creation 
**	Rohith	2/12/2016	This proc just updates the status for each batch(The only case it updates the status as failure is if the job fails in process publisher only). The overall completion status must be updated in [integrity].[UpdateExecutionCompleteStatus] SP.
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[UpdateExecutionFailureStatus] @ExecutionId AS INT, 
                                                           @MessageId   AS 
[NVARCHAR](36) = NULL 
AS 
  BEGIN 
      SET nocount ON; 

      BEGIN try 
          --Begin Transaction 
          BEGIN TRAN updateexecutiontransaction 

          DECLARE @count INT; 
		  DECLARE @countOfPassedMessageids INT, @countOfFailedMessageids INT, @countOfSubmittedMessageids INT;

		  -- we need to apply this check here also along with completion because what if the last message in the topic has failed in that case the execution status will always show it as in progress.Hence inorder to fix it we need this logic here
		SELECT @countOfSubmittedMessageids = count(*) FROM process.MessageLog
		WHERE ExecutionId = @ExecutionId

		SELECT @countOfPassedMessageids = count(*) FROM process.MessageLog ML		
		WHERE ml.ExecutionId = @ExecutionId and passedrecordcount is not null	
		
		SELECT @countOfFailedMessageids = count(*) FROM process.MessageLog ML		
		WHERE ml.ExecutionId = @ExecutionId and failedrecordcount is not null		

          -- This means the the job failed at process publisher it self 
          IF( @MessageId is null ) 
            BEGIN 
                -- simply update the [SubmittedRecordCount] to failedrecordcount as the process publisher it self failed all the messagelog records for that execution are automatically failed
                UPDATE ML 
                SET    ml.[failedrecordcount] = ml2.[submittedrecordcount] 
                FROM   process.messagelog ML 
                       INNER JOIN process.messagelog ML2 
                               ON ML.executionid = ml2.executionid 
                                  AND ml.messageid = ml2.messageid 
								   where ML.executionid = @ExecutionId

		-- updating the execution as failed since it failed in process publisher itself.
				  UPDATE process.execution 
				  SET    statustypeid = 5, 
				         enddatetime = GETUTCDATE() 
				  WHERE  executionid = @ExecutionId 
		
            END 
          ELSE 
            BEGIN              

                -- update Message Log table  
                UPDATE process.messagelog 
                SET    [failedrecordcount] = [submittedrecordcount], 
					   [Passedrecordcount] = NULL,
                       [enddatetime] = GETUTCDATE() 
                WHERE                           
                       executionid = @ExecutionId AND 
					   messageid = @MessageId 
			
				if(@countOfSubmittedMessageids = (@countOfPassedMessageids + @countOfFailedMessageids))
				 -- At the end of process, if there are any failed messages then we update the failure status, 
				 UPDATE process.execution 
				  SET    statustypeid = 5, 
				         enddatetime = GETUTCDATE() 
				  WHERE  executionid = @ExecutionId 

			

            END 

       
          --Everything good, commit the transaction 
          COMMIT TRAN updateexecutiontransaction 
      END try 

      BEGIN catch 
          IF @@TRANCOUNT > 0 
            BEGIN 
                ROLLBACK TRAN updateexecutiontransaction; 

                THROW; -- rethrow error to c# calling program 
            END 
      END catch 
  END 





GO


