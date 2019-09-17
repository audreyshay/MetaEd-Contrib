CREATE TABLE [leadata].[ClassPeriod]
(
	[FiscalYear] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](60) NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[Loaddate] [datetime] CONSTRAINT [ClassPeriod_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[HashValue] [Binary](64) DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_ClassPeriod] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [SchoolId] ASC, [ClassPeriodName] ASC),
	CONSTRAINT [FK_ClassPeriod_School_SchoolId] FOREIGN KEY([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])
);
