/************************************************************
**Procedure Name:[integrity].[GetIntegrityTypesForExecutionId]
**
**Author: Rohith Chintamaneni
**
**Description:  Updates Integrity History with Inrule xml.
**	
**Revision History:
**	Who			When		What
**	RC		10/21/2015		Initial Creation
***************************************************************/
CREATE PROCEDURE [integrity].[UpdateIntegrityHistory]
	@IntegrityHistoryId as int,
	@Inrulexml varchar(max)
AS
BEGIN

UPdate Integrity.Integrityhistory
set INtegrityData = @inrulexml
where integrityHistoryId = @IntegrityHistoryId
	 

END

