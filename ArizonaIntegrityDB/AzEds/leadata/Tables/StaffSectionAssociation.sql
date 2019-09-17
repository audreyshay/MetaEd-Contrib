CREATE TABLE [leadata].[StaffSectionAssociation](
	[FiscalYear] [int] NOT NULL,
	[StaffUSI] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
    [ClassPeriodName]                 NVARCHAR (60)  CONSTRAINT [StaffSectionAssociation_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
    [ClassroomIdentificationCode]     NVARCHAR (20)  CONSTRAINT [StaffSectionAssociation_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [StaffSectionAssociation_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
    [SequenceOfCourse]                INT           CONSTRAINT [StaffSectionAssociation_DF_SequenceOfCourse] DEFAULT -2  NOT NULL,
	[ClassroomPositionDescriptorId] [int] NOT NULL,
	[ClassroomPositionDescriptorCodeValue] [nvarchar](50) NOT NULL,
	[ClassroomPositionDescriptorShortDescription] [nvarchar](1024) NOT NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[HighlyQualifiedTeacher] [bit] NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[TeacherStudentDataLinkExclusion] [bit] NULL,
	[PercentageContribution] [decimal](5, 4) NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [StaffSectionAssociation_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_TeacherSectionAssociation] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StaffUSI] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermTypeId] ASC,
	[SchoolYear] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StaffSectionAssociation] ADD  DEFAULT ('') FOR [UniqueSectionCode]
GO

ALTER TABLE [leadata].[StaffSectionAssociation] ADD  CONSTRAINT [StaffSectionAssociation_DF_Id]  DEFAULT (newid()) FOR [SourceId]
GO

ALTER TABLE [leadata].[StaffSectionAssociation] ADD  CONSTRAINT [StaffSectionAssociation_DF_CreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StaffSectionAssociation] ADD  CONSTRAINT [StaffSectionAssociation_DF_LastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StaffSectionAssociation] ADD  CONSTRAINT [StaffSectionAssociation_DF_Loaddate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StaffSectionAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_StaffSectionAssociation_Section_SchoolId] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
REFERENCES [leadata].[Section] ([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StaffSectionAssociation] CHECK CONSTRAINT [FK_StaffSectionAssociation_Section_SchoolId]
GO

ALTER TABLE [leadata].[StaffSectionAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_StaffSectionAssociation_Staff_StaffUSI] FOREIGN KEY([StaffUSI])
REFERENCES [leadata].[Staff] ([StaffUSI])
GO

ALTER TABLE [leadata].[StaffSectionAssociation] CHECK CONSTRAINT [FK_StaffSectionAssociation_Staff_StaffUSI]
GO
CREATE NONCLUSTERED INDEX [IX_TeacherSectionAssociation_StudentRecord]
    ON [leadata].[StaffSectionAssociation]([FiscalYear] ASC, [ClassroomIdentificationCode] ASC, [SchoolId] ASC, [TermTypeId] ASC, [ClassPeriodName] ASC, [LocalCourseCode] ASC, [StaffUSI] ASC);


