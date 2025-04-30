CREATE TABLE [edfi].[DisciplineActionDiscipline] (
	[StudentUSI]                 INT           NOT NULL,
	[DisciplineActionIdentifier] NVARCHAR (20) NOT NULL,
	[DisciplineDate]             DATE          NOT NULL,
	[DisciplineDescriptorId]     INT           NOT NULL,
	[CreateDate]                 DATETIME      CONSTRAINT [DisciplineActionDiscipline_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]				 SMALLINT	   NOT NULL,
	CONSTRAINT [PK_DisciplineActionDiscipline] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [DisciplineActionIdentifier] ASC, [DisciplineDate] ASC, [DisciplineDescriptorId] ASC),
	CONSTRAINT [FK_DisciplineActionDiscipline_DisciplineAction_StudentUSI] 
		FOREIGN KEY ([SchoolYear], [DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) 
		REFERENCES [edfi].[DisciplineAction] ([SchoolYear],[DisciplineActionIdentifier], [StudentUSI], [DisciplineDate]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_DisciplineActionDiscipline_DisciplineDescriptor_DisciplineDescriptorId] 
		FOREIGN KEY ([DisciplineDescriptorId]) 
		REFERENCES [edfi].[DisciplineDescriptor] ([DisciplineDescriptorId])
);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineActionDiscipline_DisciplineAction_StudentUSI]
	ON [edfi].[DisciplineActionDiscipline]([SchoolYear], [StudentUSI] ASC, [DisciplineDate] ASC, [DisciplineActionIdentifier] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineActionDiscipline_DisciplineDescriptor_DisciplineDescriptorId]
	ON [edfi].[DisciplineActionDiscipline]([DisciplineDescriptorId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of action, such as removal from the classroom, used to discipline the student involved as a perpetrator in a discipline incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDiscipline';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDiscipline', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier assigned by the education organization to the discipline action.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDiscipline', @level2type = N'COLUMN', @level2name = N'DisciplineActionIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Month, day and year of the discipline action.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDiscipline', @level2type = N'COLUMN', @level2name = N'DisciplineDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Discipline Descriptor', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionDiscipline', @level2type = N'COLUMN', @level2name = N'DisciplineDescriptorId';

