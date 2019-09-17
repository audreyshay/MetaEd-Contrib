CREATE TABLE [config].[ExcludeExitWithdrawType]
(
	[FiscalYear] INT NOT NULL , 
    [ExitWithdrawTypeDescriptorId] NCHAR(10) NOT NULL,
	CONSTRAINT [FK_ExcludeExitWithdrawType_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]), 
    CONSTRAINT ExcludeExitWithdrawType_PK PRIMARY KEY CLUSTERED ([FiscalYear], [ExitWithdrawTypeDescriptorId]),
	 
)
