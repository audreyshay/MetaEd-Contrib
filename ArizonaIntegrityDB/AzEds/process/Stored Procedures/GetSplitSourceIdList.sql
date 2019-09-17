/**************************************************************************
** Procedure Name:
**		process.GetSplitSourceIdList
**
** Author:
**		Viju Viswanathan
**
** Description:
**		Retrieves list of SourceIds to split
**
** Output:
**		None
** Returns:
**		Split SourceId list
**
**
** Revision History:
**		Who					When		What
**		Viju V				03/01/2017	Initial Creation
**************************************************************************/
CREATE PROCEDURE process.GetSplitSourceIdList
	@SplitDetailId AS INT
AS
BEGIN

	SELECT SourceTable
		  ,SourceId
	 FROM process.SplitStage
	 WHERE SplitDetailId = @SplitDetailId
		AND IsSelected = 1
END
