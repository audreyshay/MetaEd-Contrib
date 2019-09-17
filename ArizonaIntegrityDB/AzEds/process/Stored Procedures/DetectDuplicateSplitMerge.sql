/************************************************************
**Procedure Name: [process].[DetectDuplicateSplitMerge]
**
**Author: Martez Killens
**
**Description:  Determines if a merge process has already been completed
**	
**Revision History:
**	Who			When		What
**	MK			06/12/2015	Initial Creation
**
***************************************************************/

CREATE PROCEDURE [process].[DetectDuplicateSplitMerge]
	@splitMergeDetailId int
AS
BEGIN
	SELECT
	CASE WHEN 
	EXISTS
	(
		SELECT 1
		FROM process.SplitMergeData
		WHERE SplitMergeDetailId = @splitMergeDetailId
	) THEN 1 ELSE 0
	END
END