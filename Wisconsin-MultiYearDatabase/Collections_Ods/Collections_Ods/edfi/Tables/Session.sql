CREATE TABLE [edfi].[Session](
	[SchoolId] [int] NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[TermDescriptorId] [int] NOT NULL,
	[SessionName] [nvarchar](60) NOT NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalInstructionalDays] [int] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [Session_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [Session_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [Session_DF_CreateDate]  DEFAULT (getdate()),
	[IsActive] BIT CONSTRAINT [Session_DF_IsActive] DEFAULT ((1)) NOT NULL, 
	CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[TermDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[Session] ADD CONSTRAINT [FK_Session_School_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear], [SchoolId])
GO

ALTER TABLE [edfi].[Session] ADD CONSTRAINT [FK_Session_SchoolYearType_SchoolYear] 
	FOREIGN KEY([SchoolYear])
	REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

ALTER TABLE [edfi].[Session] ADD CONSTRAINT [FK_Session_TermDescriptor_TermDescriptorId] 
	FOREIGN KEY([TermDescriptorId])
	REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year (e.g., 2010/11).' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).  NEDM: Session Type' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'SessionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the first day of the Session.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the last day of the Session.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of instructional days in the school calendar.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session', @level2type=N'COLUMN',@level2name=N'TotalInstructionalDays'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents the prescribed span of time when an education institution is open, instruction is provided and students are under the direction and guidance of teachers and/or education institution administration. A session may be interrupted by one or more vacations.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Session'
GO

CREATE NONCLUSTERED INDEX [DBA_Session_SchoolYear_Modified] ON [edfi].[Session]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Session_BeginDate]
    ON [edfi].[Session]([BeginDate] DESC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);
GO


