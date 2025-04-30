CREATE TABLE [edfiV3].[LanguageDescriptor]
(
	[LanguageDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_LanguageDescriptor_PK] PRIMARY KEY CLUSTERED ([LanguageDescriptorId] ASC),
    CONSTRAINT [V3_FK_LanguageDescriptor_Descriptor] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
