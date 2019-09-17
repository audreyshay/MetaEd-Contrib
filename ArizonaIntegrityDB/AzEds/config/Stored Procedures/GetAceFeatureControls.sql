CREATE PROCEDURE [config].[GetAceFeatureControls]
AS
BEGIN
	SELECT [AceFeatureControlId] 
		, [AceFeatureId] 
		, [StartingFiscalYear] 
		, [EndingFiscalYear] 
	FROM [config].[AceFeatureControl]
END