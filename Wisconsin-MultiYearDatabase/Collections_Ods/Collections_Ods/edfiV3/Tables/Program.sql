CREATE TABLE [edfiV3].[Program] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
	[EducationOrganizationId] INT              NOT NULL,
    [ProgramName]             NVARCHAR (60)    NOT NULL,
    [ProgramTypeDescriptorId] INT              NOT NULL,
    [ProgramId]               NVARCHAR (20)    NULL,
    [CreateDate]              DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]        DATETIME2 (7)         NOT NULL,
    [Id]                      UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [V3_Program_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_Program_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]),
    CONSTRAINT [V3_FK_Program_ProgramTypeDescriptor] FOREIGN KEY ([ProgramTypeDescriptorId]) REFERENCES [edfiV3].[ProgramTypeDescriptor] ([ProgramTypeDescriptorId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_Program_Id]
    ON [edfiV3].[Program]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


GO