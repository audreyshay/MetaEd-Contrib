CREATE TABLE [edfi].[DisciplineIncident] (
	[IncidentIdentifier]              NVARCHAR (20)    NOT NULL,
	[SchoolId]                        INT              NOT NULL,
	[IncidentDate]                    DATE             NOT NULL,
	[IncidentTime]                    TIME (7)         NULL,
	[IncidentLocationTypeId]          INT              NULL,
	[IncidentDescription]             NVARCHAR (1024)  NULL,
	[ReporterDescriptionDescriptorId] INT              NULL,
	[ReporterName]                    NVARCHAR (75)    NULL,
	[ReportedToLawEnforcement]        BIT              NULL,
	[CaseNumber]                      NVARCHAR (20)    NULL,
	[IncidentCost]                    MONEY            NULL,
	[StaffUSI]                        INT              NULL,
	[Id]                              UNIQUEIDENTIFIER CONSTRAINT [DisciplineIncident_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]                DATETIME         CONSTRAINT [DisciplineIncident_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                      DATETIME         CONSTRAINT [DisciplineIncident_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]					  SMALLINT	   NOT NULL,
	[IsActive]						  BIT CONSTRAINT [DisciplineIncident_DF_IsActive] DEFAULT ((1)) NOT NULL,
	CONSTRAINT [PK_DisciplineIncident] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [IncidentIdentifier] ASC, [SchoolId] ASC),
	CONSTRAINT [FK_DisciplineIncident_IncidentLocationType_IncidentLocationTypeId] 
		FOREIGN KEY ([IncidentLocationTypeId]) 
		REFERENCES [edfi].[IncidentLocationType] ([IncidentLocationTypeId]),
	CONSTRAINT [FK_DisciplineIncident_ReporterDescriptionDescriptorId] 
		FOREIGN KEY ([ReporterDescriptionDescriptorId]) 
		REFERENCES [edfi].[ReporterDescriptionDescriptor] ([ReporterDescriptionDescriptorId]),
	CONSTRAINT [FK_DisciplineIncident_School_SchoolId] 
		FOREIGN KEY ([SchoolYear], [SchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear], [SchoolId]),
	CONSTRAINT [FK_DisciplineIncident_Staff_StaffUSI] 
		FOREIGN KEY ([SchoolYear], [StaffUSI]) 
		REFERENCES [edfi].[Staff] ([SchoolYear], [StaffUSI])
);

GO
CREATE NONCLUSTERED INDEX [FK_DisciplineIncident_IncidentLocationType_IncidentLocationTypeId]
	ON [edfi].[DisciplineIncident]([IncidentLocationTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineIncident_ReporterDescriptionDescriptorId]
	ON [edfi].[DisciplineIncident]([ReporterDescriptionDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineIncident_School_SchoolId]
	ON [edfi].[DisciplineIncident]([SchoolYear] ASC, [SchoolId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_DisciplineIncident_Staff_StaffUSI]
	ON [edfi].[DisciplineIncident]([StaffUSI] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'This event entity represents an occurrence of an infraction ranging from a minor heavioral problem that disrupts the orderly functioning of a school or classroom (such as tardiness) to a criminal act that results in the involvement of a law enforcement official (such as robbery). A single event (e.g., a fight) is one incident regardless of how many perpetrators or victims are involved. Discipline incidents are events classified as warranting discipline action.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentIdentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The month, day, and year on which the DisciplineIncident occurred.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'An indication of the time of day the incident took place.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identifies where the incident occurred and whether or not it occurred on campus, for example:  On campus  Administrative offices area  Cafeteria area  Classroom  Hallway or stairs  ...', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentLocationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The description for an incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information on the type of individual who reported the incident. When known and/or if useful, use a more specific option code (e.g., "Counselor" rather than "Professional Staff"); for example:Student  Parent/guardian  Law enforcement officer  Nonschool personnel  Representative of visiting school  ...', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReporterDescriptionDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Identifies the reporter of the incident by name.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReporterName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicator of whether the incident was reported to law enforcement.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'ReportedToLawEnforcement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The case number assigned to the incident by law enforcement or other organization.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'CaseNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The value of any quantifiable monetary loss directly resulting from the DisciplineIncident. Examples include the value of repairs necessitated by vandalism of a school facility, or the value of personnel resources used for repairs or consumed by the incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'IncidentCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Staff Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineIncident', @level2type = N'COLUMN', @level2name = N'StaffUSI';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DisciplineIncident_Id]
	ON [edfi].[DisciplineIncident]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);

GO

CREATE NONCLUSTERED INDEX [IX_DisciplineIncident_LastModified]
    ON [edfi].[DisciplineIncident](IsActive DESC, [SchoolYear] DESC, [SchoolId], [LastModifiedDate] DESC)
GO
