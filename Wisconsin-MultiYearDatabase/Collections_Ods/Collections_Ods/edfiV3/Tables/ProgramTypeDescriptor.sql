CREATE TABLE [edfiV3].[ProgramTypeDescriptor] (
    [ProgramTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ProgramTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_ProgramTypeDescriptor_Descriptor] FOREIGN KEY ([ProgramTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
