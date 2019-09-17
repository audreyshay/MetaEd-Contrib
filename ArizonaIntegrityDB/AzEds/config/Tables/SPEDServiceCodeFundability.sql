CREATE TABLE [config].[SPEDServiceCodeFundability]
(
    [FiscalYear] INT NOT NULL, 
    [GradeLevelTypeId] INT NOT NULL, 
    [ServiceCodeDescriptorId] INT NOT NULL, 
    [IsSelfContained] BIT NOT NULL, 
    [IsSPEDFundable] BIT NOT NULL, 
    [NonFundableFundingTypeId] INT NULL, 
    CONSTRAINT [PK_SPEDServiceCodeFundability] PRIMARY KEY ([FiscalYear], [GradeLevelTypeId], [ServiceCodeDescriptorId])
)
