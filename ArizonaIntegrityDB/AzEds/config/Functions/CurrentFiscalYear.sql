CREATE FUNCTION [config].[CurrentFiscalYear] ()
RETURNS INT
AS
BEGIN
	DECLARE @CurrentFY as INT
	 	
	SELECT @CurrentFY = MAX(FiscalYear)
	FROM [config].[FiscalYear]
	WHERE IsCurrent = 1

	RETURN @CurrentFY
END
