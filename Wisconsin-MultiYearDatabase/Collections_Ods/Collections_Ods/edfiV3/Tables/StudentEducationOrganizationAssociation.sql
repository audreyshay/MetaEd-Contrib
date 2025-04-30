CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId]               INT              NOT NULL,
    [StudentUSI]                            INT              NOT NULL,
    [SexDescriptorId]                       INT              NOT NULL,
    [ProfileThumbnail]                      NVARCHAR (255)   NULL,
    [HispanicLatinoEthnicity]               BIT              NULL,
    [OldEthnicityDescriptorId]              INT              NULL,
    [LimitedEnglishProficiencyDescriptorId] INT              NULL,
    [LoginId]                               NVARCHAR (60)    NULL,
    [CreateDate]                            DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]                      DATETIME2 (7)         NOT NULL,
    [Id]                                    UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_StudentEducationOrganizationAssociation_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [DpiCalcDateModified]						DATETIME         NULL,
	[DpiRaceEthnicity]                          VARCHAR (12)     NULL,
    [DpiRaceEthnicityKey]                       VARCHAR (5)      NULL,
	[DpiReportingDisability]                    VARCHAR (3)      NULL,
    [DpiEconomicDisadvantaged]					CHAR			 NULL, 
    CONSTRAINT [V3_StudentEducationOrganizationAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociation_EducationOrganization] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId]) REFERENCES [edfiV3].[EducationOrganization] ([ApiSchoolYear], [EducationOrganizationId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociation_LimitedEnglishProficiencyDescriptor] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) REFERENCES [edfiV3].[LimitedEnglishProficiencyDescriptor] ([LimitedEnglishProficiencyDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociation_OldEthnicityDescriptor] FOREIGN KEY ([OldEthnicityDescriptorId]) REFERENCES [edfiV3].[OldEthnicityDescriptor] ([OldEthnicityDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociation_SexDescriptor] FOREIGN KEY ([SexDescriptorId]) REFERENCES [edfiV3].[SexDescriptor] ([SexDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociation_Student] FOREIGN KEY ([ApiSchoolYear], [StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear], [StudentUSI])
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_StudentEducationOrganizationAssociation_Id]
    ON [edfiV3].[StudentEducationOrganizationAssociation]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


GO

