CREATE TABLE [edfiV3].[OtherNameTypeDescriptor] (
    [OtherNameTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [OtherNameTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([OtherNameTypeDescriptorId] ASC),
    CONSTRAINT [FK_OtherNameTypeDescriptor_Descriptor] FOREIGN KEY ([OtherNameTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);