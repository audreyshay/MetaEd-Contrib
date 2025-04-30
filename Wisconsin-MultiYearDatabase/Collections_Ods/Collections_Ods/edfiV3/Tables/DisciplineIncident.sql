CREATE TABLE [edfiV3].[DisciplineIncident] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[IncidentIdentifier]              NVARCHAR (20)    NOT NULL,
    [SchoolId]                        INT              NOT NULL,
    [IncidentDate]                    DATE             NOT NULL,
    [IncidentTime]                    TIME (7)         NULL,
    [IncidentLocationDescriptorId]    INT              NULL,
    [IncidentDescription]             NVARCHAR (1024)  NULL,
    [ReporterDescriptionDescriptorId] INT              NULL,
    [ReporterName]                    NVARCHAR (75)    NULL,
    [ReportedToLawEnforcement]        BIT              NULL,
    [CaseNumber]                      NVARCHAR (20)    NULL,
    [IncidentCost]                    MONEY            NULL,
    [StaffUSI]                        INT              NULL,
    [CreateDate]                      DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]                DATETIME2 (7)         NOT NULL,
    [Id]                              UNIQUEIDENTIFIER NOT NULL,
	[IsActive]						  BIT CONSTRAINT [V3_DisciplineIncident_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_DisciplineIncident_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC,[IncidentIdentifier] ASC),
   -- CONSTRAINT [V3_FK_DisciplineIncident_IncidentLocationDescriptor] FOREIGN KEY ([IncidentLocationDescriptorId]) REFERENCES [edfiV3].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId]),
    --CONSTRAINT [V3_FK_DisciplineIncident_ReporterDescriptionDescriptor] FOREIGN KEY ([ReporterDescriptionDescriptorId]) REFERENCES [edfiV3].[ReporterDescriptionDescriptor] ([ReporterDescriptionDescriptorId]),
    CONSTRAINT [V3_FK_DisciplineIncident_School] FOREIGN KEY ([ApiSchoolYear],[SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
   -- CONSTRAINT [V3_FK_DisciplineIncident_Staff] FOREIGN KEY ([StaffUSI]) REFERENCES [edfiV3].[Staff] ([StaffUSI])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_DisciplineIncident_Id]
    ON [edfiV3].[DisciplineIncident]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);

