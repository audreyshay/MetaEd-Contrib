CREATE TABLE [edfiV3].[CitizenshipStatusDescriptor] (
    [CitizenshipStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CitizenshipStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([CitizenshipStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_CitizenshipStatusDescriptor_Descriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

