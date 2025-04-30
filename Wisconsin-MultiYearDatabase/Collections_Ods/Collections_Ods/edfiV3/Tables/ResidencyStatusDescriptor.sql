CREATE TABLE [edfiV3].[ResidencyStatusDescriptor] (
    [ResidencyStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ResidencyStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([ResidencyStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_ResidencyStatusDescriptor_Descriptor] FOREIGN KEY ([ResidencyStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


