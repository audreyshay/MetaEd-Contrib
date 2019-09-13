CREATE TABLE [edfiV3].[MediumOfInstructionDescriptor] (
    [MediumOfInstructionDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_MediumOfInstructionDescriptor_PK] PRIMARY KEY CLUSTERED ([MediumOfInstructionDescriptorId] ASC),
    CONSTRAINT [V3_FK_MediumOfInstructionDescriptor_Descriptor] FOREIGN KEY ([MediumOfInstructionDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
