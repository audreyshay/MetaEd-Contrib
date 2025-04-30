CREATE TABLE [edfiV3].[AttemptStatusDescriptor] (
    [AttemptStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [AttemptStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([AttemptStatusDescriptorId] ASC),
    CONSTRAINT [FK_AttemptStatusDescriptor_Descriptor] FOREIGN KEY ([AttemptStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);