CREATE TABLE [ace].[UnitOfWork]
(
	UnitOfWorkId INT		NOT NULL IDENTITY, 
	ExecutionId INT			NOT NULL,
	FiscalYear	INT			NOT NULL,
    StudentUSI INT			NOT NULL,
	SchoolId INT			NOT NULL,
	MessageId NVARCHAR(36)	NULL,
	ADM BIT					NULL,
	SPED BIT				NULL,
	ELL BIT					NULL
    CONSTRAINT [PK_UnitOfWork] PRIMARY KEY CLUSTERED (UnitOfWorkId ASC)
	CONSTRAINT [FK_UnitOfWork_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
    CONSTRAINT [FK_UnitOfWork_Student] FOREIGN KEY ([StudentUSI]) REFERENCES [leadata].[Student] ([StudentUSI]),
	CONSTRAINT [FK_UnitOfWork_School] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])
);
GO
CREATE NONCLUSTERED INDEX [IX_UnitOfWork_ExecutionId_StudentUSI] ON [ace].[UnitOfWork]
(
	[ExecutionId] ASC,
	[StudentUSI] ASC,
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO