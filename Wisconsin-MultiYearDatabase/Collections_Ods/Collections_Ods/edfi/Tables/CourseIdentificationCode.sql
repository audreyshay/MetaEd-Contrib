CREATE TABLE [edfi].[CourseIdentificationCode](
	[EducationOrganizationId] [int] NOT NULL,
	[CourseCode] [nvarchar](60) NOT NULL,
	[AssigningOrganizationIdentificationCode] [nvarchar](60) NULL,
	[IdentificationCode] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [CourseIdentificationCode_DF_CreateDate]  DEFAULT (getdate()),
	[CourseIdentificationSystemDescriptorId] [int] NOT NULL,
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
 CONSTRAINT [PK_CourseIdentificationCode] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[EducationOrganizationId] ASC,
	[CourseCode] ASC,
	[CourseIdentificationSystemDescriptorId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CourseIdentificationCode] ADD CONSTRAINT [FK_CourseIdentificationCode_Course_EducationOrganizationId] 
	FOREIGN KEY([SchoolYear],[EducationOrganizationId], [CourseCode])
	REFERENCES [edfi].[Course] ([SchoolYear], [EducationOrganizationId], [CourseCode])
ON DELETE CASCADE
GO

ALTER TABLE [edfi].[CourseIdentificationCode] ADD CONSTRAINT [FK_CourseIdentificationCode_CourseIdentificationSystemDescriptor] 
	FOREIGN KEY([CourseIdentificationSystemDescriptorId])
	REFERENCES [edfi].[CourseIdentificationSystemDescriptor] ([CourseIdentificationSystemDescriptorId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Education Organization that defines the curriculum and courses offered - often the LEA or school.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode', @level2type=N'COLUMN',@level2name=N'CourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization code or name assigning the staff Identification Code.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode', @level2type=N'COLUMN',@level2name=N'AssigningOrganizationIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a space, room, site, building, individual, organization, program, or institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode', @level2type=N'COLUMN',@level2name=N'IdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode', @level2type=N'COLUMN',@level2name=N'CourseIdentificationSystemDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A standard code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationCode'
GO

