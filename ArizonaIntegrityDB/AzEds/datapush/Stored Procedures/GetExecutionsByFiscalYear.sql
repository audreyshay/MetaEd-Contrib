
/*  Used by datapush UI*/

CREATE PROCEDURE [datapush].[GetExecutionsByFiscalYear]
	@FiscalYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT ExecutionId,
			ExecutionTypeId,
			FiscalYear, 
		-- convert from UTC to local.
		CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, InitiatedDateTime), DATENAME(TzOffset, SYSDATETIMEOFFSET()))) AS DataCaptureDate
	FROM	
		Process.Execution
	WHERE 
		ProcessTypeId = 2
		AND StatusTypeId = 6
		AND FiscalYear = @FiscalYear
		-- need to expand to include logic to include way to get other than statewide runs
	ORDER BY ExecutionId DESC

 END


GO


