CREATE TABLE [extension].[StudentDisciplineIncidentAssociationExtension](
    [StudentUSI] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [EntryDate] [DATE] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
	[SchoolYear]					  SMALLINT	   NOT NULL,
    CONSTRAINT [StudentDisciplineIncidentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC,
		[SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school by the State Education Agency (SEA).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO



ALTER TABLE [extension].[StudentDisciplineIncidentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation] 
	FOREIGN KEY ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier])
	REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier])
	ON DELETE CASCADE

GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation]
	ON [extension].[StudentDisciplineIncidentAssociationExtension]([StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC,[SchoolYear] ASC)
GO

ALTER TABLE [extension].[StudentDisciplineIncidentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationExtension_StudentSchoolAssociation] 
	FOREIGN KEY ([SchoolYear], [StudentUSI], [SchoolId], [EntryDate] )
	REFERENCES [edfi].[StudentSchoolAssociation] ([SchoolYear], [StudentUSI] , [SchoolId] , [EntryDate] )
	ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationExtension_StudentSchoolAssociation]
	ON [extension].[StudentDisciplineIncidentAssociationExtension]([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC, [SchoolYear]  ASC)
GO

