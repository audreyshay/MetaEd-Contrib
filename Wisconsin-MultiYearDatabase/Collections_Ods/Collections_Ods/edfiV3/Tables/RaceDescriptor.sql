CREATE TABLE [edfiV3].[RaceDescriptor] (
    [RaceDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_RaceDescriptor_PK] PRIMARY KEY CLUSTERED ([RaceDescriptorId] ASC),
    CONSTRAINT [V3_FK_RaceDescriptor_Descriptor] FOREIGN KEY ([RaceDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

