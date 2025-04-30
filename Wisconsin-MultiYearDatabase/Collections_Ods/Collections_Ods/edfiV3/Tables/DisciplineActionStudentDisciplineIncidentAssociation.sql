CREATE TABLE [edfiV3].[DisciplineActionStudentDisciplineIncidentAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[DisciplineActionIdentifier] NVARCHAR (20) NOT NULL,
    [DisciplineDate]             DATE          NOT NULL,
    [IncidentIdentifier]         NVARCHAR (20) NOT NULL,
    [SchoolId]                   INT           NOT NULL,
    [StudentUSI]                 INT           NOT NULL,
    [CreateDate]                 DATETIME2 (7)      NOT NULL,
	CONSTRAINT [V3_DisciplineActionStudentDisciplineIncidentAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [V3_FK_DisciplineActionStudentDisciplineIncidentAssociation_DisciplineAction] FOREIGN KEY ([ApiSchoolYear], [StudentUSI], [DisciplineActionIdentifier], [DisciplineDate]) REFERENCES [edfiV3].[DisciplineAction] ([ApiSchoolYear], [StudentUSI],[DisciplineActionIdentifier], [DisciplineDate]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_DisciplineActionStudentDisciplineIncidentAssociation_StudentDisciplineIncidentAssociation] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [StudentUSI], [IncidentIdentifier]) REFERENCES [edfiV3].[StudentDisciplineIncidentAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI], [IncidentIdentifier])
);
