CREATE TABLE [edfi].[Student] (
    [StudentUSI]                                INT              IDENTITY (1, 1) NOT NULL,
    [PersonalTitlePrefix]                       NVARCHAR (75)    NULL,
    [FirstName]                                 NVARCHAR (75)    NOT NULL,
    [MiddleName]                                NVARCHAR (75)    NULL,
    [LastSurname]                               NVARCHAR (75)    NOT NULL,
    [GenerationCodeSuffix]                      NVARCHAR (75)    NULL,
    [MaidenName]                                NVARCHAR (75)    NULL,
    [SexTypeId]                                 INT              NOT NULL,
    [BirthDate]                                 DATE             NOT NULL,
    [BirthCity]                                 NVARCHAR (30)    NULL,
    [BirthStateAbbreviationTypeId]              INT              NULL,
    [BirthCountryDescriptorId]                  INT              NULL,
    [DateEnteredUS]                             DATE             NULL,
    [MultipleBirthStatus]                       BIT              NULL,
    [ProfileThumbnail]                          NVARCHAR (59)    NULL,
    [HispanicLatinoEthnicity]                   BIT              NOT NULL,
    [OldEthnicityTypeId]                        INT              NULL,
    [EconomicDisadvantaged]                     BIT              NULL,
    [SchoolFoodServicesEligibilityDescriptorId] INT              NULL,
    [LimitedEnglishProficiencyDescriptorId]     INT              NULL,
    [DisplacementStatus]                        NVARCHAR (30)    NULL,
    [LoginId]                                   NVARCHAR (60)    NULL,
    [BirthInternationalProvince]                NVARCHAR (150)   NULL,
    [CitizenshipStatusTypeId]                   INT              NULL,
    [StudentUniqueId]                           NVARCHAR (10)    NOT NULL,
    [Id]                                        UNIQUEIDENTIFIER CONSTRAINT [Student_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                          DATETIME         CONSTRAINT [Student_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                                DATETIME         CONSTRAINT [Student_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [SchoolYear]                                SMALLINT         DEFAULT (datepart(year,getdate())) NOT NULL,
    [DpiRaceEthnicity]                          VARCHAR (12)     NULL,
    [DpiRaceEthnicityKey]                       VARCHAR (5)      NULL,
    [DpiEconomicDisadvantaged]                  CHAR (1)         NULL,
    [DpiAge3rdFridaySept]                       TINYINT          NULL,
    [DpiCompositeProficiencyLevel]              DECIMAL (2, 1)   NULL,
    [DpiLiteracyProficiencyLevel]               DECIMAL (2, 1)   NULL,
    [DpiOasId]                                  INT              NULL,
    [DpiReportingDisability]                    VARCHAR (3)      NULL,
    [DpiCompositeAndLiteracyProficiencyIsSet]   BIT              NULL,
    [IsActive]                                  BIT              CONSTRAINT [DF_Student_IsActive] DEFAULT ((1)) NOT NULL,
    [Dpi3rdFriSeptAccountableSchoolId] INT NULL, 
    [DpiOct1AccountableSchoolId] INT NULL, 
    [DpiCurrentAccountableSchoolId] INT NULL, 
    [Dpi3rdFriSeptReportingDisability]          VARCHAR (3)      NULL,
    [DpiOct1ReportingDisability]                VARCHAR (3)      NULL,
	[DpiCalcDateModified]						DATETIME         NULL,
    [EffectiveBirthDate] AS (CASE WHEN DATEPART(M, [BirthDate]) <> 2 OR DATEPART(DD, [BirthDate]) <> 29 THEN [BirthDate] ELSE DATEADD(DD, 1, [BirthDate]) END) PERSISTED NOT NULL,
	CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC,[StudentUSI] ASC),
    CONSTRAINT [FK_Student_CitizenshipStatusType_CitizenshipStatusTypeId] 
		FOREIGN KEY ([CitizenshipStatusTypeId]) 
		REFERENCES [edfi].[CitizenshipStatusType] ([CitizenshipStatusTypeId]),
    CONSTRAINT [FK_Student_CountryCodeType_BirthCountryCodeTypeId] 
		FOREIGN KEY ([BirthCountryDescriptorId]) 
		REFERENCES [edfi].[CountryCodeType] ([CountryCodeTypeId]),
    CONSTRAINT [FK_Student_LimitedEnglishProficiencyDescriptorId] 
		FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId]) 
		REFERENCES [edfi].[LimitedEnglishProficiencyDescriptor] ([LimitedEnglishProficiencyDescriptorId]),
    CONSTRAINT [FK_Student_OldEthnicityType_OldEthnicityTypeId] 
		FOREIGN KEY ([OldEthnicityTypeId]) 
		REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId]),
    CONSTRAINT [FK_Student_SchoolFoodServicesEligibilityDescriptor_SchoolFoodServicesEligibilityDescriptorId] 
		FOREIGN KEY ([SchoolFoodServicesEligibilityDescriptorId]) 
		REFERENCES [edfi].[SchoolFoodServicesEligibilityDescriptor] ([SchoolFoodServicesEligibilityDescriptorId]),
    CONSTRAINT [FK_Student_SexType_SexTypeId] 
		FOREIGN KEY ([SexTypeId]) 
		REFERENCES [edfi].[SexType] ([SexTypeId]),
    CONSTRAINT [FK_Student_StateAbbreviationType_StateOfBirthAbbreviationTypeId] 
		FOREIGN KEY ([BirthStateAbbreviationTypeId]) 
		REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
);

GO
CREATE NONCLUSTERED INDEX IX_Student_DpiRaceEthnicity 
	ON [edfi].[Student] ([DpiRaceEthnicity]) 
	INCLUDE ( [StudentUSI], [LastModifiedDate], [SchoolYear], [IsActive]);

GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_Student]
    ON [edfi].[Student]([Id] ASC, [SchoolYear] ASC);
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UI_Student_StudentUniqueId]
    ON [edfi].[Student]([StudentUniqueId] ASC, [SchoolYear] ASC);
	

GO

CREATE NONCLUSTERED INDEX [IX_Student_StudentUSI]
    ON [edfi].[Student]([StudentUSI] ASC)
    INCLUDE([SexTypeId], [FirstName], [LastSurname], [DpiEconomicDisadvantaged], [Id], [StudentUniqueId], [IsActive]);

GO
CREATE NONCLUSTERED INDEX IX_Student_SexTypeId
ON [edfi].[Student] ([SexTypeId])
INCLUDE ([StudentUSI],[SchoolYear],[DpiRaceEthnicity], [IsActive])


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This entity represents an individual for whom instruction, services and/or care are provided in an early childhood, elementary or secondary educational program under the jurisdiction of a school, education agency or other institution or program. A student is a person who has been enrolled in a school or other educational institution.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A prefix used to denote the title, degree, position or seniority of the person.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'PersonalTitlePrefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.
NEDM: First Name', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.
NEDM: Middle Name', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name borne in common by members of a family.
NEDM: Last Name/Surname', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'LastSurname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'GenerationCodeSuffix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The person''''s maiden name, if applicable.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MaidenName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A person''''s gender.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'SexTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual was born.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The set of elements that capture relevant data regarding a person''s birth, including birth date and place of birth.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The abbreviation for the name of the state (within the United States) or extra-state jurisdiction in which an individual was born.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthStateAbbreviationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the country in which an individual was born. (Note: A list of countries and codes is currently maintained and updated by the ISO as ISO 3166 on its website: http://www.iso.org/iso/country_codes.htm)
NEDM: Country Of Birth Code', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthCountryDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For students born outside of the US, the date the student entered the US.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'DateEnteredUS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicator of whether the student was born with other siblings (i.e., twins, triplets, etc.)', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'MultipleBirthStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File name for the ProfileThumbnail photograph', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'ProfileThumbnail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'HispanicLatinoEthnicity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous definition of Ethnicity combining Hispanic/latino and race:
1 - American Indian or Alaskan Native
2 - Asian or Pacific Islander
3 - Black, not of Hispanic origin
4 - Hispanic
5 - White, not of Hispanic origin', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'OldEthnicityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of inadequate financial condition of an individual''''s family, as determined by family income, number of family members/dependents, participation in public assistance programs, and/or other characteristics considered relevant by federal, state, and local policy.
NEDM: Economic Disadvantaged Status', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'EconomicDisadvantaged';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'SchoolFoodServicesEligibilityDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the student has sufficient difficulty speaking, reading, writing, or understanding the English language, as to require special English Language services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'LimitedEnglishProficiencyDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates a state health or weather related event that displaces a group of students, and may require additional funding, educational, or social services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'DisplacementStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The login ID for the user; used for security access control interface.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'LoginId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For students born outside of the US, the Province or jurisdiction in which an individual is born.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'BirthInternationalProvince';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'CitizenshipStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique alpha-numeric code assigned to a student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Student', @level2type = N'COLUMN', @level2name = N'StudentUniqueId';


GO
