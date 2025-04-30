CREATE TABLE [edfiV3].[OldEthnicityDescriptor] (
    [OldEthnicityDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_OldEthnicityDescriptor_PK] PRIMARY KEY CLUSTERED ([OldEthnicityDescriptorId] ASC),
    CONSTRAINT [V3_FK_OldEthnicityDescriptor_Descriptor] FOREIGN KEY ([OldEthnicityDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
