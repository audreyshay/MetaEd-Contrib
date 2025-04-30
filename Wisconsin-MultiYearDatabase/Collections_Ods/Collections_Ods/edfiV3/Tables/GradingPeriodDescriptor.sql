CREATE TABLE [edfiV3].[GradingPeriodDescriptor] (
    [GradingPeriodDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_GradingPeriodDescriptor_PK] PRIMARY KEY CLUSTERED ([GradingPeriodDescriptorId] ASC),
    CONSTRAINT [V3_FK_GradingPeriodDescriptor_Descriptor] FOREIGN KEY ([GradingPeriodDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
