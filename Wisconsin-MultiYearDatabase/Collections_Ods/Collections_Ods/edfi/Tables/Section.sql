CREATE TABLE [edfi].[Section](
	[SchoolId] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](20) NOT NULL,
	[ClassroomIdentificationCode] [nvarchar](20) NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[TermDescriptorId] [int] NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
    [UniqueSectionCode] [nvarchar](255) NOT NULL,
	[SequenceOfCourse] [int] NOT NULL,
	[EducationalEnvironmentTypeId] [int] NULL,
	[MediumOfInstructionTypeId] [int] NULL,
	[PopulationServedTypeId] [int] NULL,
	[AvailableCreditTypeId] [int] NULL,
	[AvailableCreditConversion] [decimal](9, 2) NULL,
	[InstructionLanguageDescriptorId] [int] NULL,
	[AvailableCredits] [decimal](9, 2) NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [Section_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [Section_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [Section_DF_CreateDate]  DEFAULT (getdate()),
    [IsActive] BIT CONSTRAINT [Section_DF_IsActive] DEFAULT ((1)) NOT NULL,
	[LogicalClassKey] AS CONCAT(SchoolId,'.', SchoolYear,'.', TermDescriptorId,'.',	replace(rtrim(LocalCourseCode),' ','_'),'.', replace(rtrim(UniqueSectionCode),' ','_'),'.', SequenceOfCourse) Persisted
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[SchoolId] ASC,
	[ClassPeriodName] ASC,
	[ClassroomIdentificationCode] ASC,
	[LocalCourseCode] ASC,
	[TermDescriptorId] ASC,
	[UniqueSectionCode] ASC,
	[SequenceOfCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_ClassPeriod_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId], [ClassPeriodName])
	REFERENCES [edfi].[ClassPeriod] ([SchoolYear], [SchoolId], [ClassPeriodName])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_CourseOffering_SchoolId] 
	FOREIGN KEY([SchoolYear], [LocalCourseCode], [SchoolId], [TermDescriptorId])
	REFERENCES [edfi].[CourseOffering] ([SchoolYear], [LocalCourseCode], [SchoolId], [TermDescriptorId])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_CreditType_AvailableCreditTypeId] 
	FOREIGN KEY([AvailableCreditTypeId])
	REFERENCES [edfi].[CreditType] ([CreditTypeId])
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_EducationalEnvironmentType_EducationalEnvironmentTypeId] 
	FOREIGN KEY([EducationalEnvironmentTypeId])
	REFERENCES [edfi].[EducationalEnvironmentType] ([EducationalEnvironmentTypeId])
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_LanguageDescriptor_InstructionLanguageDescriptorId] 
	FOREIGN KEY([InstructionLanguageDescriptorId])
	REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_Location_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId], [ClassroomIdentificationCode])
	REFERENCES [edfi].[Location] ([SchoolYear], [SchoolId], [ClassroomIdentificationCode])
	ON UPDATE CASCADE
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_MediumOfInstructionType_MediumOfInstructionTypeId] 
	FOREIGN KEY([MediumOfInstructionTypeId])
	REFERENCES [edfi].[MediumOfInstructionType] ([MediumOfInstructionTypeId])
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_PopulationServedType_PopulationServedTypeId] 
	FOREIGN KEY([PopulationServedTypeId])
	REFERENCES [edfi].[PopulationServedType] ([PopulationServedTypeId])
GO

ALTER TABLE [edfi].[Section] ADD CONSTRAINT [FK_Section_School_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear], [SchoolId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).   NEDM: Class Period' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'ClassPeriodName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'ClassroomIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the LEA or Campus that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'LocalCourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier for the Section, that is defined by the classroom, the subjects taught, and the instructors that are assigned.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'UniqueSectionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When a Section is part of a sequence of parts for a course, the number if the sequence. If the course has only one part, the value of this Section attribute should be 1.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'SequenceOfCourse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The setting in which a child receives education and related services; for example:  Center-based instruction  Home-based instruction  Hospital class  Mainstream  Residential care and treatment facility  ....' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'EducationalEnvironmentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The media through which teachers provide instruction to students and students and teachers communicate about instructional matters; for example:  Technology-based instruction in classroom  Correspondence instruction  Face-to-face instruction  Virtual/On-line Distance learning  Center-based instruction  ...' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'MediumOfInstructionTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The population for which the course was designed; for example:  Bilingual students  Remedial education students  Gifted and talented students  Career and Technical Education students  Special education students  ....' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'PopulationServedTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'AvailableCreditTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'AvailableCreditConversion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'InstructionLanguageDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Credits or units of value awarded for the completion of a course.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section', @level2type=N'COLUMN',@level2name=N'AvailableCredits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents a setting in which organized instruction of course content is provided, in-person or otherwise, to one or more students for a given period of time. A course offering may be offered to more than one section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Section'
GO

CREATE NONCLUSTERED INDEX [DBA_Section_SchoolYear_Modified] ON [edfi].[Section]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Section_SectionWithMultipleProgramsForSameLogicalClass] ON [edfi].[Section]
(
		 [SchoolId]
		,[LocalCourseCode]
		,[TermDescriptorId] 
		,[SchoolYear]
		,[UniqueSectionCode]
		,[SequenceOfCourse]
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
