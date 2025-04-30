CREATE TABLE [edfiV3].[EntryGradeLevelReasonDescriptor] (
    [EntryGradeLevelReasonDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_EntryGradeLevelReasonDescriptor_PK] PRIMARY KEY CLUSTERED ([EntryGradeLevelReasonDescriptorId] ASC),
    CONSTRAINT [V3_FK_EntryGradeLevelReasonDescriptor_Descriptor] FOREIGN KEY ([EntryGradeLevelReasonDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

