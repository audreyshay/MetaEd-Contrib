CREATE TABLE [extension].[DisciplineActionExtension](
	[DisciplineActionIdentifier] [NVARCHAR](20) NOT NULL,
	[StudentUSI] [INT] NOT NULL,
	[DisciplineDate] [DATE] NOT NULL,
	[ModifiedTermTypeId] [INT] NULL,
	[EarlyReinstatementCondition] [BIT] NULL,
	[SchoolYear] [SMALLINT] NOT NULL,
	CONSTRAINT [DisciplineActionExtension_PK] PRIMARY KEY CLUSTERED (
		[SchoolYear], 
		[DisciplineActionIdentifier] ASC,
		[StudentUSI] ASC,
		[DisciplineDate] ASC
		
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [extension].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_DisciplineAction] 
	FOREIGN KEY ([SchoolYear],[DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
	REFERENCES [edfi].[DisciplineAction] ([SchoolYear],[DisciplineActionIdentifier], [StudentUSI], [DisciplineDate])
	ON DELETE CASCADE

GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionExtension_DisciplineAction]
	ON [extension].[DisciplineActionExtension]([SchoolYear], [DisciplineActionIdentifier] ASC, [StudentUSI] ASC, [DisciplineDate] ASC)
GO

ALTER TABLE [extension].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_ModifiedTermType] 
	FOREIGN KEY ([ModifiedTermTypeId])
	REFERENCES [extension].[ModifiedTermType] ([ModifiedTermTypeId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionExtension_ModifiedTermType]
	ON [extension].[DisciplineActionExtension]([ModifiedTermTypeId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOCUMENTATION', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reference to modifiedtermtype.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'ModifiedTermTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Following an expulsion, the student had early reinstatement condition to return to school prior to the end of the expulsion.''', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'EarlyReinstatementCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier assigned by the education organization to the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineDate'
GO