CREATE TABLE [edfiV3].[StateEducationAgency] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [StateEducationAgencyId] INT NOT NULL,
    CONSTRAINT [V3_StateEducationAgency_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StateEducationAgencyId] ASC),
    CONSTRAINT [V3_FK_StateEducationAgency_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [StateEducationAgencyId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]) ON DELETE CASCADE
);