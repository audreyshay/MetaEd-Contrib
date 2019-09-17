CREATE TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[BeginDate] [date] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[RevisedWrittenLearningPlanDate] [date] NULL,
	[MonthDescriptorId] [int] NOT NULL,
	[SatisfactoryProgress] [bit] NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]	[binary](64) CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_StudentDropOutRecoveryProgramMonthlyUpdate] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC,
	[ProgramEducationOrganizationId] ASC,
	[BeginDate] ASC,
	[EducationOrganizationId] ASC,
	[MonthDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD  CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_SourceId]  DEFAULT (newid()) FOR [SourceId]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD  CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_SourceCreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD  CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD  CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_Loaddate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate]  WITH CHECK ADD  CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor_MonthDescriptorId] FOREIGN KEY([FiscalYear], [MonthDescriptorId])
REFERENCES [leadata].[Descriptor] ([FiscalYear], [DescriptorId])
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] CHECK CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor_MonthDescriptorId]
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate]  WITH CHECK ADD  CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentProgramAssociation] FOREIGN KEY([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId])
REFERENCES [leadata].[StudentProgramAssociation] ([FiscalYear], [StudentUSI], [ProgramTypeId], [ProgramName], [ProgramEducationOrganizationId], [BeginDate], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] CHECK CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentProgramAssociation]
GO


