CREATE TABLE [leadata].[StudentDropOutRecoveryProgramAssociation](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[WrittenLearningPlanDate] [date] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]	[binary](64) CONSTRAINT [StudentDropOutRecoveryProgramAssociation_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_StudentDropOutRecoveryProgramAssociation] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC,
	[ProgramEducationOrganizationId] ASC,
	[BeginDate] ASC,
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramAssociation] ADD  CONSTRAINT [StudentDropOutRecoveryProgramAssociation_DF_SourceCreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramAssociation] ADD  CONSTRAINT [StudentDropOutRecoveryProgramAssociation_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramAssociation] ADD  CONSTRAINT [StudentDropOutRecoveryProgramAssociation_DF_Loaddate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentDropOutRecoveryProgramAssociation_StudentDropProgramAssociation] FOREIGN KEY([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId])
REFERENCES [leadata].[StudentProgramAssociation] ([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramAssociation] CHECK CONSTRAINT [FK_StudentDropOutRecoveryProgramAssociation_StudentDropProgramAssociation]
GO
