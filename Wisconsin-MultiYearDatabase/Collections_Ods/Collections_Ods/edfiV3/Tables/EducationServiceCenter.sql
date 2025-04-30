CREATE TABLE [edfiV3].[EducationServiceCenter] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,  
    [EducationServiceCenterId] INT NOT NULL,
    [StateEducationAgencyId]   INT NULL,
    CONSTRAINT [V3_EducationServiceCenter_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationServiceCenterId] ASC),
    CONSTRAINT [V3_FK_EducationServiceCenter_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [EducationServiceCenterId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_EducationServiceCenter_StateEducationAgency] FOREIGN KEY ([ApiSchoolYear], [StateEducationAgencyId]) REFERENCES [edfiV3].[StateEducationAgency] ([ApiSchoolYear], [StateEducationAgencyId])
);


