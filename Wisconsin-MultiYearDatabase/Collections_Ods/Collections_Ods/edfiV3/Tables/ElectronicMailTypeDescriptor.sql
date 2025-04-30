CREATE TABLE [edfiV3].[ElectronicMailTypeDescriptor] (
    [ElectronicMailTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ElectronicMailTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([ElectronicMailTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_ElectronicMailTypeDescriptor_Descriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
