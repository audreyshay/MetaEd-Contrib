/********************************************************************************************************
**Procedure Name:
**      process.InsertMessageLogAndUpdateUnitOfWork
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts MessageLog and UpdateUnitofWork
**               
**Input:
**       ExecutionId, MessageId, SubmittedRecordCount, MinimumStudentUSI, MaximumStudentUSI
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
**	Viju Viswanathan		05/10/2016	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [process].[InsertMessageLogAndUpdateUnitOfWork]
	@executionId INT
   ,@messageId NVARCHAR(36)
   ,@submittedRecordCount INT
   ,@minimumStudentUSI INT
   ,@maximumStudentUSI INT
AS

BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY	
		BEGIN TRAN	InsertMessageLogTransaction
			--Insert the Message Log
			EXEC [process].[InsertMessageLog] @executionId, @messageId, @submittedRecordCount
			--Update unit of work
			UPDATE [ace].[UnitOfWork]
				SET [MessageId] = @messageId
					WHERE
						[ExecutionId] = @executionId AND
						[StudentUSI] BETWEEN @minimumStudentUSI AND @maximumStudentUSI
						
		IF @@TRANCOUNT > 0
			COMMIT TRAN InsertMessageLogTransaction;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN InsertMessageLogTransaction;
			THROW; --Rethrow error to calling program
	END CATCH
		
END
RETURN 0
