CREATE TABLE [config].[FiscalYear] (
    [FiscalYear] INT  NOT NULL,
    [StartDate]  DATE NOT NULL,
    [EndDate]    DATE NOT NULL,
    [IsCurrent]  BIT  NOT NULL,
    [IsActive]   BIT  NOT NULL,
    CONSTRAINT [FiscalYear_PK] PRIMARY KEY CLUSTERED ([FiscalYear] ASC)
);



GO

ALTER TABLE [config].[FiscalYear]
	ADD CONSTRAINT CK_FiscalYear_IsCurrent CHECK ([IsCurrent] = 0 OR config.FiscalYearConstraint ([FiscalYear]) = 0)
GO

