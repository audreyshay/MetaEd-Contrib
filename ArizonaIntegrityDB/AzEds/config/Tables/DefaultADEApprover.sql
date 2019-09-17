CREATE TABLE config.DefaultADEApprover
(
	[DefaultADEApproverUsedId]	NVARCHAR(60) NOT NULL ,
	[StartingFiscalYear]		INT NOT NULL,
	[EndingFiscalYear]			INT NOT NULL,
	CONSTRAINT [PK_DefaultADEApprover] PRIMARY KEY CLUSTERED ([DefaultADEApproverUsedId] ASC ),
	CONSTRAINT [FK_DefaultADEApprover_StartingFY_FiscalYear] FOREIGN KEY ([StartingFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
	--CONSTRAINT [FK_DefaultADEApprover_EndingFY_FiscalYear] FOREIGN KEY ([EndingFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
 )
