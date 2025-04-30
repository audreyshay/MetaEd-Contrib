CREATE TABLE [edfiV3].[CourseLevelCharacteristicDescriptor] (
    [CourseLevelCharacteristicDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CourseLevelCharacteristicDescriptor_PK] PRIMARY KEY CLUSTERED ([CourseLevelCharacteristicDescriptorId] ASC),
    CONSTRAINT [V3_FK_CourseLevelCharacteristicDescriptor_Descriptor] FOREIGN KEY ([CourseLevelCharacteristicDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
