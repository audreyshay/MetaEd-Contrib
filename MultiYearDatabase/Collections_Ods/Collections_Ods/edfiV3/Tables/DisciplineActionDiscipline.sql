CREATE TABLE [edfiV3].[DisciplineActionDiscipline] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[DisciplineActionIdentifier] NVARCHAR (20) NOT NULL,
    [DisciplineDate]             DATE          NOT NULL,
    [DisciplineDescriptorId]     INT           NOT NULL,
    [StudentUSI]                 INT           NOT NULL,
    [CreateDate]                 DATETIME2 (7)      NOT NULL,
	CONSTRAINT [V3_DisciplineActionDiscipline_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC ,[DisciplineActionIdentifier] ASC, [DisciplineDate] ASC, [DisciplineDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisciplineActionDiscipline_DisciplineAction] FOREIGN KEY ([ApiSchoolYear], [StudentUSI], [DisciplineActionIdentifier], [DisciplineDate]) REFERENCES [edfiV3].[DisciplineAction] ([ApiSchoolYear], [StudentUSI], [DisciplineActionIdentifier], [DisciplineDate]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_DisciplineActionDiscipline_DisciplineDescriptor] FOREIGN KEY ([DisciplineDescriptorId]) REFERENCES [edfiV3].[DisciplineDescriptor] ([DisciplineDescriptorId])
);


GO