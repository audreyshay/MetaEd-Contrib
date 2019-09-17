CREATE PROCEDURE [915].[GetResourceTypes]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		 [ResourceTypeId]
		  ,[Resource]
		  ,[RequestBodyPropertyNameToExtractEducationOrganizationId]
		  ,[AggregateRootEntityName]
		  ,[BeginFiscalYear]
		  ,[EndFiscalYear]
		  , ISNULL([BeginFiscalYear], 0) AS BeginFiscalYearNumber
		  , ISNULL([EndFiscalYear], 9999) AS EndFiscalYearNumber
		  ,[SQLCommand]
		  ,[IsValidForStudent915]
		  ,[IsValidForNonStudent915]
	FROM AzEds.config.ResourceType 

END