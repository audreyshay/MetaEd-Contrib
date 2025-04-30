CREATE TABLE [wiV3].[StudentDisciplineIncidentAssociationExtension] (
    [ApiSchoolYear]				 SMALLINT		NOT NULL,
	[IncidentIdentifier]  NVARCHAR (20) NOT NULL,
    [SchoolId]            INT           NOT NULL,
    [StudentUSI]          INT           NOT NULL,
    [SeriousBodilyInjury] BIT           NULL,
    [CreateDate]          DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentDisciplineIncidentAssociationExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [StudentUSI], [IncidentIdentifier]) REFERENCES [edfiV3].[StudentDisciplineIncidentAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI],[IncidentIdentifier]) ON DELETE CASCADE
);

