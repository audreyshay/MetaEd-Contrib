CREATE TABLE [edfiV3].[LocalEducationAgencyAccountability] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[LocalEducationAgencyId]                       INT      NOT NULL,
    [SchoolYear]                                   SMALLINT NOT NULL,
    [GunFreeSchoolsActReportingStatusDescriptorId] INT      NULL,
    [SchoolChoiceImplementStatusDescriptorId]      INT      NULL,
    [CreateDate]                                   DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_LocalEducationAgencyAccountability_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [LocalEducationAgencyId] ASC, [SchoolYear] ASC),
    CONSTRAINT [V3_FK_LocalEducationAgencyAccountability_GunFreeSchoolsActReportingStatusDescriptor] FOREIGN KEY ([GunFreeSchoolsActReportingStatusDescriptorId]) REFERENCES [edfiV3].[GunFreeSchoolsActReportingStatusDescriptor] ([GunFreeSchoolsActReportingStatusDescriptorId]),
    CONSTRAINT [V3_FK_LocalEducationAgencyAccountability_LocalEducationAgency] FOREIGN KEY ([ApiSchoolYear], [LocalEducationAgencyId]) REFERENCES [edfiV3].[LocalEducationAgency] ([ApiSchoolYear], [LocalEducationAgencyId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_LocalEducationAgencyAccountability_SchoolChoiceImplementStatusDescriptor] FOREIGN KEY ([SchoolChoiceImplementStatusDescriptorId]) REFERENCES [edfiV3].[SchoolChoiceImplementStatusDescriptor] ([SchoolChoiceImplementStatusDescriptorId]),
    CONSTRAINT [V3_FK_LocalEducationAgencyAccountability_SchoolYearType] FOREIGN KEY ([SchoolYear]) REFERENCES [edfiV3].[SchoolYearType] ([SchoolYear])
);


GO