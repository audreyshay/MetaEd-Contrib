/********************************************************************************************************
**Procedure Name:
**      process.UpdateSplitStage
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Updates staged data for split process
**             
**Returns:
**
**Implementation:
**	Used by AzEDS Split Process  
**
**Revision History:
**	Who						When		What
**	Viju V					01/19/2017	Initial Creation
**	Viju V					02/14/2017	Modified to return entity list
**********************************************************************************************************/
CREATE PROCEDURE [process].[UpdateSplitStage]
	@SplitStage  AS process.SplitStagedDataList READONLY
AS

BEGIN
	SET NOCOUNT ON;
	--Upadate Split Stage
	UPDATE  ss
		SET  ss.Isselected = sstg.IsSelected 
	FROM 	process.SplitStage ss 
	JOIN @SplitStage sstg
		ON ss.SplitDetailId = sstg.SplitDetailId
		AND ss.SourceId = sstg.SourceId

	--Return list of entities missing some of the associated records
	SELECT Entity--,COUNT(Entity) TotalRecords , SUM (CAST(ss.isSelected as INT)) Selected ,
	--CASE WHEN (COUNT(Entity) = SUM (CAST(ISNULL(ss.IsSelected,0) AS INT)) OR SUM (CAST(ss.IsSelected as INT)) = 0) THEN 0
	--	ELSE 1
	--END Warning

	FROM [process].[SplitStage] ss
	JOIN @SplitStage sstg
		ON ss.SplitDetailId = sstg.SplitDetailId
	GROUP BY ss.entity, ss.SplitDetailId
	HAVING COUNT(Entity) <> SUM (CAST(ss.IsSelected AS INT)) AND SUM (CAST(ss.IsSelected as INT)) <> 0
	
END