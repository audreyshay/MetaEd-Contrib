CREATE TABLE [edfiV3].[ParticipationDescriptor] (
    [ParticipationDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_ParticipationDescriptor_PK] PRIMARY KEY CLUSTERED ([ParticipationDescriptorId] ASC),
    CONSTRAINT [V3_FK_ParticipationDescriptor_Descriptor] FOREIGN KEY ([ParticipationDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

