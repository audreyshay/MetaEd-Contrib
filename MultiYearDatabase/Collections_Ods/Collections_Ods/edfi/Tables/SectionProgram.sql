CREATE TABLE [edfi].[SectionProgram](
	[ClassroomIdentificationCode] [nvarchar](20) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](20) NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[TermDescriptorId] [int] NOT NULL,
	[UniqueSectionCode] [nvarchar](255) NOT NULL,
	[SequenceOfCourse] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SectionProgram] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[ClassroomIdentificationCode] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[LocalCourseCode] ASC,
	[TermDescriptorId] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC,
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[SectionProgram] ADD CONSTRAINT [SectionProgram_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [edfi].[SectionProgram] ADD CONSTRAINT [FK_SectionProgram_Program] 
	FOREIGN KEY([SchoolYear],[EducationOrganizationId], [ProgramTypeId], [ProgramName])
	REFERENCES [edfi].[Program] ([SchoolYear],[EducationOrganizationId], [ProgramTypeId], [ProgramName])
GO

ALTER TABLE [edfi].[SectionProgram] ADD CONSTRAINT [FK_SectionProgram_Section_SchoolId] 
	FOREIGN KEY([SchoolYear],[SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	REFERENCES [edfi].[Section] ([SchoolYear], [SchoolId], [ClassPeriodName], [ClassroomIdentificationCode], [LocalCourseCode], [TermDescriptorId], [UniqueSectionCode], [SequenceOfCourse])
	ON UPDATE CASCADE
	ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'ClassroomIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).   NEDM: Class Period' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'ClassPeriodName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'LocalCourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the section, that is defined for a campus by the classroom, the subjects taught, and the instructors that are assigned.  NEDM: Unique Course Code' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'UniqueSectionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a section is part of a sequence of parts for a course, the number if the sequence.  If the course has only onle part, the value of this section attribute should be 1.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'SequenceOfCourse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Program' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'ProgramTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'ProgramName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EducationOrganization Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional reference to program (e.g., CTE) to which the section is associated.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'SectionProgram'
GO


