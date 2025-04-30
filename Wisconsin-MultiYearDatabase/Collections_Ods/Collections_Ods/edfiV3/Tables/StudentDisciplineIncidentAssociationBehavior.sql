CREATE TABLE [edfiV3].[StudentDisciplineIncidentAssociationBehavior] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [BehaviorDescriptorId]        INT             NOT NULL,
    [IncidentIdentifier]          NVARCHAR (20)   NOT NULL,
    [SchoolId]                    INT             NOT NULL,
    [StudentUSI]                  INT             NOT NULL,
    [BehaviorDetailedDescription] NVARCHAR (1024) NULL,
    [CreateDate]                  DATETIME2 (7)        NOT NULL,
	CONSTRAINT [V3_StudentDisciplineIncidentAssociationBehavior_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [BehaviorDescriptorId] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociationBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfiV3].[BehaviorDescriptor] ([BehaviorDescriptorId]),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociationBehavior_StudentDisciplineIncidentAssociation] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [StudentUSI], [IncidentIdentifier]) REFERENCES [edfiV3].[StudentDisciplineIncidentAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI], [IncidentIdentifier]) ON DELETE CASCADE
);
