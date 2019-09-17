CREATE PROCEDURE [config].[GetSPEDServiceCodeFundability]

AS
BEGIN
	SELECT [FiscalYear], [GradeLevelTypeId], [ServiceCodeDescriptorId], [IsSelfContained], [IsSPEDFundable], [NonFundableFundingTypeId]
	FROM [config].[SPEDServiceCodeFundability] 
END
