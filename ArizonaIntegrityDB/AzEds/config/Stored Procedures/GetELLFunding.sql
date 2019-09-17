CREATE PROCEDURE [config].[GetELLFunding]

AS
BEGIN
	SELECT [FiscalYear], [ServiceCodeDescriptorId], [IsFundable]
	FROM [config].[ELLFunding] 
END
