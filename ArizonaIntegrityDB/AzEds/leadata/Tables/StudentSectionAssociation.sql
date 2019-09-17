CREATE TABLE [leadata].[StudentSectionAssociation](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
    [ClassPeriodName]                 NVARCHAR (60)  CONSTRAINT [StudentSectionAssociation_DF_ClassPeriodName] DEFAULT 'Not Applicable' NOT NULL ,
    [ClassroomIdentificationCode]     NVARCHAR (20)  CONSTRAINT [StudentSectionAssociation_DF_ClassroomIdentificationCode] DEFAULT 'Not Applicable' NOT NULL ,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermTypeId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SessionName]              NVARCHAR (60) CONSTRAINT [StudentSectionAssociation_DF_SessionName] DEFAULT 'Not Applicable' NOT NULL ,
	[BeginDate] [date] NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
    [SequenceOfCourse]                INT           CONSTRAINT [StudentSectionAssociation_DF_SequenceOfCourse] DEFAULT -2  NOT NULL,
	[RepeatIdentifierTypeId] [int] NULL,
	[EndDate] [date] NULL,
	[HomeroomIndicator] [bit] NULL,
	[TeacherStudentDataLinkExclusion] [bit] NULL,
	[CourseEntryDescriptorId] [int] NULL,
	[CourseExitDescriptorId] [int] NULL,
	[DualCredit] [bit] NOT NULL,
	[ConcurrentEnrollment] [bit] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [PK_StudentSectionAssociation] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermTypeId] ASC,
	[SchoolYear] ASC,
	[BeginDate] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  DEFAULT ('') FOR [UniqueSectionCode]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  DEFAULT ((0)) FOR [DualCredit]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  DEFAULT ((0)) FOR [ConcurrentEnrollment]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  CONSTRAINT [StudentSectionAssociation_DF_Id]  DEFAULT (newid()) FOR [SourceId]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  CONSTRAINT [StudentSectionAssociation_DF_CreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  CONSTRAINT [StudentSectionAssociation_DF_LastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  CONSTRAINT [StudentSectionAssociation_DF_Loaddate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentSectionAssociation] ADD  DEFAULT ((0)) FOR [HashValue]
GO

ALTER TABLE [leadata].[StudentSectionAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentSectionAssociation_Section_SchoolId] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
REFERENCES [leadata].[Section] ([FiscalYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermTypeId], [SchoolYear], [UniqueSectionCode], [SequenceOfCourse], [SessionName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentSectionAssociation] CHECK CONSTRAINT [FK_StudentSectionAssociation_Section_SchoolId]
GO

ALTER TABLE [leadata].[StudentSectionAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentSectionAssociation_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
GO

ALTER TABLE [leadata].[StudentSectionAssociation] CHECK CONSTRAINT [FK_StudentSectionAssociation_Student_StudentUSI]
GO
CREATE NONCLUSTERED INDEX [IX_StudentSectionAssociation_StudentRecord]
    ON [leadata].[StudentSectionAssociation]([FiscalYear] ASC, [ClassroomIdentificationCode] ASC, [SchoolId] ASC, [TermTypeId] ASC, [ClassPeriodName] ASC, [LocalCourseCode] ASC, [StudentUSI] ASC);


