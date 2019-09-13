CREATE TABLE [edfiV3].[StudentCharacteristicDescriptor] (
    [StudentCharacteristicDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StudentCharacteristicDescriptor_PK] PRIMARY KEY CLUSTERED ([StudentCharacteristicDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentCharacteristicDescriptor_Descriptor] FOREIGN KEY ([StudentCharacteristicDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


