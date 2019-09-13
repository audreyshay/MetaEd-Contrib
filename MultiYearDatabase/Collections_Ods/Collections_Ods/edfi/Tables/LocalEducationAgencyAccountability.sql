CREATE TABLE [edfi].[LocalEducationAgencyAccountability] (
    [LocalEducationAgencyId]                 INT      NOT NULL,
    [SchoolYear]                             SMALLINT NOT NULL,
    [GunFreeSchoolsActReportingStatusTypeId] INT      NULL,
    [SchoolChoiceImplementStatusTypeId]      INT      NULL,
    [CreateDate]                             DATETIME CONSTRAINT [LocalEducationAgencyAccountability_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LocalEducationAgencyAccountability] PRIMARY KEY CLUSTERED ([SchoolYear] ASC, [LocalEducationAgencyId] ASC),
    CONSTRAINT [FK_LocalEducationAgencyAccountability_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([SchoolYear],[LocalEducationAgencyId]) REFERENCES [edfi].[LocalEducationAgency] ([SchoolYear],[LocalEducationAgencyId]) ON DELETE CASCADE,
    CONSTRAINT [FK_LocalEducationAgencyAccountability_SchoolChoiceImplementStatusType_SchoolChoiceImplementationStatusTypeId] FOREIGN KEY ([SchoolChoiceImplementStatusTypeId]) REFERENCES [edfi].[SchoolChoiceImplementStatusType] ([SchoolChoiceImplementStatusTypeId]),
    CONSTRAINT [FK_LocalEducationAgencyAccountability_SchoolYearType_SchoolYear] FOREIGN KEY ([SchoolYear]) REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
);


GO
CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyAccountability_SchoolChoiceImplementStatusType_SchoolChoiceImplementationStatusTypeId]
    ON [edfi].[LocalEducationAgencyAccountability]([SchoolChoiceImplementStatusTypeId] ASC);



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity maintains information about federal reporting and accountability for Local Education Agencies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyAccountability';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyAccountability', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for School', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyAccountability', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyAccountability', @level2type = N'COLUMN', @level2name = N'GunFreeSchoolsActReportingStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyAccountability', @level2type = N'COLUMN', @level2name = N'SchoolChoiceImplementStatusTypeId';

