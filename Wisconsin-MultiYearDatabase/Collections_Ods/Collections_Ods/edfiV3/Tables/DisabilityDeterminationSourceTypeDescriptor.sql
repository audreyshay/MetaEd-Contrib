CREATE TABLE [edfiV3].[DisabilityDeterminationSourceTypeDescriptor] (
    [DisabilityDeterminationSourceTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DisabilityDeterminationSourceTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([DisabilityDeterminationSourceTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisabilityDeterminationSourceTypeDescriptor_Descriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

