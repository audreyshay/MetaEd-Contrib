CREATE TABLE [edfiV3].[StudentDisciplineIncidentAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [IncidentIdentifier]					NVARCHAR (20)		NOT NULL,
    [SchoolId]								INT					NOT NULL,
    [StudentUSI]							INT					NOT NULL,
    [StudentParticipationCodeDescriptorId]	INT					NOT NULL,
    [CreateDate]							DATETIME2 (7)			NOT NULL,
    [LastModifiedDate]						DATETIME2 (7)			NOT NULL,
    [Id]									UNIQUEIDENTIFIER	NOT NULL,
	[IsActive]								BIT					CONSTRAINT [V3_StudentDisciplineIncidentAssociation_IsActive] DEFAULT ((1)) NOT NULL,
	[DpiPrimaryBehaviorDescriptorId]		INT					NULL,
	[DpiCalcDateModified]					DATETIME			NULL,
    CONSTRAINT [V3_StudentDisciplineIncidentAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociation_DisciplineIncident] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [IncidentIdentifier]) REFERENCES [edfiV3].[DisciplineIncident] ([ApiSchoolYear],[SchoolId],[IncidentIdentifier]),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociation_Student] FOREIGN KEY ([ApiSchoolYear],[StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear],[StudentUSI]),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociation_StudentParticipationCodeDescriptor] FOREIGN KEY ([StudentParticipationCodeDescriptorId]) REFERENCES [edfiV3].[StudentParticipationCodeDescriptor] ([StudentParticipationCodeDescriptorId]),
    CONSTRAINT [V3_FK_StudentDisciplineIncidentAssociation_DpiPrimaryBehaviorDescriptor] FOREIGN KEY ([DpiPrimaryBehaviorDescriptorId]) REFERENCES [edfiV3].[BehaviorDescriptor] ([BehaviorDescriptorId])
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_StudentDisciplineIncidentAssociation_Id]
    ON [edfiV3].[StudentDisciplineIncidentAssociation]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


GO