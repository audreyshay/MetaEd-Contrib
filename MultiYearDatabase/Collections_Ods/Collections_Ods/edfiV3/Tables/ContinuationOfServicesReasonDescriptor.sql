CREATE TABLE [edfiV3].[ContinuationOfServicesReasonDescriptor] (
    [ContinuationOfServicesReasonDescriptorId] INT NOT NULL,
    CONSTRAINT [V3ContinuationOfServicesReasonDescriptor_PK] PRIMARY KEY CLUSTERED ([ContinuationOfServicesReasonDescriptorId] ASC),
    CONSTRAINT [V3FK_ContinuationOfServicesReasonDescriptor_Descriptor] FOREIGN KEY ([ContinuationOfServicesReasonDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

