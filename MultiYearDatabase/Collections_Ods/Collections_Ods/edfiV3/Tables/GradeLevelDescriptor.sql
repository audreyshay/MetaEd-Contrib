CREATE TABLE [edfiV3].[GradeLevelDescriptor] (
    [GradeLevelDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_GradeLevelDescriptor_PK] PRIMARY KEY CLUSTERED ([GradeLevelDescriptorId] ASC),
    CONSTRAINT [V3_FK_GradeLevelDescriptor_Descriptor] FOREIGN KEY ([GradeLevelDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);