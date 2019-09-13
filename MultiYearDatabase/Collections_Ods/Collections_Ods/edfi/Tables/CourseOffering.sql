CREATE TABLE [edfi].[CourseOffering](
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[TermDescriptorId] [int] NOT NULL,
	[LocalCourseTitle] [nvarchar](60) NULL,
	[InstructionalTimePlanned] [int] NULL,
	[CourseCode] [nvarchar](60) NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [CourseOffering_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [CourseOffering_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [CourseOffering_DF_CreateDate]  DEFAULT (getdate()),
	[IsActive] BIT CONSTRAINT [CourseOffering_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_CourseOffering] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[LocalCourseCode] ASC,
	[SchoolId] ASC,
	[TermDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CourseOffering] ADD CONSTRAINT [FK_CourseOffering_Course_SchoolId] 
	FOREIGN KEY([SchoolYear], [EducationOrganizationId], [CourseCode])
	REFERENCES [edfi].[Course] ([SchoolYear], [EducationOrganizationId], [CourseCode])
GO

ALTER TABLE [edfi].[CourseOffering] ADD CONSTRAINT [FK_CourseOffering_School_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId])
	REFERENCES [edfi].[School] ([SchoolYear], [SchoolId])
GO

ALTER TABLE [edfi].[CourseOffering] ADD CONSTRAINT [FK_CourseOffering_Session_SchoolId] 
	FOREIGN KEY([SchoolYear], [SchoolId], [TermDescriptorId])
	REFERENCES [edfi].[Session] ([SchoolYear], [SchoolId], [TermDescriptorId])
	ON UPDATE CASCADE
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the LEA that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'LocalCourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'School Identity Column
' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'SchoolId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'TermDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The descriptive name given to a course of study offered in the school, if different from the CourseTitle.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'LocalCourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The planned total number of clock minutes of instruction for this course offering. Generally, this should be at least as many minutes as is required for completion by the related state- or district-defined course.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'InstructionalTimePlanned'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'CourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Education Organization that defines the curriculum and courses offered - often the LEA or school.
' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents an entry in the course catalog of available courses offered by the school during a session.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseOffering'
GO

CREATE NONCLUSTERED INDEX [DBA_CourseOffering_SchoolYear_Modified] ON [edfi].[CourseOffering]
(
    IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC 
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

