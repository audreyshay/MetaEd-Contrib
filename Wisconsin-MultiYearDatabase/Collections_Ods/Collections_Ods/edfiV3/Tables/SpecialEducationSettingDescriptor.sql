CREATE TABLE [edfiV3].[SpecialEducationSettingDescriptor] (
    [SpecialEducationSettingDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_SpecialEducationSettingDescriptor_PK] PRIMARY KEY CLUSTERED ([SpecialEducationSettingDescriptorId] ASC),
    CONSTRAINT [V3_FK_SpecialEducationSettingDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationSettingDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

