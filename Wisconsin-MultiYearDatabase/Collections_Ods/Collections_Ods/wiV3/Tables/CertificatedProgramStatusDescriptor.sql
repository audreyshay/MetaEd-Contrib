CREATE TABLE [wiV3].[CertificatedProgramStatusDescriptor] (
    [CertificatedProgramStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_CertificatedProgramStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([CertificatedProgramStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_CertificatedProgramStatusDescriptor_Descriptor] FOREIGN KEY ([CertificatedProgramStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);

