CREATE TABLE [edfiV3].[MonitoredDescriptor] (
    [MonitoredDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_MonitoredDescriptor_PK] PRIMARY KEY CLUSTERED ([MonitoredDescriptorId] ASC),
    CONSTRAINT [V3_FK_MonitoredDescriptor_Descriptor] FOREIGN KEY ([MonitoredDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
