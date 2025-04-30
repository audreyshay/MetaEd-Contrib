CREATE TABLE [edfiV3].[LocalEducationAgency] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [LocalEducationAgencyId]                   INT NOT NULL,
    [LocalEducationAgencyCategoryDescriptorId] INT NOT NULL,
    [CharterStatusDescriptorId]                INT NULL,
    [ParentLocalEducationAgencyId]             INT NULL,
    [EducationServiceCenterId]                 INT NULL,
    [StateEducationAgencyId]                   INT NULL,
	[IsChoice] BIT  CONSTRAINT [V3_LocalEducationAgency_DF_IsChoice] DEFAULT (0) NOT NULL, 
	CONSTRAINT [V3_LocalEducationAgency_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [LocalEducationAgencyId] ASC),
    CONSTRAINT [V3_FK_LocalEducationAgency_CharterStatusDescriptor] FOREIGN KEY ([CharterStatusDescriptorId]) REFERENCES [edfiV3].[CharterStatusDescriptor] ([CharterStatusDescriptorId]),
    CONSTRAINT [V3_FK_LocalEducationAgency_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [LocalEducationAgencyId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_LocalEducationAgency_EducationServiceCenter] FOREIGN KEY ([ApiSchoolYear], [EducationServiceCenterId]) REFERENCES [edfiV3].[EducationServiceCenter] ([ApiSchoolYear], [EducationServiceCenterId]),
    CONSTRAINT [V3_FK_LocalEducationAgency_LocalEducationAgency] FOREIGN KEY ([ApiSchoolYear], [ParentLocalEducationAgencyId]) REFERENCES [edfiV3].[LocalEducationAgency] ([ApiSchoolYear], [LocalEducationAgencyId]),
    CONSTRAINT [V3_FK_LocalEducationAgency_LocalEducationAgencyCategoryDescriptor] FOREIGN KEY ([LocalEducationAgencyCategoryDescriptorId]) REFERENCES [edfiV3].[LocalEducationAgencyCategoryDescriptor] ([LocalEducationAgencyCategoryDescriptorId]),
    CONSTRAINT [V3_FK_LocalEducationAgency_StateEducationAgency] FOREIGN KEY ([ApiSchoolYear], [StateEducationAgencyId]) REFERENCES [edfiV3].[StateEducationAgency] ([ApiSchoolYear], [StateEducationAgencyId])
);

