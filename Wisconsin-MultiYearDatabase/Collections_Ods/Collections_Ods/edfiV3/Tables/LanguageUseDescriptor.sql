CREATE TABLE [edfiV3].[LanguageUseDescriptor]
(  [LanguageUseDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_LanguageUseDescriptor_PK] PRIMARY KEY CLUSTERED ([LanguageUseDescriptorId] ASC),
    CONSTRAINT [V3_FK_LanguageUseDescriptor_Descriptor] FOREIGN KEY ([LanguageUseDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);