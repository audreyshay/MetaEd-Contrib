/********************************************************************************************************
**Procedure Name: 
**       [integrity].[UpdateMessageLogStartDate]
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
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[UpdateMessageLogStartDate] @ExecutionId AS INT, 
                                                           @MessageId   AS 
[NVARCHAR](36) = NULL 
AS 
  BEGIN 
      SET nocount ON; 

      BEGIN try 
          --Begin Transaction 
          BEGIN TRAN updateexecutiontransaction 

			Update process.MessageLog
			set startdatetime = GETUTCDATE()
			where executionid = @ExecutionId and messageid = @messageid

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
