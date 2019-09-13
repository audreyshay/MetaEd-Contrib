CREATE TABLE [edfiV3].[ProgressDescriptor] (
    [ProgressDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ProgressDescriptor_PK] PRIMARY KEY CLUSTERED ([ProgressDescriptorId] ASC),
    CONSTRAINT [V3_FK_ProgressDescriptor_Descriptor] FOREIGN KEY ([ProgressDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

