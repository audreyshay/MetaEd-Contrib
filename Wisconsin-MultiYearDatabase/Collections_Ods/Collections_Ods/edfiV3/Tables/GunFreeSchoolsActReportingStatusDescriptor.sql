CREATE TABLE [edfiV3].[GunFreeSchoolsActReportingStatusDescriptor] (
    [GunFreeSchoolsActReportingStatusDescriptorId] INT NOT NULL,
    CONSTRAINT [V3_GunFreeSchoolsActReportingStatusDescriptor_PK] PRIMARY KEY CLUSTERED ([GunFreeSchoolsActReportingStatusDescriptorId] ASC),
    CONSTRAINT [V3_FK_GunFreeSchoolsActReportingStatusDescriptor_Descriptor] FOREIGN KEY ([GunFreeSchoolsActReportingStatusDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);