CREATE TABLE [entity].[AttendanceEventCategoryType](
	[FiscalYear] [int] NOT NULL,
	[AttendanceEventCategoryTypeId] [int] NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AttendanceEventCategoryType] PRIMARY KEY CLUSTERED 
([FiscalYear], [AttendanceEventCategoryTypeId])WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [entity].[AttendanceEventCategoryType] ADD  CONSTRAINT [AttendanceEventCategoryType_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [entity].[AttendanceEventCategoryType] ADD  CONSTRAINT [AttendanceEventCategoryType_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [entity].[AttendanceEventCategoryType] ADD  CONSTRAINT [AttendanceEventCategoryType_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
