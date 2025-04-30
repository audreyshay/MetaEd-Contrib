CREATE TABLE [edfiV3].[ProgressLevelDescriptor] (
    [ProgressLevelDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ProgressLevelDescriptor_PK] PRIMARY KEY CLUSTERED ([ProgressLevelDescriptorId] ASC),
    CONSTRAINT [V3_FK_ProgressLevelDescriptor_Descriptor] FOREIGN KEY ([ProgressLevelDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

