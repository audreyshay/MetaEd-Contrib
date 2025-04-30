CREATE TABLE [edfi].[Location](
	[SchoolId] [int] NOT NULL,
	[ClassroomIdentificationCode] [nvarchar](20) NOT NULL,
	[MaximumNumberOfSeats] [int] NULL,
	[OptimalNumberOfSeats] [int] NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [Location_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [Location_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [Location_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsActive] BIT CONSTRAINT [Location_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[ClassroomIdentificationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[Location] ADD CONSTRAINT [FK_Location_School_SchoolId] 
	FOREIGN KEY([SchoolYear],[SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear],[SchoolId])
GO

ALTER TABLE [edfi].[Location] CHECK CONSTRAINT [FK_Location_School_SchoolId]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'ClassroomIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The most number of seats the class can maintain.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'MaximumNumberOfSeats'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of seats that is most favorable to the class.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'OptimalNumberOfSeats'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents the physical space where students gather for a particular class/section. The location may be an indoor or outdoor area designated for the purpose of meeting the educational needs of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Location'
GO

CREATE NONCLUSTERED INDEX [DBA_Location_SchoolYear_Modified] ON [edfi].[Location]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO