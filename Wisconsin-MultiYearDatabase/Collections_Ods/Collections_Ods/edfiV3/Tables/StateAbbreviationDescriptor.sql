CREATE TABLE [edfiV3].[StateAbbreviationDescriptor] (
    [StateAbbreviationDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StateAbbreviationDescriptor_PK] PRIMARY KEY CLUSTERED ([StateAbbreviationDescriptorId] ASC),
    CONSTRAINT [V3_FK_StateAbbreviationDescriptor_Descriptor] FOREIGN KEY ([StateAbbreviationDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);