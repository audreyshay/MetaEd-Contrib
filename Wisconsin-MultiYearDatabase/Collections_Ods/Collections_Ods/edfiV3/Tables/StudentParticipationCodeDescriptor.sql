CREATE TABLE [edfiV3].[StudentParticipationCodeDescriptor] (
    [StudentParticipationCodeDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_StudentParticipationCodeDescriptor_PK] PRIMARY KEY CLUSTERED ([StudentParticipationCodeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentParticipationCodeDescriptor_Descriptor] FOREIGN KEY ([StudentParticipationCodeDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
