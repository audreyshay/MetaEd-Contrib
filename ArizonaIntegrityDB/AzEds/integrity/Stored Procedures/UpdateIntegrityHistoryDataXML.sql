
/********************************************************************************************************
**Procedure Name:
**      integrity.UpdateIntegrityHistoryDataXML
**
**Author:
**      Britto Augustine
**
**Description:  
**	Inserts IntegrityException records for integrity processing and updates integrity history result type 
**               
**Input:
**        @Integrityhistorydataxml as integrity.IntegrityHistoryDataXMLTableType 
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
**	Rohith CHintamaneni	11/20/2015	Initial Creation
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[UpdateIntegrityHistoryDataXML]   
   @Integrityhistorydataxml as integrity.IntegrityHistoryDataXMLTableType READONLY
AS
BEGIN 
    SET NOCOUNT ON;

	BEGIN TRY

    --Begin Transaction
    BEGIN TRAN IntegrityExceptionTransaction;
     
		UPDATE IH 
		set IH.IntegrityData = tvp.dataxml from Integrity.IntegrityHistory IH
		inner join @Integrityhistorydataxml tvp on tvp.integrityHistoryId = IH.IntegrityHistoryid

    --Everything good, commit the transaction
    COMMIT TRAN IntegrityExceptionTransaction
    
    END TRY
    BEGIN CATCH
        if @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRAN IntegrityExceptionTransaction
            END
    END CATCH
END



