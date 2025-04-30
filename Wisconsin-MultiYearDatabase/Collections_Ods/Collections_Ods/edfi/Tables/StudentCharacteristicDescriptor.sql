CREATE TABLE [edfi].[StudentCharacteristicDescriptor] (
    [StudentCharacteristicDescriptorId] INT NOT NULL,
    [StudentCharacteristicTypeId]       INT NULL,
    CONSTRAINT [PK_StudentCharacteristicDescriptor] PRIMARY KEY CLUSTERED ([StudentCharacteristicDescriptorId] ASC),
    CONSTRAINT [FK_StudentCharacteristicDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([StudentCharacteristicDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_StudentCharacteristicDescriptor_StudentCharacteristicType_StudentCharacteristicTypeId] FOREIGN KEY ([StudentCharacteristicTypeId]) REFERENCES [edfi].[StudentCharacteristicType] ([StudentCharacteristicTypeId])
);

