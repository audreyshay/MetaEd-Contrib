CREATE TABLE [edfiV3].[LimitedEnglishProficiencyDescriptor] (
    [LimitedEnglishProficiencyDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_LimitedEnglishProficiencyDescriptor_PK] PRIMARY KEY CLUSTERED ([LimitedEnglishProficiencyDescriptorId] ASC),
    CONSTRAINT [V3_FK_LimitedEnglishProficiencyDescriptor_Descriptor] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
