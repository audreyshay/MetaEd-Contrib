CREATE TABLE [edfiV3].[Staff] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[StaffUSI]                                     INT              IDENTITY (1, 1) NOT NULL,
    [PersonalTitlePrefix]                          NVARCHAR (30)    NULL,
    [FirstName]                                    NVARCHAR (75)    NOT NULL,
    [MiddleName]                                   NVARCHAR (75)    NULL,
    [LastSurname]                                  NVARCHAR (75)    NOT NULL,
    [GenerationCodeSuffix]                         NVARCHAR (10)    NULL,
    [MaidenName]                                   NVARCHAR (75)    NULL,
    [SexDescriptorId]                              INT              NULL,
    [BirthDate]                                    DATE             NULL,
    [HispanicLatinoEthnicity]                      BIT              NULL,
    [OldEthnicityDescriptorId]                     INT              NULL,
    [CitizenshipStatusDescriptorId]                INT              NULL,
    [HighestCompletedLevelOfEducationDescriptorId] INT              NULL,
    [YearsOfPriorProfessionalExperience]           DECIMAL (5, 2)   NULL,
    [YearsOfPriorTeachingExperience]               DECIMAL (5, 2)   NULL,
    [LoginId]                                      NVARCHAR (60)    NULL,
    [HighlyQualifiedTeacher]                       BIT              NULL,
    [StaffUniqueId]                                NVARCHAR (32)    NOT NULL,
    [CreateDate]                                   DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]                             DATETIME2 (7)         NOT NULL,
    [Id]                                           UNIQUEIDENTIFIER NOT NULL,
	[IsActive]									   BIT CONSTRAINT [V3_Staff_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_Staff_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StaffUSI] ASC),
    CONSTRAINT [V3_FK_Staff_CitizenshipStatusDescriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId]) REFERENCES [edfiV3].[CitizenshipStatusDescriptor] ([CitizenshipStatusDescriptorId]),
    --CONSTRAINT [V3_FK_Staff_LevelOfEducationDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationDescriptorId]) REFERENCES [edfiV3].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId]),
    CONSTRAINT [V3_FK_Staff_OldEthnicityDescriptor] FOREIGN KEY ([OldEthnicityDescriptorId]) REFERENCES [edfiV3].[OldEthnicityDescriptor] ([OldEthnicityDescriptorId]),
    CONSTRAINT [V3_FK_Staff_SexDescriptor] FOREIGN KEY ([SexDescriptorId]) REFERENCES [edfiV3].[SexDescriptor] ([SexDescriptorId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_Staff_UI_StaffUniqueId]
    ON [edfiV3].[Staff]([StaffUniqueId] ASC);
