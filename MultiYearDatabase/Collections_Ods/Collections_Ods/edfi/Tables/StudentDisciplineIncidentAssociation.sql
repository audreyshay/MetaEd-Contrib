CREATE TABLE [edfi].[StudentDisciplineIncidentAssociation] (
	[StudentUSI]                     INT              NOT NULL,
	[SchoolId]                       INT              NOT NULL,
	[IncidentIdentifier]             NVARCHAR (20)    NOT NULL,
	[StudentParticipationCodeTypeId] INT              NOT NULL,
	[Id]                             UNIQUEIDENTIFIER CONSTRAINT [StudentDisciplineIncidentAssociation_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]               DATETIME         CONSTRAINT [StudentDisciplineIncidentAssociation_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                     DATETIME         CONSTRAINT [StudentDisciplineIncidentAssociation_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]					  SMALLINT	   NOT NULL,
	[IsActive]						  BIT CONSTRAINT [StudentDisciplineIncidentAssociation_DF_IsActive] DEFAULT ((1)) NOT NULL,
	[DpiPrimaryBehaviorDescriptorId] INT NULL,
	[DpiCalcDateModified]			DATETIME         NULL,
	CONSTRAINT [PK_StudentDisciplineIncidentAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC),
	CONSTRAINT [FK_StudentDisciplineIncidentAssociation_DisciplineIncident_SchoolId] 
		FOREIGN KEY ([SchoolYear],[IncidentIdentifier], [SchoolId]) 
		REFERENCES [edfi].[DisciplineIncident] ([SchoolYear],[IncidentIdentifier], [SchoolId]),
	CONSTRAINT [FK_StudentDisciplineIncidentAssociation_Student_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI]),
	CONSTRAINT [FK_StudentDisciplineIncidentAssociation_StudentParticipationCodeType_StudentParticipationCodeTypeId] 
		FOREIGN KEY ([StudentParticipationCodeTypeId]) 
		REFERENCES [edfi].[StudentParticipationCodeType] ([StudentParticipationCodeTypeId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_StudentDisciplineIncidentAssociation_Id]
	ON [edfi].[StudentDisciplineIncidentAssociation]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


GO
CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociation_StudentParticipationCodeType_StudentParticipationCodeTypeId]
	ON [edfi].[StudentDisciplineIncidentAssociation]([StudentParticipationCodeTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociation_Student_StudentUSI]
	ON [edfi].[StudentDisciplineIncidentAssociation]([StudentUSI] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociation_DisciplineIncident_SchoolId]
	ON [edfi].[StudentDisciplineIncidentAssociation]([SchoolYear] ASC,[IncidentIdentifier] ASC, [SchoolId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The role or type of participation of a student in a discipline incident; for example:  Victim  Perpetrator  Witness  Reporter', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'StudentParticipationCodeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This association indicates those students who were victims, perpetrators, witnesses, and reporters for a discipline incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociation';
GO

CREATE NONCLUSTERED INDEX [IX_StudentDisciplineIncidentAssociation_LastModified]
    ON [edfi].[StudentDisciplineIncidentAssociation](IsActive DESC,[SchoolYear] DESC, [SchoolId], [LastModifiedDate] DESC)
GO