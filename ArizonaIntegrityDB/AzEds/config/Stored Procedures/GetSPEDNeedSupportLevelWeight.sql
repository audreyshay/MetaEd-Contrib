CREATE PROCEDURE [config].[GetSPEDNeedSupportLevelWeight]

AS
BEGIN
	SELECT [FiscalYear], [GradeLevelTypeId], [StudentNeedDescriptorId], [ResourceWeight], [SelfContainedWeight]  
	FROM [config].[SPEDNeedSupportLevelWeight]
END
