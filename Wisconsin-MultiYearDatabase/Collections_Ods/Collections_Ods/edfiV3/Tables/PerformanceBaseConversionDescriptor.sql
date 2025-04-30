CREATE TABLE [edfiV3].[PerformanceBaseConversionDescriptor] (
    [PerformanceBaseConversionDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_PerformanceBaseConversionDescriptor_PK] PRIMARY KEY CLUSTERED ([PerformanceBaseConversionDescriptorId] ASC),
    CONSTRAINT [V3_FK_PerformanceBaseConversionDescriptor_Descriptor] FOREIGN KEY ([PerformanceBaseConversionDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);