
/************************************************************
**Procedure Name: dashboard.CreateEventDate
**
**Author: Britto Augustine
**
**Description: create a new EvenDate record if it does not exist for the FiscalYear and and EvenDate passed
**				returns the EventDateId
**
**Note: if ExecutionId is passed then that is used to get the Eventdate, else use the EventDate passed
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**
***************************************************************/
CREATE PROC [dashboard].[CreateEventDate]
	@ExecutionId as int = null,
	@EventDate as datetime = null,
	@EventDateId as int output
AS
BEGIN
	
	IF @ExecutionId IS NOT NULL
	BEGIN
		--get execution record details
		IF EXISTS (SELECT 1 FROM process.Execution WHERE ExecutionId = @ExecutionId)
			SELECT @EventDate = InitiatedDateTime
			FROM process.Execution 
			WHERE ExecutionId = @ExecutionId
		ELSE		
			THROW 51000, 'Could not find Execution record.', 1;  
	END

	IF @EventDate IS NULL
		THROW 51000, 'EventDate cannot be null.', 1;  

	--check if record exists already for the eventdateid and fy combination
	SELECT @EventDateId = ed.EventDateId
	FROM dashboard.EventDate ed
	WHERE EventDate = @EventDate

	IF @EventDateId IS NULL
	BEGIN
		--if no record returned for the event date and fy then insert one
		BEGIN TRY
			BEGIN TRAN

			INSERT INTO dashboard.EventDate
				(EventDate, CreateDate)
			VALUES
				(@EventDate, GETUTCDATE())

			SET @EventDateId = SCOPE_IDENTITY()

			INSERT INTO dashboard.EventDateExecution
				(EventDateId, ExecutionId, CreateDate)
			VALUES
				(@EventDateId, @ExecutionId, GETUTCDATE())

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;

			THROW 51000, 'Error inserting Event Date.', 1;  
		END CATCH
	END
	ELSE
	BEGIN
		--if there is a event date record, but no execution record then insert the exeuction record
		IF NOT EXISTS (SELECT 1 FROM dashboard.EventDateExecution where EventDateId = @EventDateId AND ExecutionId = @ExecutionId)
			INSERT INTO dashboard.EventDateExecution
				(EventDateId, ExecutionId, CreateDate)
			VALUES
				(@EventDateId, @ExecutionId, GETUTCDATE())
	END


	RETURN

END