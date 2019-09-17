CREATE TABLE [config].[SPEDNeedSupportLevelWeight]
(
	[FiscalYear] INT NOT NULL , 
    [GradeLevelTypeId] INT NOT NULL, 
    [StudentNeedDescriptorId] INT NOT NULL, 
    [ResourceWeight] DECIMAL(10, 4) NULL, 
    [SelfContainedWeight] DECIMAL(10, 4) NULL, 
    CONSTRAINT [PK_SPEDNeedSupportLevelWeight] PRIMARY KEY ([FiscalYear], [GradeLevelTypeId], [StudentNeedDescriptorId]),
)
