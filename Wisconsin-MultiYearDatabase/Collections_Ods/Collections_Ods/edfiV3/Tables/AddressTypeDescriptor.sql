CREATE TABLE [edfiV3].[AddressTypeDescriptor] (
    [AddressTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_AddressTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([AddressTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_AddressTypeDescriptor_Descriptor] FOREIGN KEY ([AddressTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);