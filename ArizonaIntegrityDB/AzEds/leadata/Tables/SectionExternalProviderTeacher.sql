CREATE TABLE [leadata].[SectionExternalProviderTeacher](
	[FiscalYear] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](60) CONSTRAINT [SectionExternalProviderTeacher_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
	[ClassroomIdentificationCode] [nvarchar](20) CONSTRAINT [SectionExternalProviderTeacher_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [SectionExternalProviderTeacher_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[ExternalProviderName] [nvarchar](75) NOT NULL,
	[ProviderTeacherLastName] [nvarchar](50) NOT NULL,
	[ProviderTeacherFirstName] [nvarchar](50) NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
	[SequenceOfCourse] [int] NOT NULL CONSTRAINT [SectionExternalProviderTeacher_DF_SequenceOfCourse] DEFAULT -2,
	[ClassroomPositionDescriptorId] [int] NULL,
	[ClassroomPositionDescriptorCodeValue] [nvarchar](50) NULL,
	[ClassroomPositionDescriptorShortDescription] [nvarchar](1024) NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]				[binary](64) CONSTRAINT [SectionExternalProviderTeacher_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_SectionExternalProviderTeacher] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermTypeId] ASC,
	[FiscalYear] ASC,
	[ExternalProviderName] ASC,
	[SchoolYear] ASC,
	[ProviderTeacherLastName] ASC,
	[ProviderTeacherFirstName] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[SectionExternalProviderTeacher] ADD  DEFAULT ('') FOR [UniqueSectionCode]
GO

ALTER TABLE [leadata].[SectionExternalProviderTeacher] ADD  CONSTRAINT [SectionExternalProviderTeacher_DF_CreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[SectionExternalProviderTeacher] ADD  CONSTRAINT [SectionExternalProviderTeacher_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[SectionExternalProviderTeacher]  WITH NOCHECK ADD  CONSTRAINT [FK_SectionExternalProviderTeacher_Section_SchoolId] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
REFERENCES [leadata].[Section] ([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[SectionExternalProviderTeacher] CHECK CONSTRAINT [FK_SectionExternalProviderTeacher_Section_SchoolId]
GO


