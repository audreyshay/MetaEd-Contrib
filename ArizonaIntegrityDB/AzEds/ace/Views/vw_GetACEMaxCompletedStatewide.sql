CREATE VIEW [ace].[vw_GetACEMaxCompletedStatewide]
	AS 
	SELECT Max(ExecutionId) AS ExecutionId
	FROM process.Execution 
	WHERE StatusTypeId = 6 AND
		ProcessTypeId = 2 AND 
		ExecutionTypeId = 1


