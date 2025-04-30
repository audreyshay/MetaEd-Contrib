CREATE TABLE [edfiV3].[LanguageInstructionProgramServiceDescriptor] (
    [LanguageInstructionProgramServiceDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_LanguageInstructionProgramServiceDescriptor_PK] PRIMARY KEY CLUSTERED ([LanguageInstructionProgramServiceDescriptorId] ASC),
    CONSTRAINT [V3_FK_LanguageInstructionProgramServiceDescriptor_Descriptor] FOREIGN KEY ([LanguageInstructionProgramServiceDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);