CREATE TABLE [config].[ELLFunding]
(
	[FiscalYear] INT NOT NULL , 
    [ServiceCodeDescriptorId] INT NOT NULL, 
    [IsFundable] BIT NOT NULL, 
    PRIMARY KEY ([FiscalYear], [ServiceCodeDescriptorId])
)
