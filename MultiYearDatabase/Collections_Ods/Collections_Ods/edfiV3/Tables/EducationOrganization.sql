CREATE TABLE [edfiV3].[EducationOrganization] (
	[ApiSchoolYear]	   SMALLINT NOT NULL, 
    [EducationOrganizationId]       INT              NOT NULL,
    [NameOfInstitution]             NVARCHAR (75)    NOT NULL,
    [ShortNameOfInstitution]        NVARCHAR (75)    NULL,
    [WebSite]                       NVARCHAR (255)   NULL,
    [OperationalStatusDescriptorId] INT              NULL,
    [Discriminator]					NVARCHAR (128)   NULL,
    [CreateDate]                    DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]              DATETIME2 (7)         NOT NULL,
    [Id]                            UNIQUEIDENTIFIER NOT NULL,
	[IsChoice] BIT  CONSTRAINT [V3_EducationOrganization_DF_IsChoice] DEFAULT (0) NOT NULL, 
	CONSTRAINT [V3_EducationOrganization_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC),
    CONSTRAINT [V3_FK_EducationOrganization_OperationalStatusDescriptor] FOREIGN KEY ([OperationalStatusDescriptorId]) REFERENCES [edfiV3].[OperationalStatusDescriptor] ([OperationalStatusDescriptorId])
);

GO

CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_EducationOrganization_Id]
    ON [edfiV3].[EducationOrganization]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);
