CREATE TABLE [extension].[StudentDisciplineIncidentAssociationBehaviorExtension](
	[BehaviorDescriptorId] [INT] NOT NULL,
	[StudentUSI] [INT] NOT NULL,
	[IncidentIdentifier] [NVARCHAR](20) NOT NULL,
	[SchoolId] [INT] NOT NULL,
	[SeriousBodilyInjury] [BIT] NULL,
	[SchoolYear]					  SMALLINT	   NOT NULL,
	CONSTRAINT [StudentDisciplineIncidentAssociationBehaviorExtension_PK] PRIMARY KEY CLUSTERED (
		[SchoolYear] ASC,
		[BehaviorDescriptorId] ASC,
		[IncidentIdentifier] ASC,
		[SchoolId] ASC,
		[StudentUSI] ASC
		
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describes behavior by category and provides a detailed description.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describes behavior by category and provides a detailed description.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension', @level2type=N'COLUMN', @level2name=N'BehaviorDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Incident resulted in serious bodily injury. Serious Bodily Injury involves a substantial risk of death; extreme physical pain; protracted and obvious disfigurement; or protracted loss or impairment of the function of a bodily member, organ, or faculty (18 USC Section 1365 (3)(h)).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationBehaviorExtension', @level2type=N'COLUMN', @level2name=N'SeriousBodilyInjury'
GO


ALTER TABLE [extension].[StudentDisciplineIncidentAssociationBehaviorExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationBehaviorExtension_StudentDisciplineIncidentAssociationBehavior] 
	FOREIGN KEY ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier], [BehaviorDescriptorId])
	REFERENCES [edfi].[StudentDisciplineIncidentAssociationBehavior] ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier], [BehaviorDescriptorId])
	ON DELETE CASCADE

GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationBehaviorExtension_StudentDisciplineIncidentAssociationBehavior]
	ON [extension].[StudentDisciplineIncidentAssociationBehaviorExtension]([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [BehaviorDescriptorId] ASC)
GO