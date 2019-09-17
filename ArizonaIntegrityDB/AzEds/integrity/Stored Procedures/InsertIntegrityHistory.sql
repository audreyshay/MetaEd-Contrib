
/********************************************************************************************************
**Procedure Name:
**      integrity.InsertIntegrityHistory
**
**Author:
**      Britto Augustine
**
**Description:  
**	Inserts IntegrityHistory records for integrity processing  
**               
**Input:
**       @ExecutionId INT
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
**	Britto Augustine	05/29/2015	Initial Creation
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[InsertIntegrityHistory]
    @ExecutionId INT
AS
BEGIN 
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [integrity].[IntegrityHistory] WHERE ExecutionId = @ExecutionId)
        THROW 51001, 'IntegrityHistory records already exist for the ExecutionId', 1 
        
      
    DECLARE @IntegrityRunDateTime AS datetime
    SET @IntegrityRunDateTime = GETUTCDATE()	
    
    --get the integrity needs where the flag is on and insert them into IntegrityHistory
    INSERT INTO [integrity].[IntegrityHistory]
               ([FiscalYear]
               ,[ExecutionId]
               ,[IntegrityNeedId]
               ,[IntegrityResultTypeId]
               ,[IntegrityRunDateTime]
               ,[CreatedDate])
    SELECT DISTINCT 
             ex.FiscalYear
            ,ex.ExecutionId
            ,ind.IntegrityNeedId
            ,0
            ,@IntegrityRunDateTime
            ,GETUTCDATE()
      FROM process.Execution ex 
      JOIN process.ExecutionProcessSubType exs 	
        ON ex.ExecutionId = exs.ExecutionId	  	  
      JOIN integrity.IntegrityRuleType irt
        ON irt.IntegrityTypeId = exs.ProcessSubTypeId		--Note: IntegrityTypeId is just filterd list of ProcessSubTypes, so this join is ok
      JOIN integrity.IntegrityNeed ind 
        ON ind.IntegrityRuleTypeId = irt.IntegrityRuleTypeId 
       AND ind.FiscalYear = ex.FiscalYear
       AND ind.IsIntegrityNeeded = 1
     WHERE ex.ExecutionId = @ExecutionId

END