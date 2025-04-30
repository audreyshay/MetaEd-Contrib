CREATE TABLE [edfi].[StudentDisciplineIncidentAssociationBehavior] (
	[StudentUSI]                  INT             NOT NULL,
	[SchoolId]                    INT             NOT NULL,
	[IncidentIdentifier]          NVARCHAR (20)   NOT NULL,
	[BehaviorDescriptorId]        INT             NOT NULL,
	[BehaviorDetailedDescription] NVARCHAR (1024) NULL,
	[CreateDate]                  DATETIME        CONSTRAINT [StudentDisciplineIncidentAssociationBehavior_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]					  SMALLINT	   NOT NULL,
	CONSTRAINT [PK_StudentDisciplineIncidentBehavior] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [IncidentIdentifier] ASC, [BehaviorDescriptorId] ASC),
	CONSTRAINT [FK_StudentDisciplineIncidentBehavior_BehaviorDescriptor_BehaviorDescriptorId] 
		FOREIGN KEY ([BehaviorDescriptorId]) 
		REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId]),
	CONSTRAINT [FK_StudentDisciplineIncidentBehavior_StudentDisciplineIncidentAssociation_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier]) 
		REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([SchoolYear],[StudentUSI], [SchoolId], [IncidentIdentifier]) 
		ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentBehavior_StudentDisciplineIncidentAssociation_StudentUSI]
	ON [edfi].[StudentDisciplineIncidentAssociationBehavior]([SchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [IncidentIdentifier] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentBehavior_BehaviorDescriptor_BehaviorDescriptorId]
	ON [edfi].[StudentDisciplineIncidentAssociationBehavior]([BehaviorDescriptorId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Specifies a more granular level of detail of a behavior involved in the incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociationBehavior', @level2type = N'COLUMN', @level2name = N'BehaviorDetailedDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociationBehavior', @level2type = N'COLUMN', @level2name = N'BehaviorDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociationBehavior', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociationBehavior', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentDisciplineIncidentAssociationBehavior', @level2type = N'COLUMN', @level2name = N'StudentUSI';

