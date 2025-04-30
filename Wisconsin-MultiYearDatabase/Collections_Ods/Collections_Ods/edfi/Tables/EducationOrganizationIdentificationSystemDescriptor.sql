CREATE TABLE [edfi].[EducationOrganizationIdentificationSystemDescriptor] (
    [EducationOrganizationIdentificationSystemTypeId]       INT NULL,
    [EducationOrganizationIdentificationSystemDescriptorId] INT NOT NULL,
    CONSTRAINT [PK_EducationOrganizationIdentificationSystemDescriptor] PRIMARY KEY CLUSTERED ([EducationOrganizationIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [FK_EducationOrganizationIdentificationDescriptor_Descriptor] FOREIGN KEY ([EducationOrganizationIdentificationSystemDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]),
    CONSTRAINT [FK_EducationOrganizationIdentificationSystemDescriptor_EducationOrganizationIdentificationSystemType] FOREIGN KEY ([EducationOrganizationIdentificationSystemTypeId]) REFERENCES [edfi].[EducationOrganizationIdentificationSystemType] ([EducationOrganizationIdentificationSystemTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemDescriptor', @level2type = N'COLUMN', @level2name = N'EducationOrganizationIdentificationSystemDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for EducationOrgIdentificationSystemType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemDescriptor', @level2type = N'COLUMN', @level2name = N'EducationOrganizationIdentificationSystemTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the originating record system and code that is used for record-keeping purposes by education organizations.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationIdentificationSystemDescriptor';

