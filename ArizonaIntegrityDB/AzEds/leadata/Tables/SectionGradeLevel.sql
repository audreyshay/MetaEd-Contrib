CREATE TABLE [leadata].[SectionGradeLevel](
	[FiscalYear] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
    [ClassPeriodName]                 NVARCHAR (60)  CONSTRAINT [SectionGradeLevel_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
    [ClassroomIdentificationCode]     NVARCHAR (20)  CONSTRAINT [SectionGradeLevel_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [SectionGradeLevel_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[GradeLevelDescriptorId] [int] NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
    [SequenceOfCourse]                INT           CONSTRAINT [SectionGradeLevel_DF_SequenceOfCourse] DEFAULT -2  NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SectionGradeLevel] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermTypeId] ASC,
	[SchoolYear] ASC,
	[GradeLevelDescriptorId] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[SectionGradeLevel] ADD  DEFAULT ('') FOR [UniqueSectionCode]
GO

ALTER TABLE [leadata].[SectionGradeLevel] ADD  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[SectionGradeLevel]  WITH NOCHECK ADD  CONSTRAINT [FK_SectionGradeLevel_Section] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse] , [SessionName])
REFERENCES [leadata].[Section] ([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[SectionGradeLevel] CHECK CONSTRAINT [FK_SectionGradeLevel_Section]
GO

