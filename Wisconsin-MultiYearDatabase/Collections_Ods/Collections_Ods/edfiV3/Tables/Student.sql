CREATE TABLE [edfiV3].[Student] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [StudentUSI]                         INT              NOT NULL,
    [PersonalTitlePrefix]                NVARCHAR (30)    NULL,
    [FirstName]                          NVARCHAR (75)    NOT NULL,
    [MiddleName]                         NVARCHAR (75)    NULL,
    [LastSurname]                        NVARCHAR (75)    NOT NULL,
    [GenerationCodeSuffix]               NVARCHAR (10)    NULL,
    [MaidenName]                         NVARCHAR (75)    NULL,
    [BirthDate]                          DATE             NOT NULL,
    [BirthCity]                          NVARCHAR (30)    NULL,
    [BirthStateAbbreviationDescriptorId] INT              NULL,
    [BirthInternationalProvince]         NVARCHAR (150)   NULL,
    [BirthCountryDescriptorId]           INT              NULL,
    [DateEnteredUS]                      DATE             NULL,
    [MultipleBirthStatus]                BIT              NULL,
    [BirthSexDescriptorId]               INT              NULL,
    [CitizenshipStatusDescriptorId]      INT              NULL,
    [StudentUniqueId]                    NVARCHAR (32)    NOT NULL,
    [CreateDate]                         DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]                   DATETIME2 (7)         NOT NULL,
    [Id]                                 UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_Student_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [DpiCalcDateModified]						DATETIME         NULL,
	[EffectiveBirthDate] AS (CASE WHEN DATEPART(M, [BirthDate]) <> 2 OR DATEPART(DD, [BirthDate]) <> 29 THEN [BirthDate] ELSE DATEADD(DD, 1, [BirthDate]) END) PERSISTED NOT NULL,
	[DpiAge3rdFridaySept]                       TINYINT          NULL,
    [DpiAgeOct1]                       TINYINT          NULL,
    [DpiCompositeProficiencyLevel]              DECIMAL (2, 1)   NULL,
	[DpiTfsReportingDisability]                    VARCHAR (3)      NULL,
	[DpiCcReportingDisability]                    VARCHAR (3)      NULL,
    [DpiTfsAccountableSchoolId]          INT              NULL,
	[DpiCcAccountableSchoolId]          INT              NULL,
	[DpiCurrentSubmittingSchoolId]          INT              NULL,
	[DpiReportingDisability]                    VARCHAR (3)      NULL,
	CONSTRAINT [V3_Student_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_Student_CitizenshipStatusDescriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId]) REFERENCES [edfiV3].[CitizenshipStatusDescriptor] ([CitizenshipStatusDescriptorId]),
    CONSTRAINT [V3_FK_Student_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId]) REFERENCES [edfiV3].[CountryDescriptor] ([CountryDescriptorId]),
    CONSTRAINT [V3_FK_Student_SexDescriptor] FOREIGN KEY ([BirthSexDescriptorId]) REFERENCES [edfiV3].[SexDescriptor] ([SexDescriptorId]),
    CONSTRAINT [V3_FK_Student_DpiTfsAccountableSchoolId] FOREIGN KEY ([ApiSchoolYear],[DpiTfsAccountableSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
    CONSTRAINT [V3_FK_Student_DpiCcAccountableSchoolId] FOREIGN KEY ([ApiSchoolYear],[DpiCcAccountableSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
    CONSTRAINT [V3_FK_Student_DpiCurrentSubmittingSchoolId] FOREIGN KEY ([ApiSchoolYear],[DpiCurrentSubmittingSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
    CONSTRAINT [V3_FK_Student_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId]) REFERENCES [edfiV3].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_Student_Id]
    ON [edfiV3].[Student]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);


