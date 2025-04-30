CREATE TABLE [wiV3].[CountDateReceivingServiceDescriptor] (
    [CountDateReceivingServiceDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CountDateReceivingServiceDescriptor_PK] PRIMARY KEY CLUSTERED ([CountDateReceivingServiceDescriptorId] ASC),
    CONSTRAINT [V3_FK_CountDateReceivingServiceDescriptor_Descriptor] FOREIGN KEY ([CountDateReceivingServiceDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

