CREATE TABLE [extension].[StudentHomelessProgramAssociation](
	[StudentUSI]						[int] NOT NULL,
	[EducationOrganizationId]			[int] NOT NULL,
	[ProgramTypeId]						[int] NOT NULL,
	[ProgramName]						[nvarchar](60) NOT NULL,
	[ProgramEducationOrganizationId]	[int] NOT NULL,
	[BeginDate]							[date] NOT NULL,
	[EndDate]							[date] NULL,
	[WiDpiSchoolId]						[int] NULL,
	[PrimaryNighttimeResidenceTypeId]	[int] NOT NULL,
	[HomelessUnaccompaniedYouth]		[bit] NOT NULL,
	[Id]								[uniqueidentifier] NOT NULL,
	[LastModifiedDate]					[datetime] NOT NULL,
	[CreateDate]						[datetime] NOT NULL,
	[SchoolYear]						SMALLINT NOT NULL,
	[IsActive]							BIT NOT NULL CONSTRAINT [DF_StudentHomelessProgramAssociation_IsActive] DEFAULT(1),
 CONSTRAINT [PK_StudentHomelessProgramAssociation] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[StudentUSI] ASC,
	[EducationOrganizationId] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC,
	[ProgramEducationOrganizationId] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] ADD  CONSTRAINT [StudentHomelessProgramAssociation_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] ADD  CONSTRAINT [StudentHomelessProgramAssociation_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] ADD  CONSTRAINT [StudentHomelessProgramAssociation_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomelessProgramAssociation_EducationOrganization] FOREIGN KEY([SchoolYear], [EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([SchoolYear], [EducationOrganizationId])
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] CHECK CONSTRAINT [FK_StudentHomelessProgramAssociation_EducationOrganization]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomelessProgramAssociation_Program] FOREIGN KEY([SchoolYear], [ProgramEducationOrganizationId], [ProgramTypeId], [ProgramName])
REFERENCES [edfi].[Program] ([SchoolYear], [EducationOrganizationId], [ProgramTypeId], [ProgramName])
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] CHECK CONSTRAINT [FK_StudentHomelessProgramAssociation_Program]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomelessProgramAssociation_School] FOREIGN KEY([SchoolYear], [WiDpiSchoolId])
REFERENCES [edfi].[School] ([SchoolYear], [SchoolId])
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] CHECK CONSTRAINT [FK_StudentHomelessProgramAssociation_School]
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomelessProgramAssociation_Student_StudentUSI] FOREIGN KEY([SchoolYear], [StudentUSI])
REFERENCES [edfi].[Student] ([SchoolYear], [StudentUSI])
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation]  ADD  CONSTRAINT [FK_StudentHomelessProgramAssociation_PrimaryNighttimeResidenceType] FOREIGN KEY([PrimaryNighttimeResidenceTypeId])
REFERENCES [extension].[PrimaryNighttimeResidenceType] ([PrimaryNighttimeResidenceTypeId])
GO

ALTER TABLE [extension].[StudentHomelessProgramAssociation] CHECK CONSTRAINT [FK_StudentHomelessProgramAssociation_Student_StudentUSI]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a student by a state education agency.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'StudentUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'EducationOrganization Identity Column' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'ProgramTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'ProgramName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The education organization where the student is participating in or receiving the program services.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'ProgramEducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student exited the Program or stopped receiving services.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the primary nighttime residence for the student.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'PrimaryNighttimeResidenceTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if a student is unaccompanied youth.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation', @level2type=N'COLUMN',@level2name=N'HomelessUnaccompaniedYouth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the homless program for a student.' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentHomelessProgramAssociation'
GO

CREATE NONCLUSTERED INDEX [IX_StudentHomelessProgramAssociation_LastModified]
    ON [extension].[StudentHomelessProgramAssociation](IsActive DESC, [SchoolYear], [EducationOrganizationId] DESC, [ProgramTypeId], [LastModifiedDate] DESC)
GO