CREATE TABLE [config].[TuitionPayerCodeFundingType]
(
	[TuitionPayerCodeFundingTypeId] INT IDENTITY (1, 1) NOT NULL, 
    [TuitionPayerCodeDescriptorId] INT NOT NULL, 
    [FundingTypeId] INT NOT NULL, 
    [StartingFiscalYear] INT NOT NULL, 
    [EndingFiscalYear] INT NULL
	CONSTRAINT [FK_TuitionPayerCodeFundingType_StartingFiscalYear] FOREIGN KEY ([StartingFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]), 
	CONSTRAINT [FK_TuitionPayerCodeFundingType_FundingTypeId] FOREIGN KEY ([FundingTypeId]) REFERENCES [ace].[FundingType] ([FundingTypeId]), 
	CONSTRAINT [PK_TuitionPayerCodeFundingType] PRIMARY KEY CLUSTERED (TuitionPayerCodeFundingTypeId)
);
