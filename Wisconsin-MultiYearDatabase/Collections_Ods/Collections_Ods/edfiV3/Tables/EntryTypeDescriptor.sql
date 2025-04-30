CREATE TABLE [edfiV3].[EntryTypeDescriptor] (
    [EntryTypeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_EntryTypeDescriptor_PK] PRIMARY KEY CLUSTERED ([EntryTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_EntryTypeDescriptor_Descriptor] FOREIGN KEY ([EntryTypeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
