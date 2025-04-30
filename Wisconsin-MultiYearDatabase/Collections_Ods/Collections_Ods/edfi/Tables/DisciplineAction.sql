CREATE TABLE [edfi].[DisciplineAction] (
    [DisciplineActionIdentifier]                   NVARCHAR (20)    NOT NULL,
    [StudentUSI]                                   INT              NOT NULL,
    [DisciplineDate]                               DATE             NOT NULL,
    [DisciplineActionLength]                       DECIMAL(5,1)     NULL,
    [ActualDisciplineActionLength]                 DECIMAL(5,1)     NULL,
    [DisciplineActionLengthDifferenceReasonTypeId] INT              NULL,
    [RelatedToZeroTolerancePolicy]                 BIT              NULL,
    [ResponsibilitySchoolId]                       INT              NULL,
    [AssignmentSchoolId]                           INT              NULL,
    [Id]                                           UNIQUEIDENTIFIER CONSTRAINT [DisciplineAction_DF_Id] DEFAULT (newid()) NOT NULL,
	[SchoolYear]								   SMALLINT			NOT NULL,
    [LastModifiedDate]                             DATETIME         CONSTRAINT [DisciplineAction_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                                   DATETIME         CONSTRAINT [DisciplineAction_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [IsActive]									   BIT				CONSTRAINT [DisciplineAction_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_DisciplineAction] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [DisciplineActionIdentifier] ASC, [StudentUSI] ASC, [DisciplineDate] ASC),
    CONSTRAINT [FK_DisciplineAction_DisciplineActionLengthDifferenceReasonType_DisciplineActionLengthDifferenceReasonTypeId] 
		FOREIGN KEY ([DisciplineActionLengthDifferenceReasonTypeId]) 
		REFERENCES [edfi].[DisciplineActionLengthDifferenceReasonType] ([DisciplineActionLengthDifferenceReasonTypeId]),
    CONSTRAINT [FK_DisciplineAction_School_AssignmentSchoolId] 
		FOREIGN KEY ([SchoolYear], [AssignmentSchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear], [SchoolId]),
    CONSTRAINT [FK_DisciplineAction_School_ResponsibilitySchoolId] 
		FOREIGN KEY ([SchoolYear], [ResponsibilitySchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear], [SchoolId]),
    CONSTRAINT [FK_DisciplineAction_Student_StudentUSI] 
		FOREIGN KEY ([SchoolYear], [StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear], [StudentUSI])
);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineAction_DisciplineActionLengthDifferenceReasonType_DisciplineActionLengthDifferenceReasonTypeId]
    ON [edfi].[DisciplineAction]([DisciplineActionLengthDifferenceReasonTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineAction_School_AssignmentSchoolId]
    ON [edfi].[DisciplineAction]([AssignmentSchoolId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineAction_School_ResponsibilitySchoolId]
    ON [edfi].[DisciplineAction]([ResponsibilitySchoolId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineAction_Student_StudentUSI]
    ON [edfi].[DisciplineAction]([StudentUSI] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This event entity represents actions taken by an education organization after a disruptive event that is recorded as a discipline incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identifier assigned by the education organization to the discipline action.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineActionIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The date of the DisciplineAction.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The length of time in school days for the Discipline Action (e.g. removal, detention), if applicable.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineActionLength';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates the actual length in school days of a student''s disciplinary assignment.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'ActualDisciplineActionLength';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Key for DisciplineActionLengthDifferenceReason', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'DisciplineActionLengthDifferenceReasonTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'An indication of whether or not this disciplinary action taken against a student was imposed as a consequence of state or local zero tolerance policies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'RelatedToZeroTolerancePolicy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School responsible for student''s discipline.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'ResponsibilitySchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Optional school where student is transferred for discipline.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineAction', @level2type = N'COLUMN', @level2name = N'AssignmentSchoolId';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DisciplineAction_Id]
    ON [edfi].[DisciplineAction]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);

GO

CREATE NONCLUSTERED INDEX [IX_DisciplineAction_LastModified]
    ON [edfi].[DisciplineAction](IsActive DESC,[SchoolYear] DESC, [LastModifiedDate] DESC)
GO

