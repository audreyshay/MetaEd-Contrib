CREATE TABLE [wiV3].[DisciplineActionExtension] (
	[ApiSchoolYear]				 SMALLINT		NOT NULL,
	[DisciplineActionIdentifier]  NVARCHAR (20) NOT NULL,
    [DisciplineDate]              DATE          NOT NULL,
    [StudentUSI]                  INT           NOT NULL,
    [ModifiedTermDescriptorId]    INT           NULL,
    [EarlyReinstatementCondition] BIT           NULL,
    [CreateDate]                  DATETIME2 (7)      CONSTRAINT [DisciplineActionExtension_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT [V3_DisciplineActionExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC),
    CONSTRAINT [V3_FK_DisciplineActionExtension_DisciplineAction] FOREIGN KEY ([ApiSchoolYear], [StudentUSI], [DisciplineActionIdentifier], [DisciplineDate]) REFERENCES [edfiV3].[DisciplineAction] ([ApiSchoolYear], [StudentUSI], [DisciplineActionIdentifier], [DisciplineDate]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_DisciplineActionExtension_ModifiedTermDescriptor] FOREIGN KEY ([ModifiedTermDescriptorId]) REFERENCES [wiV3].[ModifiedTermDescriptor] ([ModifiedTermDescriptorId])
);