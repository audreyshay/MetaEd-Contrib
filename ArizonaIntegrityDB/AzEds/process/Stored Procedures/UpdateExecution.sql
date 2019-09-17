/********************************************************************************************************
**Procedure Name:
**      process.UpdateExecution
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Save Execution status & Message log status
**               
**Input:
**       ExectionID, MessageID, PassedRecordCount,  FailedRecordCount, ExecutionStartDateTime
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
**	Viju Viswanathan		10/08/2015	Increased the column width of MessageID	
**	Viju Viswanathan		04/18/2016	Modified to update the status to 'Completed' for the last message
**	Viju Viswanathan		04/26/2016	Fixed a bug where status 'Failed' is changed to 'Completed'
**********************************************************************************************************/
CREATE PROCEDURE [process].[UpdateExecution]
	@ExecutionID INT,
	@MessageID nvarchar(36),
	@PassedRecordCount INT,
	@FailedRecordCount INT,
	@ExecutionStartDateTime DATETIME = NULL
AS
BEGIN

--Update the Execution
	IF ISNULL(@PassedRecordCount,0) > 0 OR ISNULL (@FailedRecordCount, 0) > 0 
		BEGIN
			DECLARE @NumberOfRecords	INT;
			SELECT @NumberOfRecords = COUNT (*) from [process].[MessageLog] 
				WHERE ExecutionID = @ExecutionID AND PassedRecordCount IS NULL 

			IF @NumberOfRecords > 1

				UPDATE	[process].[Execution]
					SET [StatusTypeId] = 3,
					[StartDateTime] =
								(CASE WHEN [StartDateTime] IS NULL THEN @ExecutionStartDateTime 
								ELSE [StartDateTime]
								END)
					WHERE [ExecutionId] = @ExecutionID
						AND [StatusTypeId] <> 5			
												
			ELSE IF 	@NumberOfRecords = 1 
				BEGIN
					UPDATE
						[process].[Execution]
							SET	[EndDateTime] = GETUTCDATE(),
								[StatusTypeId] = 6,
								[StartDateTime] =
									(CASE WHEN [StartDateTime] IS NULL THEN @ExecutionStartDateTime 
									ELSE [StartDateTime]
								END)							
						WHERE 
							[ExecutionId] = @ExecutionID
							AND [StatusTypeId] <> 5

				END

			--Update the Message Log table
			UPDATE
				[process].[MessageLog]
				SET [PassedRecordCount] = ISNULL( @PassedRecordCount, 0),
					[FailedRecordCount] = ISNULL (@FailedRecordCount, 0),
					[EndDateTime] = GETUTCDATE() 					
				WHERE
					[ExecutionID] = @ExecutionID
				AND [MessageID] = @MessageID
		END
END