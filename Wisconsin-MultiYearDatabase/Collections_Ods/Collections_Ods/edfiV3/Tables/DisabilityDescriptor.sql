CREATE TABLE [edfiV3].[DisabilityDescriptor] (
    [DisabilityDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DisabilityDescriptor_PK] PRIMARY KEY CLUSTERED ([DisabilityDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisabilityDescriptor_Descriptor] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

