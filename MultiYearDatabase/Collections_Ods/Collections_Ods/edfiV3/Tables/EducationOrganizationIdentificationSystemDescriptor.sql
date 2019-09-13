CREATE TABLE [edfiV3].[EducationOrganizationIdentificationSystemDescriptor] (
    [EducationOrganizationIdentificationSystemDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_EducationOrganizationIdentificationSystemDescriptor_PK] PRIMARY KEY CLUSTERED ([EducationOrganizationIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_EducationOrganizationIdentificationSystemDescriptor_Descriptor] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);