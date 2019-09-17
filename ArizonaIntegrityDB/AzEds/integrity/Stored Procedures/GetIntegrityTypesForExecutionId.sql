/************************************************************
**Procedure Name:[integrity].[GetIntegrityTypesForExecutionId]
**
**Author: Rohith Chintamaneni
**
**Description:  Gets the List of integrity types that are required to pull data for rule execution. This Type will be retrived for each execution ID passed.
**	
**Revision History:
**	Who			When		What
**	RC		07/07/2015		Initial Creation
**  RC		3/15/2015		Using the view instead of Table
***************************************************************/
CREATE PROCEDURE [integrity].[GetIntegrityTypesForExecutionId]
	@ExecutionId as int, 
	@MessageId as [nvarchar](36)
AS
BEGIN
  SET NOCOUNT ON;
  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.      

	Declare @IntegrityRuleTypes table
	(
	[IntegrityRuleTypeId] int
	)

	INSERT INTO @IntegrityRuleTypes 
	SELECT  Distinct Ih.[IntegrityRuleTypeId]	
	FROM [integrity].[vw_GetIntegrityHistoryPerExecution] IH (NoLock)
	Where IH.ExecutionId = @ExecutionId and Ih.MessageId = @MessageId

	Select IRT.[IntegrityRuleTypeId],
	 IRT.Description, 
	 IRT.IntegrityRuleEntityName  FROM 
	 @IntegrityRuleTypes ih INNER JOIN integrity.IntegrityRuleType IRT (NoLock) on
	IRT.IntegrityRuleTypeId = Ih.IntegrityRuleTypeId
	

END
