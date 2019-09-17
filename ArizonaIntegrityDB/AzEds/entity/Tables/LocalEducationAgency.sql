CREATE TABLE [entity].[LocalEducationAgency] (
    [LocalEducationAgencyId]             INT NOT NULL,
    [FiscalYear]                         INT NOT NULL,
    [LocalEducationAgencyCategoryTypeId] INT NOT NULL,
    [SectorTypeId]                       INT NOT NULL,
    [IsOutOfState]                       SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsOutOfState] DEFAULT ((-1)) NOT NULL,
    [IsCTE]                              SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsCTE] DEFAULT ((-1)) NOT NULL,
    [IsAccommodationDistrict]            SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsAccommodationDistrict] DEFAULT ((-1)) NOT NULL,
    [IsSecureCare]                       SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsSecureCare] DEFAULT ((-1)) NOT NULL,
    [IsExceptional]                      SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsExceptional] DEFAULT ((-1)) NOT NULL,
    [IsHeadStart]                        SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsHeadStart] DEFAULT ((-1)) NOT NULL,
    [IsValidForDOR]                      SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsValidForDOA] DEFAULT ((-1)) NOT NULL,
    [IsTransportation]                   SMALLINT CONSTRAINT [DF_LocalEducationAgency_IsTransportation] DEFAULT ((-1)) NOT NULL,
	[IsElementaryNotInHighSchool]        SMALLINT CONSTRAINT [DF_LocalEducationAgency_ElementaryNotInHighSchool] DEFAULT ((-1)) NOT NULL,
	[IsHighSchoolDistrict]               SMALLINT CONSTRAINT [DF_LocalEducationAgency_HighSchoolDistrict] DEFAULT ((-1)) NOT NULL,
	[Has200DayCalendar]					 BIT  CONSTRAINT [DF_LocalEducationAgency_Has200DayCalendar] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_LocalEducationAgency] PRIMARY KEY CLUSTERED ([LocalEducationAgencyId] ASC, [FiscalYear] ASC),
    CONSTRAINT [FK_LocalEducationAgency_EducationOrganization_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_LocalEducationAgency_LocalEducationAgencyCategoryType] FOREIGN KEY ([LocalEducationAgencyCategoryTypeId]) REFERENCES [entity].[LocalEducationAgencyCategoryType] ([LocalEducationAgencyCategoryTypeId]),
    CONSTRAINT [FK_LocalEducationAgency_SectorType] FOREIGN KEY ([SectorTypeId]) REFERENCES [entity].[SectorType] ([SectorTypeId]),
	CONSTRAINT [FK_LocalEducationAgency_IsCTE] FOREIGN KEY ([IsCTE]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsOutOfState] FOREIGN KEY ([IsOutOfState]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsAccommodationDistrict] FOREIGN KEY ([IsAccommodationDistrict]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsSecureCare] FOREIGN KEY ([IsSecureCare]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsExceptional] FOREIGN KEY ([IsExceptional]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsValidForDOR] FOREIGN KEY ([IsValidForDOR]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsHeadStart] FOREIGN KEY ([IsHeadStart]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsTransportation] FOREIGN KEY ([IsTransportation]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsElementaryNotInHighSchool] FOREIGN KEY ([IsElementaryNotInHighSchool]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_LocalEducationAgency_IsHighSchoolDistrict] FOREIGN KEY ([IsHighSchoolDistrict]) REFERENCES [config].[MultistateBitValue] ([Id])  
);

GO


