CREATE TABLE [leadata].[Student] (
    [StudentUSI]                   INT           IDENTITY (1, 1) NOT NULL,
    [PersonalTitlePrefix]          NVARCHAR (75) NULL,
    [FirstName]                    NVARCHAR (75) NOT NULL,
    [MiddleName]                   NVARCHAR (75) NULL,
    [LastSurname]                  NVARCHAR (75) NOT NULL,
    [GenerationCodeSuffix]         NVARCHAR (75) NULL,
    [MaidenName]                   NVARCHAR (75) NULL,
    [SexTypeId]                    INT           NULL,
    [BirthDate]                    DATE          NOT NULL,
    [CityOfBirth]                  NVARCHAR (30) NULL,
    [BirthStateAbbreviationTypeId] INT           NULL,
    [BirthCountryCodeTypeId]       INT           NULL,
    [HispanicLatinoEthnicity]      BIT           CONSTRAINT [Student_DF_HispanicLatinoEthnicity] DEFAULT 0 NOT NULL,
    [StudentUniqueId]              NVARCHAR (32) NOT NULL,
    [TribalName]                   NVARCHAR (75) NULL,
    [SourceId]                     UNIQUEIDENTIFIER NULL,
    [CreateDate]                   DATETIME      CONSTRAINT [Student_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [LastModifiedDate]             DATETIME      CONSTRAINT [Student_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [LoadDate]                     DATETIME      CONSTRAINT [Student_DF_Loaddate] DEFAULT (getutcdate()) NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [Student_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([StudentUSI] ASC),
    CONSTRAINT [FK_Student_CountryCodeType] FOREIGN KEY ([BirthCountryCodeTypeId]) REFERENCES [leadata].[CountryCodeType] ([CountryCodeTypeId]),
    CONSTRAINT [FK_Student_SexType_SexTypeId] FOREIGN KEY ([SexTypeId]) REFERENCES [leadata].[SexType] ([SexTypeId]),
    CONSTRAINT [FK_Student_StateAbbreviationType] FOREIGN KEY ([BirthStateAbbreviationTypeId]) REFERENCES [leadata].[StateAbbreviationType] ([StateAbbreviationTypeId])
);

GO
CREATE NONCLUSTERED INDEX [IXNC_Student_StudentUniqueId]
    ON [leadata].[Student]([StudentUniqueId] ASC);

