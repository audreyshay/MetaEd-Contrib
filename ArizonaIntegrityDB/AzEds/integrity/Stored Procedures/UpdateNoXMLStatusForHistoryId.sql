/********************************************************************************************************
**Procedure Name:
**      [integrity].[UpdateNoXMLStatusForHistoryId]
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**	Update no XML Status For HistoryId
**               
**Input:
**	@HistoryId int
**Output:
**	Updates the Status as no XML
**
**Returns:
**
**Revision History:
**	Who			When		What
**	Rohith Chintamaneni		10/19/2015	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[UpdateNoXMLStatusForHistoryId]
	@HistoryIdsdatatable as [integrity].[IntegrityHistoryTableType] READONLY
AS
BEGIN
BEGIN TRY
Begin transaction UpdateNoXMLStatus

	Update T
	set T.IntegrityResultTypeid = 3 from
	Integrity.IntegrityHistory T with (rowlock) 
	inner join @HistoryIdsdatatable hids on hids.IntegrityhistoryId = T.IntegrityHistoryId
	

--Everything good, commit the transaction
		COMMIT TRAN UpdateNoXMLStatus

	END TRY
	BEGIN CATCH
		if @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN UpdateNoXMLStatus;				
				Throw ;  -- rethrow error to c# calling program
			END
	END CATCH	

END
GO

