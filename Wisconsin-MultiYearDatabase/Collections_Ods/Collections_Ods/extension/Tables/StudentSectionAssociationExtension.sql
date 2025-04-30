CREATE TABLE [extension].[StudentSectionAssociationExtension](
    [StudentUSI] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [EntryDate] [DATE] NOT NULL,
    [UniqueSectionCode] [NVARCHAR](255) NOT NULL,
    [SequenceOfCourse] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [ClassroomIdentificationCode] [NVARCHAR](20) NOT NULL,
    [ClassPeriodName] [NVARCHAR](20) NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    CONSTRAINT [StudentSectionAssociationExtension_PK] PRIMARY KEY CLUSTERED (
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
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the Section that is defined by the classroom, the subjects taught, and the instructors who are assigned.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'UniqueSectionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a section is part of a sequence of parts for a course, the number of the sequence. If the course has only one part, the value of this section attribute should be 1.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SequenceOfCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the Session during the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'ClassroomIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'ClassPeriodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO



ALTER TABLE [extension].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSchoolAssociation] 
	FOREIGN KEY ([SchoolYear],[StudentUSI], [SchoolId], [EntryDate])
	REFERENCES [edfi].[StudentSchoolAssociation] ([SchoolYear],[StudentUSI], [SchoolId], [EntryDate])
	ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_StudentSchoolAssociation]
	ON [extension].[StudentSectionAssociationExtension]([SchoolYear], [SchoolId], [StudentUSI], [EntryDate])
GO

ALTER TABLE [extension].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY (
		[SchoolYear],
		[SchoolId],
		[ClassPeriodName],
		[ClassroomIdentificationCode],
		[LocalCourseCode],
		[TermDescriptorId],
		[UniqueSectionCode],
		[SequenceOfCourse],
		[StudentUSI],
		[BeginDate])
	REFERENCES [edfi].[StudentSectionAssociation] (
		[SchoolYear],
		[SchoolId],
		[ClassPeriodName],
		[ClassroomIdentificationCode],
		[LocalCourseCode],
		[TermDescriptorId],
		[UniqueSectionCode],
		[SequenceOfCourse],
		[StudentUSI],
		[BeginDate])
	ON DELETE CASCADE
	ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_StudentSectionAssociation]
ON [extension].[StudentSectionAssociationExtension]([SchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [LocalCourseCode] ASC, [TermDescriptorId] ASC, [UniqueSectionCode] ASC, [SequenceOfCourse] ASC, [BeginDate] ASC, [ClassPeriodName] ASC, [ClassroomIdentificationCode] ASC)
GO