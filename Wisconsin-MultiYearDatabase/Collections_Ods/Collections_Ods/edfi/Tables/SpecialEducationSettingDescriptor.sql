CREATE TABLE [edfi].[SpecialEducationSettingDescriptor] (
    [SpecialEducationSettingDescriptorId] INT NOT NULL,
    [SpecialEducationSettingTypeId]       INT NULL,
    CONSTRAINT [PK_SpecialEducationSettingDescriptor] PRIMARY KEY CLUSTERED ([SpecialEducationSettingDescriptorId] ASC),
    CONSTRAINT [FK_SpecialEducationSettingDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([SpecialEducationSettingDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_SpecialEducationSettingDescriptor_SpecialEducationSettingType_SpecialEducationSettingTypeId] FOREIGN KEY ([SpecialEducationSettingTypeId]) REFERENCES [edfi].[SpecialEducationSettingType] ([SpecialEducationSettingTypeId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SpecialEducationSettingDescriptor', @level2type = N'COLUMN', @level2name = N'SpecialEducationSettingTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SpecialEducationSettingDescriptor', @level2type = N'COLUMN', @level2name = N'SpecialEducationSettingDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the major instructional setting (more than 50 percent of a student''s special education program).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SpecialEducationSettingDescriptor';

