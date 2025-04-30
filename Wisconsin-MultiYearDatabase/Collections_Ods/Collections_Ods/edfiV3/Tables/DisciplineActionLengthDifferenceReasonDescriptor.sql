CREATE TABLE [edfiV3].[DisciplineActionLengthDifferenceReasonDescriptor] (
    [DisciplineActionLengthDifferenceReasonDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_DisciplineActionLengthDifferenceReasonDescriptor_PK] PRIMARY KEY CLUSTERED ([DisciplineActionLengthDifferenceReasonDescriptorId] ASC),
    CONSTRAINT [V3_FK_DisciplineActionLengthDifferenceReasonDescriptor_Descriptor] FOREIGN KEY ([DisciplineActionLengthDifferenceReasonDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
