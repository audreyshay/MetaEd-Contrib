CREATE TABLE [edfiV3].[CharterStatusDescriptor] (
    [CharterStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CharterStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([CharterStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_CharterStatusDescriptor_Descriptor] FOREIGN KEY ([CharterStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);