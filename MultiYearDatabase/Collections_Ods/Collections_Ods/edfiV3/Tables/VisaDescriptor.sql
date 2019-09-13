CREATE TABLE [edfiV3].[VisaDescriptor] (
    [VisaDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_VisaDescriptor_PK] PRIMARY KEY CLUSTERED ([VisaDescriptorId] ASC),
    CONSTRAINT [V3_FK_VisaDescriptor_Descriptor] FOREIGN KEY ([VisaDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);