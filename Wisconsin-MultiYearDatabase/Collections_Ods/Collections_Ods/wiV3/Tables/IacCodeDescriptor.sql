CREATE TABLE [wiV3].[IacCodeDescriptor] (
    [IacCodeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_IacCodeDescriptor_PK] PRIMARY KEY CLUSTERED ([IacCodeDescriptorId] ASC),
    CONSTRAINT [V3_FK_IacCodeDescriptor_Descriptor] FOREIGN KEY ([IacCodeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

