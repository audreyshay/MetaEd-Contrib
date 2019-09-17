CREATE PROC [process].[AzesToSaisInsertExecution]
	@processTypeId			int,
	@executionTypeId		int,
	@initiatedByUserName	nvarchar(100),
	@initiatedDateTime		datetime = null,
	@fiscalYear				int = 2016,
	@statusTypeID			int
AS

BEGIN
	SET NOCOUNT ON;	

	SET @initiatedDateTime = ISNULL(@initiatedDateTime, getutcdate())

	INSERT INTO [process].[Execution]
			(
				[ProcessTypeId]
				,[ExecutionTypeId]
				,[InitiatedDateTime]
				,[StartDateTime]
				,[InitiatedByUserName]
				,[FiscalYear]
				,[StatusTypeId]
			)
		VALUES
			(
				@processTypeId
				,@executionTypeId
				,@initiatedDateTime
				,@initiatedDateTime
				,@initiatedByUserName
				,@fiscalYear
				,1
			)

	SELECT SCOPE_IDENTITY() AS ExecutionID
END
