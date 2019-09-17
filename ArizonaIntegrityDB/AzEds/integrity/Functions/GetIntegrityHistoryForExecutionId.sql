
CREATE FUNCTION [integrity].[GetIntegrityHistoryForExecutionId]
(	
	@Executionid AS INT,
	@MessageId AS NVARCHAR(36) = null
)
RETURNS TABLE 
AS
RETURN 
(		
	 SELECT ex.ExecutionId, 
			ih.IntegrityHistoryId, 
			ind.IntegrityNeedId, 
			ind.FiscalYear, 
			ind.IntegrityRuleTypeId, 
			ind.IsIntegrityNeeded, 
			ind.StudentUSI, 
			ind.StudentUniqueId,
			ind.SchoolId, 
			ind.SchoolEntryDate
	  FROM process.Execution (nolock) ex  
	      JOIN process.MessageLog (nolock) ML 
	        ON ML.ExecutionId= ex.ExecutionId
	      JOIN integrity.IntegrityHistory (nolock) ih
		    ON ih.ExecutionId = ex.ExecutionId 
		       AND ih.FiscalYear=ex.Fiscalyear
	           AND (@MessageId IS NULL OR Ih.MessageId = ML.MessageId)
	      JOIN integrity.IntegrityNeed (nolock) ind 
	        ON ind.IntegrityNeedId = ih.IntegrityNeedId
		       AND ind.FiscalYear = ih.FiscalYear
	  WHERE ex.ExecutionId = @Executionid 
	        AND (@MessageId IS NULL OR ML.MessageId = @MessageId)
)