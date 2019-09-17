CREATE TABLE [leadata].[SectionCourseCharacteristic](
	[FiscalYear] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
    [ClassPeriodName]                 NVARCHAR (60)  CONSTRAINT [SectionCourseCharacteristic_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
    [ClassroomIdentificationCode]     NVARCHAR (20)  CONSTRAINT [SectionCourseCharacteristic_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [SectionCourseCharacteristic_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[CourseLevelCharacteristicTypeId] [int] NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
    [SequenceOfCourse]                INT           CONSTRAINT [SectionCourseCharacteristic_DF_SequenceOfCourse] DEFAULT -2  NOT NULL,
	[CourseLevelCharacteristicTypeCodeValue] [nvarchar](50) NOT NULL,
	[CourseLevelCharacteristicTypeShortDescription] [nvarchar](1024) NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SectionCourseCharacteristic] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermTypeId] ASC,
	[CourseLevelCharacteristicTypeId] ASC,
	[SchoolYear] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[SectionCourseCharacteristic] ADD  DEFAULT ('') FOR [UniqueSectionCode]
GO

ALTER TABLE [leadata].[SectionCourseCharacteristic] ADD  CONSTRAINT [SectionCourseCharacteristic_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[SectionCourseCharacteristic]  WITH NOCHECK ADD  CONSTRAINT [FK_SectionCourseCharacteristic_Section] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse] , [SessionName])
REFERENCES [leadata].[Section] ([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[SectionCourseCharacteristic] CHECK CONSTRAINT [FK_SectionCourseCharacteristic_Section]
GO


