CREATE TABLE [edfi].[DisciplineActionDisciplineIncident] (
    [StudentUSI]                 INT           NOT NULL,
    [DisciplineActionIdentifier] NVARCHAR (20) NOT NULL,
    [DisciplineDate]             DATE          NOT NULL,
    [SchoolId]                   INT           NOT NULL,
    [IncidentIdentifier]         NVARCHAR (20) NOT NULL,
    [CreateDate]                 DATETIME      CONSTRAINT [DisciplineActionDisciplineIncident_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]				 SMALLINT	   NOT NULL,
    CONSTRAINT [PK_DisciplineActionDisciplineIncident] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC),
    CONSTRAINT [FK_DisciplineActionDisciplineIncident_DisciplineAction_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) 
		REFERENCES [edfi].[DisciplineAction] ([SchoolYear], [DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) 
		ON DELETE CASCADE,
    CONSTRAINT [FK_DisciplineActionDisciplineIncident_DisciplineIncident_SchoolId] 
		FOREIGN KEY ([SchoolYear], [IncidentIdentifier], [SchoolId]) 
		REFERENCES [edfi].[DisciplineIncident] ([SchoolYear], [IncidentIdentifier], [SchoolId])
);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineActionDisciplineIncident_DisciplineAction_StudentUSI]
    ON [edfi].[DisciplineActionDisciplineIncident]([SchoolYear], [DisciplineDate] ASC, [DisciplineActionIdentifier] ASC, [StudentUSI] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineActionDisciplineIncident_DisciplineIncident_SchoolId]
    ON [edfi].[DisciplineActionDisciplineIncident]([SchoolYear], [IncidentIdentifier] ASC, [SchoolId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDisciplineIncident', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identifier assigned by the education organization to the DisciplineAction.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDisciplineIncident', @level2type = N'COLUMN', @level2name = N'DisciplineActionIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The date of the DisciplineAction.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDisciplineIncident', @level2type = N'COLUMN', @level2name = N'DisciplineDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDisciplineIncident', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';

