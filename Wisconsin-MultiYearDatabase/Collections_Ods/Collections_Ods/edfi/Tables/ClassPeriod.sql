CREATE TABLE [edfi].[ClassPeriod](
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](20) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [ClassPeriod_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [ClassPeriod_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [ClassPeriod_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsActive] BIT CONSTRAINT [ClassPeriod_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_ClassPeriod] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[ClassPeriod] ADD CONSTRAINT [FK_ClassPeriod_School_SchoolId] 
	FOREIGN KEY([SchoolYear],[SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear],[SchoolId])
GO

ALTER TABLE [edfi].[ClassPeriod] CHECK CONSTRAINT [FK_ClassPeriod_School_SchoolId]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassPeriod', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).   NEDM: Class Period' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassPeriod', @level2type=N'COLUMN',@level2name=N'ClassPeriodName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents the designation of a regularly scheduled series of class meetings at designated times and days of the week.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassPeriod'
GO

CREATE NONCLUSTERED  INDEX [DBA_ClassPeriod_SchoolYear_Modified] ON [edfi].[ClassPeriod]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


