CREATE TABLE [edfiV3].[OperationalStatusDescriptor] (
    [OperationalStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_OperationalStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([OperationalStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_OperationalStatusDescriptor_Descriptor] FOREIGN KEY ([OperationalStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
