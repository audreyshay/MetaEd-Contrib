CREATE TABLE [edfiV3].[DisciplineDescriptor] (
    [DisciplineDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DisciplineDescriptor_PK] PRIMARY KEY CLUSTERED ([DisciplineDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisciplineDescriptor_Descriptor] FOREIGN KEY ([DisciplineDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
