CREATE TABLE [edfi].[SessionGradingPeriod](
	[SchoolYear] [smallint] NOT NULL,
	[TermDescriptorId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[GradingPeriodDescriptorId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [SessionGradingPeriod_DF_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SessionGradingPeriod] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[TermDescriptorId] ASC,
	[SchoolId] ASC,
	[GradingPeriodDescriptorId] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[SessionGradingPeriod] ADD CONSTRAINT [FK_SessionGradingPeriod_GradingPeriod_SchoolId] 
	FOREIGN KEY([SchoolYear], [GradingPeriodDescriptorId], [SchoolId], [BeginDate])
	REFERENCES [edfi].[GradingPeriod] ([SchoolYear], [GradingPeriodDescriptorId], [SchoolId], [BeginDate])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[SessionGradingPeriod] ADD CONSTRAINT [FK_SessionGradingPeriod_Session_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId], [TermDescriptorId])
	REFERENCES [edfi].[Session] ([SchoolYear], [SchoolId], [TermDescriptorId])
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod', @level2type=N'COLUMN',@level2name=N'GradingPeriodDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the first day of the grading period.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grading periods associated with the session calendar.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SessionGradingPeriod'
GO


