/************************************************************
**Procedure Name: process.InsertSplitData
**
**Author: Viju Viswanathan
**
**Description:  Update process.SplitDetail with TargetSplitID
**	
**Revision History:
**	Who			When		What
**	Viju V		02/17/2017	Initial Creation
**  M Killens	03/27/2017	Set ProcessStartDate
***************************************************************/
CREATE PROCEDURE [process].[UpdateSplitDetail]
	@SplitDetailId INT,
	@TargetSplitId INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE process.SplitDetail
			SET TargetSplitID = @TargetSplitId,
				ProcessStartDate = GETDATE()
			WHERE SplitDetailId = @SplitDetailId 
	 END TRY
    BEGIN CATCH
        BEGIN 
            
            DECLARE @ErrorNumber INT = ERROR_NUMBER();
            DECLARE @ErrorLine INT = ERROR_LINE();
            DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
            DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
            DECLARE @ErrorState INT = ERROR_STATE();

            PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
            PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        END
    END CATCH

END