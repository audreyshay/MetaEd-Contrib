CREATE FUNCTION [integrity].[GetIntegrityHistoryForExecutionMessage]
(	
	@Executionid AS INT,
	@MessageId AS VARCHAR(36)
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
	  FROM process.Execution ex  
	      JOIN process.MessageLog ML 
	        ON ML.ExecutionId= ex.ExecutionId
	      JOIN integrity.IntegrityHistory ih
		    ON ih.ExecutionId = ex.ExecutionId 
		       AND ih.FiscalYear=ex.Fiscalyear
	           AND (Ih.MessageId = ML.MessageId)
	      JOIN integrity.IntegrityNeed ind 
	        ON ind.IntegrityNeedId = ih.IntegrityNeedId
		       AND ind.FiscalYear = ih.FiscalYear
	  WHERE ex.ExecutionId = @Executionid 
	  AND ML.MessageId=@MessageId
)