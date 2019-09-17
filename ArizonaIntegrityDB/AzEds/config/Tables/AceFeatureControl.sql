CREATE TABLE [config].[AceFeatureControl]
(
	[AceFeatureControlId] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
	[AceFeatureId] INT NOT NULL, 
    [StartingFiscalYear] INT NOT NULL, 
    [EndingFiscalYear] INT NULL

	CONSTRAINT [FK_StartingFY_FiscalYear] FOREIGN KEY ([StartingFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]), 
	CONSTRAINT [FK_EndingFY_FiscalYear] FOREIGN KEY ([EndingFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]), 
	CONSTRAINT [FK_AceFeature_FeatureId] FOREIGN KEY ([AceFeatureId]) REFERENCES [config].[AceFeature] ([AceFeatureId]), 

)
