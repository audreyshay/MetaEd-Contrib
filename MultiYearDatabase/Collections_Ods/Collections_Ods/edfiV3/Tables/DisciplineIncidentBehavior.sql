CREATE TABLE [edfiV3].[DisciplineIncidentBehavior] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[BehaviorDescriptorId]        INT             NOT NULL,
    [IncidentIdentifier]          NVARCHAR (20)   NOT NULL,
    [SchoolId]                    INT             NOT NULL,
    [BehaviorDetailedDescription] NVARCHAR (1024) NULL,
    [CreateDate]                  DATETIME2 (7)        NOT NULL,
	CONSTRAINT [V3_DisciplineIncidentBehavior_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [BehaviorDescriptorId] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [V3_FK_DisciplineIncidentBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfiV3].[BehaviorDescriptor] ([BehaviorDescriptorId]),
    CONSTRAINT [V3_FK_DisciplineIncidentBehavior_DisciplineIncident] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [IncidentIdentifier]) REFERENCES [edfiV3].[DisciplineIncident] ([ApiSchoolYear], [SchoolId], [IncidentIdentifier]) ON DELETE CASCADE
);
