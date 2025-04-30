CREATE TABLE [edfiV3].[EducationOrganizationIdentificationCode] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,  
    [EducationOrganizationId]                               INT           NOT NULL,
    [EducationOrganizationIdentificationSystemDescriptorId] INT           NOT NULL,
    [IdentificationCode]                                    NVARCHAR (60) NOT NULL,
    [CreateDate]                                            DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_EducationOrganizationIdentificationCode_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [EducationOrganizationIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_EducationOrganizationIdentificationCode_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptor] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[EducationOrganizationIdentificationSystemDescriptor] ([EducationOrganizationIdentificationSystemDescriptorId])
);


