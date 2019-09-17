/**************************************************************************
** Procedure Name:
**      [process].[InsertSplitMergeConflicts]
**
** Author:
**      "The" Martez Killens
**
** Description:
**      Inserts Split Merge Conflicts
**
** Output:
**		None
** Returns:
**
** Revision History:
**	Who				When		What
**	Martez Killens	07/22/2016	Initial Creation
**************************************************************************/

CREATE PROCEDURE [process].[InsertSplitMergeConflicts]
	@SplitMergeDetailId INT,
	@ConflictData NVARCHAR(MAX)
AS
BEGIN

	INSERT INTO [process].[SplitMergeConflict] (SplitMergeDetailId, ConflictData)
	VALUES (@SplitMergeDetailId, @ConflictData)

END