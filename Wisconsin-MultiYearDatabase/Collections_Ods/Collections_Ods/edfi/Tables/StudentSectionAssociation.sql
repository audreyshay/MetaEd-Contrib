
CREATE TABLE [edfi].[StudentSectionAssociation](
	[StudentUSI]						[int] NOT NULL,
	[SchoolId]							[int] NOT NULL,
	[ClassPeriodName]					[nvarchar](20) NOT NULL,
	[ClassroomIdentificationCode]		[nvarchar](20) NOT NULL,
	[LocalCourseCode]					[nvarchar](60) NOT NULL,
	[UniqueSectionCode]					[nvarchar](255) NOT NULL,
	[SequenceOfCourse]					[int] NOT NULL,
	[TermDescriptorId]					[int] NOT NULL,
	[BeginDate]							[date] NOT NULL,
	[EndDate]							[date] NULL,
	[HomeroomIndicator]					[bit] NULL,
	[RepeatIdentifierTypeId]			[int] NULL,
	[TeacherStudentDataLinkExclusion]	[bit] NULL,
	[Id]								[uniqueidentifier] NOT NULL CONSTRAINT [StudentSectionAssociation_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate]					[datetime] NOT NULL CONSTRAINT [StudentSectionAssociation_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate]						[datetime] NOT NULL CONSTRAINT [StudentSectionAssociation_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear]						SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsActive]							BIT CONSTRAINT [StudentSectionAssociation_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_StudentSectionAssociation] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermDescriptorId] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[StudentUSI] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[StudentSectionAssociation] ADD CONSTRAINT [FK_StudentSectionAssociation_RepeatIdentifierType_RepeatIdentifierTypeId] 
	FOREIGN KEY([RepeatIdentifierTypeId])
	REFERENCES [edfi].[RepeatIdentifierType] ([RepeatIdentifierTypeId])
GO

ALTER TABLE [edfi].[StudentSectionAssociation] ADD CONSTRAINT [FK_StudentSectionAssociation_Section_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	REFERENCES [edfi].[Section] ([SchoolYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[StudentSectionAssociation] ADD CONSTRAINT [FK_StudentSectionAssociation_Student_StudentUSI] 
	FOREIGN KEY([SchoolYear],[StudentUSI])
	REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
GO

ALTER TABLE [edfi].[StudentSectionAssociation] ADD CONSTRAINT [FK_StudentSectionAssociation_School] 
	FOREIGN KEY([SchoolYear],[SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear],[SchoolId])
GO

CREATE NONCLUSTERED INDEX IX_StudentSectionAssociation_SchoolYear_SchoolId_StudentUSI_BeginDate_IsActive
	ON [edfi].[StudentSectionAssociation] ([SchoolYear],[SchoolId], [StudentUSI], [IsActive])
	INCLUDE ([LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse], [BeginDate], [ClassPeriodName], [ClassroomIdentificationCode]);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a student by a state education agency.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'StudentUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period or AB schedules).
=' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'ClassPeriodName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'ClassroomIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'LocalCourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the section, that is defined for a campus by the classroom, the subjects taught, and the instructors that are assigned.  NEDM: Unique Course Code' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'UniqueSectionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a section is part of a sequence of parts for a course, the number if the sequence.  If the course has only onle part, the value of this section attribute should be 1.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'SequenceOfCourse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the withdrawal or exit of the Student from the Section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Section is the student''s homeroom. Homeroom period may the convention for taking daily attendance.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'HomeroomIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication as to whether a student has previously taken a given course.  NEDM: Repeat Identifier  Repeated, counted in grade point average  Repeated, not counted in grade point average  Not repeated  Other' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'RepeatIdentifierTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the student-section combination is excluded from calculation of value-added or growth attribution calculations used for a particular teacher evaluation.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation', @level2type=N'COLUMN',@level2name=N'TeacherStudentDataLinkExclusion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association indicates the course sections to which a student is assigned.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentSectionAssociation'
GO

CREATE NONCLUSTERED INDEX [DBA_StudentSectionAssociation_SchoolYear_Modified] ON [edfi].[StudentSectionAssociation]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [DBA_StudentSectionAssociation_ID] ON [edfi].[StudentSectionAssociation]
(
	[Id]
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
GO
