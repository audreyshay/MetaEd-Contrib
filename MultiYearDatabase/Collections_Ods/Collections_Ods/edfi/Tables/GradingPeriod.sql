CREATE TABLE [edfi].[GradingPeriod](
	[GradingPeriodDescriptorId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[TotalInstructionalDays] [int] NOT NULL,
	[EndDate] [date] NOT NULL,
	[PeriodSequence] [int] NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [GradingPeriod_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [GradingPeriod_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [GradingPeriod_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsActive] BIT CONSTRAINT [GradingPeriod_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_GradingPeriod] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[GradingPeriodDescriptorId] ASC,
	[SchoolId] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[GradingPeriod] ADD CONSTRAINT [FK_GradingPeriod_GradingPeriodDescriptorId] 
	FOREIGN KEY([GradingPeriodDescriptorId])
	REFERENCES [edfi].[GradingPeriodDescriptor] ([GradingPeriodDescriptorId])
GO

ALTER TABLE [edfi].[GradingPeriod] ADD CONSTRAINT [FK_GradingPeriod_School_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear], [SchoolId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the grading period during the school year in which the grade is offered (e.g., 1st cycle, 1st semester)' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'GradingPeriodDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the first day of the GradingPeriod.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total days available for educational instruction during the grading period.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'TotalInstructionalDays'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the last day of the GradingPeriod.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The sequential order of this period relative to other periods.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod', @level2type=N'COLUMN',@level2name=N'PeriodSequence'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents the time span for which grades are reported.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'GradingPeriod'
GO

CREATE NONCLUSTERED INDEX [DBA_GradingPeriod_SchoolYear_Modified] ON [edfi].[GradingPeriod]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
