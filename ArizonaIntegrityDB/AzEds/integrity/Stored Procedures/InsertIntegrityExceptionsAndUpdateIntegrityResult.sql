/********************************************************************************************************
**Procedure Name:
**      integrity.InsertIntegrityExceptionsAndUpdateIntegrityResult
**
**Author:
**      Britto Augustine
**
**Description:  
**	Inserts IntegrityException records for integrity processing and updates integrity history result type 
**               
**Input:
**       @ExecutionId INT
**
**Output:
**	None
**
**Returns:
**
**Implementation:
**	Used to by AzEDS integrity processing  
**
**Revision History:
**	Who					When		What
**	Britto Augustine	11/17/2015	Initial Creation
**  Rohith Chintamaneni 01/04/2016	updating it as failed when it only contains errors and updating it as passed even if it contains warnings and informations
**  Rohith Chintamaneni 03/17/2016  Updating History with Historyid rather than execution and message id and making sure that we do not overwrite 3 while setting the integrityresulttypeid
**	Rohith Chintamaneni	5/16/2016   Adding Throw statement in Catch Block so that C# will get the exception. 
**	Vinoth				11/21/2017  Made change on IntegrityExceptiontable Type to include the actual and exceptions message.
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[InsertIntegrityExceptionsAndUpdateIntegrityResult]
   @ExecutionId as int,
   @MessageId as Nvarchar(36), 
   @IntegrityExceptions as integrity.IntegrityExceptionTableType READONLY
AS
BEGIN 
    SET NOCOUNT ON;
	    
			 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	BEGIN TRY

    --Begin Transaction
    BEGIN TRAN IntegrityExceptionTransaction;
     
		DECLARE @IntegrityRunDateTime AS datetime
		SET @IntegrityRunDateTime = GETUTCDATE()	
		
		CREATE TABLE #ListofhistoryIdsForABatch
		(
		IntegrityHistoryId bigint NOT NULL
		)

		INSERT INTO #ListofhistoryIdsForABatch
		Select Ih.Integrityhistoryid from [integrity].[vw_GetIntegrityHistoryPerExecution] Ih 
		WHERE IH.ExecutionID = @ExecutionId and Ih.MessageID= @MessageId

		--delete any exceptions that were inserted by a previous batch run which did not complete in a timely manner
		DELETE dest
		FROM [integrity].[IntegrityException] dest
		JOIN #ListofhistoryIdsForABatch src
		  ON dest.IntegrityHistoryId = src.IntegrityHistoryId

		  -- Also update the integrity result for that historyid
		Update Ih  
		set Ih.integrityresulttypeid = 0
		from Integrity.Integrityhistory Ih
		JOIN #ListofhistoryIdsForABatch src
		  ON Ih.IntegrityHistoryId = src.IntegrityHistoryId and ih.Integrityresulttypeid <> 3


		-- insert records into IntegrityException
		INSERT INTO [integrity].[IntegrityException]
		( 
			IntegrityHistoryId,
			ExceptionMessageCode,
			ExceptionSeverityId, 
			CreatedDate,
			ExceptionDetails,
			Actual,
			Expected
		) 
		SELECT 
			IntegrityHistoryId,
			ExceptionMessageCode,
			ExceptionSeverityId, 
			@IntegrityRunDateTime,
			ExceptionDetails,
			Actual,
			Expected
		FROM @IntegrityExceptions
    
		--update integrity history result type
		UPDATE ih
		SET	IntegrityResultTypeId = 2,   -- Failed
			IntegrityRunDateTime = @IntegrityRunDateTime
		FROM [integrity].[IntegrityHistory] ih (ROWLOCK)
		JOIN #ListofhistoryIdsForABatch Ihb on ih.integrityHistoryid = ihb.integrityHistoryid
		JOIN @IntegrityExceptions  ie 
		  ON ihb.IntegrityHistoryId = ie.IntegrityHistoryId  AND ie.ExceptionSeverityId = 1 -- update as failed only when it contains errors, not including warnings and information
	

		 UPDATE ih
		SET	IntegrityResultTypeId = 1,   -- Passed
			IntegrityRunDateTime = @IntegrityRunDateTime
		FROM [integrity].[IntegrityHistory] ih (ROWLOCK)
		JOIN #ListofhistoryIdsForABatch Ihb on ih.integrityHistoryid = ihb.integrityHistoryid	
		AND ih.IntegrityResultTypeId NOT IN (2, 3) -- Update all records but Failed

		DROP Table #ListofhistoryIdsForABatch

    --Everything good, commit the transaction
    COMMIT TRAN IntegrityExceptionTransaction
    
    END TRY
    BEGIN CATCH
        if @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRAN IntegrityExceptionTransaction;
				Throw
            END
    END CATCH
END

GO


