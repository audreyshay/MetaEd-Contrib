CREATE TABLE [leadata].[StudentProgramAssociationService](
    [FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[ServiceDescriptorId] [int] NOT NULL,
	[PrimaryIndicator] [bit] NULL,
	[ServiceBeginDate] [date] NULL,
	[ServiceEndDate] [date] NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StudentProgramAssociationService] PRIMARY KEY CLUSTERED 
(
    [FiscalYear] ASC,
	[StudentUSI] ASC,
	[EducationOrganizationId] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC,
	[ProgramEducationOrganizationId] ASC,
	[BeginDate] ASC,
	[ServiceDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [leadata].[StudentProgramAssociationService] ADD  CONSTRAINT [StudentProgramAssociationService_DF_SourceCreateDate]  DEFAULT (getdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentProgramAssociationService] ADD  CONSTRAINT [StudentProgramAssociationService_DF_SourceLastModifiedDate]  DEFAULT (getdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentProgramAssociationService] ADD  CONSTRAINT [StudentProgramAssociationService_DF_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentProgramAssociationService]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentProgramAssociationService_ServiceDescriptor_ServiceDescriptorId] FOREIGN KEY([FiscalYear], [ServiceDescriptorId])
REFERENCES [entity].[ServiceDescriptor] ([FiscalYear], [ServiceDescriptorId])
GO

ALTER TABLE [leadata].[StudentProgramAssociationService] CHECK CONSTRAINT [FK_StudentProgramAssociationService_ServiceDescriptor_ServiceDescriptorId]
GO

ALTER TABLE [leadata].[StudentProgramAssociationService]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentProgramAssociationService_StudentProgramAssociation] FOREIGN KEY([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate],[EducationOrganizationId])
REFERENCES [leadata].[StudentProgramAssociation] ([FiscalYear],[StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate],[EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentProgramAssociationService] CHECK CONSTRAINT [FK_StudentProgramAssociationService_StudentProgramAssociation]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a student by a state education agency.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'StudentUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The education organization where the student is participating in or receiving the program services.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ProgramTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the program of instruction, training, services or benefits available through federal, state, or local agencies.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ProgramName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The education organization where the student is participating in or receiving the program services.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ProgramEducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student first received services.  NEDM: Beginning Date' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ID of the Service Descriptor' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ServiceDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if service is a primary service.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'PrimaryIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First date the Student was in this option for the current school year.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ServiceBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last date the Student was in this option for the current school year.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService', @level2type=N'COLUMN',@level2name=N'ServiceEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the services being provided to the student by the program.' , @level0type=N'SCHEMA',@level0name=N'LEADATA', @level1type=N'TABLE',@level1name=N'StudentProgramAssociationService'
GO


