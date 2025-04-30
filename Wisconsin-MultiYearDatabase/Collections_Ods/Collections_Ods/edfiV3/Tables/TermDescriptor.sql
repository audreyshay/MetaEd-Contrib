CREATE TABLE [edfiV3].[TermDescriptor] (
    [TermDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_TermDescriptor_PK] PRIMARY KEY CLUSTERED ([TermDescriptorId] ASC),
    CONSTRAINT [V3_FK_TermDescriptor_Descriptor] FOREIGN KEY ([TermDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

