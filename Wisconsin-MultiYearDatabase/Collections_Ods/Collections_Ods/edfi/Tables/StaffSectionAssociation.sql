CREATE TABLE [edfi].[StaffSectionAssociation](
	[StaffUSI] [int] NOT NULL,
	[ClassroomIdentificationCode] [nvarchar](20) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](20) NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[TermDescriptorId] [int] NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
	[SequenceOfCourse] [int] NOT NULL,
	[ClassroomPositionDescriptorId] [int] NOT NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[HighlyQualifiedTeacher] [bit] NULL,
	[TeacherStudentDataLinkExclusion] [bit] NULL,
	[PercentageContribution] [decimal](5, 4) NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [StaffSectionAssociation_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [StaffSectionAssociation_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [StaffSectionAssociation_DF_CreateDate]  DEFAULT (getdate()),
	[IsActive] BIT CONSTRAINT [DF_StaffSectionAssociation_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_TeacherSectionAssociation] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermDescriptorId] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[StaffUSI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[StaffSectionAssociation] ADD CONSTRAINT [FK_StaffSectionAssociation_ClassroomPositionDescriptor_ClassroomPositionDescriptorId] 
	FOREIGN KEY([ClassroomPositionDescriptorId])
	REFERENCES [edfi].[ClassroomPositionDescriptor] ([ClassroomPositionDescriptorId])
GO

ALTER TABLE [edfi].[StaffSectionAssociation] ADD CONSTRAINT [FK_StaffSectionAssociation_Section_SchoolId] 
	FOREIGN KEY([SchoolYear],[SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	REFERENCES [edfi].[Section] ([SchoolYear],[SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[StaffSectionAssociation] ADD CONSTRAINT [FK_StaffSectionAssociation_Staff_StaffUSI] 
	FOREIGN KEY([SchoolYear],[StaffUSI])
	REFERENCES [edfi].[Staff] ([SchoolYear],[StaffUSI])
GO

CREATE NONCLUSTERED INDEX IX_StaffSectionAssociation_SchoolYear_SchoolId_StaffUSI_IsActive
	ON [edfi].[StaffSectionAssociation] ([SchoolYear],[SchoolId], [StaffUSI], [IsActive])
	INCLUDE ([ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse]);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'StaffUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'ClassroomIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).   NEDM: Class Period' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'ClassPeriodName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'LocalCourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the section, that is defined for a campus by the classroom, the subjects taught, and the instructors that are assigned.  NEDM: Unique Course Code' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'UniqueSectionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a section is part of a sequence of parts for a course, the number if the sequence.  If the course has only onle part, the value of this section attribute should be 1.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'SequenceOfCourse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'ClassroomPositionDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of a teacher''s assignment to the Section. If blank, defaults to the first day of the first grading period for the Section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the last day of a staff member''s assignment to the Section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a teacher is classified as highly qualified for his/her assignment according to state definition. This attribute indicates the teacher is highly qualified for this section being taught.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacher'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the entire section is excluded from calculation of value-added or growth attribution calculations used for a particular teacher evaluation.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'TeacherStudentDataLinkExclusion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the percentage of the total scheduled course time, academic standards, and/or learning activities delivered in this section by this staff member. A teacher of record designation may be based solely or partially on this contribution percentage.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation', @level2type=N'COLUMN',@level2name=N'PercentageContribution'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association indicates the class sections to which a staff member is assigned.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffSectionAssociation'
GO

CREATE NONCLUSTERED INDEX IX_StaffSectionAssociation_SchoolYear_IsActive
	ON [edfi].[StaffSectionAssociation] ([SchoolYear],[IsActive])
	INCLUDE ([StaffUSI],[ClassroomIdentificationCode],[SchoolId],[ClassPeriodName],[LocalCourseCode],[TermDescriptorId],[UniqueSectionCode],[SequenceOfCourse])

	GO

CREATE NONCLUSTERED INDEX [DBA_StaffSectionAssociation_SchoolYear_Modified] ON [edfi].[StaffSectionAssociation]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO