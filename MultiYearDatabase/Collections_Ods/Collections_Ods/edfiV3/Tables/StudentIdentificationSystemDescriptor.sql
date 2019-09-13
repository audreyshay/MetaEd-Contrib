CREATE TABLE [edfiV3].[StudentIdentificationSystemDescriptor] (
    [StudentIdentificationSystemDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StudentIdentificationSystemDescriptor_PK] PRIMARY KEY CLUSTERED ([StudentIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentIdentificationSystemDescriptor_Descriptor] FOREIGN KEY ([StudentIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);