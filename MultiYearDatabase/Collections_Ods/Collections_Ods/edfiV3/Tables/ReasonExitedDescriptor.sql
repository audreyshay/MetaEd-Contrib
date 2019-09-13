CREATE TABLE [edfiV3].[ReasonExitedDescriptor] (
    [ReasonExitedDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ReasonExitedDescriptor_PK] PRIMARY KEY CLUSTERED ([ReasonExitedDescriptorId] ASC),
    CONSTRAINT [V3_FK_ReasonExitedDescriptor_Descriptor] FOREIGN KEY ([ReasonExitedDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

