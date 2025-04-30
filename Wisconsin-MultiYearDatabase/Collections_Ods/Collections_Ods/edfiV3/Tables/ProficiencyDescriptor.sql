CREATE TABLE [edfiV3].[ProficiencyDescriptor] (
    [ProficiencyDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ProficiencyDescriptor_PK] PRIMARY KEY CLUSTERED ([ProficiencyDescriptorId] ASC),
    CONSTRAINT [V3_FK_ProficiencyDescriptor_Descriptor] FOREIGN KEY ([ProficiencyDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

