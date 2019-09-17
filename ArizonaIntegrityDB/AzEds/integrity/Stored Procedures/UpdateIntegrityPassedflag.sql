--========================================================================================== 
--Author: rchinta     
--Create date: 11/18/2014 
--Description:  Update Integritypassed flag for records processed
-- to run SP :  exec [Integrity].[UpdateIntegrityPassedflag]
-- Modified 1/20/2015: update flag which does not have Exceptions 
--========================================================================================== 
CREATE PROCEDURE [Integrity].[UpdateIntegrityPassedflag]
@historyid INT
AS 
Begin

IF NOT EXISTS(SELECT 1 FROM Integrity.IntegrityException
WHERE [IntegrityHistoryId]	= @historyid)
	BEGIN

	UPDATE [integrity].[IntegrityHistory]
	SET	[IntegrityResultTypeId] = 1,   -- Passed
	[IntegrityRunDateTime] = GETUTCDATE()
	WHERE [IntegrityHistoryId]	 = @historyid

	END
	Else
	Begin

	UPDATE [integrity].[IntegrityHistory]
	SET	[IntegrityResultTypeId] = 2,   -- failed
	[IntegrityRunDateTime] = GETUTCDATE()
	WHERE [IntegrityHistoryId]	 = @historyid

	END



END	