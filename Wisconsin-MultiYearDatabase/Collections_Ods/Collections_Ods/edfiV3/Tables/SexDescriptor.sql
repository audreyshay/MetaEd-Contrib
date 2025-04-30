CREATE TABLE [edfiV3].[SexDescriptor] (
    [SexDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_SexDescriptor_PK] PRIMARY KEY CLUSTERED ([SexDescriptorId] ASC),
    CONSTRAINT [V3_FK_SexDescriptor_Descriptor] FOREIGN KEY ([SexDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);



