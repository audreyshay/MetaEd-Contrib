CREATE TABLE [config].[AOIWithdrawTypeProjectsToEndOfYear]
(
    [FiscalYear] INT NOT NULL, 
    [ExitWithdrawTypeDescriptorId] INT NOT NULL, 

	CONSTRAINT [FK_AOIWithdrawTypeProjectsToEndOfYear_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
)

