CREATE TABLE [entity].[School] (
    [SchoolId]               INT NOT NULL,
    [FiscalYear]             INT NOT NULL,
    [LocalEducationAgencyId] INT NULL,
    [SchoolTypeId]           INT NULL,
    [SectorTypeId]           INT NOT NULL,
	[IsOutOfState]          SMALLINT CONSTRAINT [DF_School_IsOutOfState] DEFAULT ((-1)) NOT NULL,
    [IsVirtual]             SMALLINT CONSTRAINT [DF_School_IsVirtual] DEFAULT ((-1)) NOT NULL,
    [IsSecureCare]          SMALLINT CONSTRAINT [DF_School_IsSecureCare] DEFAULT ((-1)) NOT NULL,
    [IsJuvenile]            SMALLINT CONSTRAINT [DF_School_IsJuvenile] DEFAULT ((-1)) NOT NULL,
    [IsHeadStart]           SMALLINT CONSTRAINT [DF_School_IsHeadStart] DEFAULT ((-1)) NOT NULL,
    [IsExceptional]         SMALLINT CONSTRAINT [DF_School_IsExceptional] DEFAULT ((-1)) NOT NULL,
    [IsAlternative]         SMALLINT CONSTRAINT [DF_School_IsAlternative] DEFAULT ((-1)) NOT NULL,
	[IsResidentialCenter]   SMALLINT CONSTRAINT [DF_School_IsResidentialCenter] DEFAULT ((-1)) NOT NULL,
	[IsCTECentral]			SMALLINT CONSTRAINT [DF_School_IsCTECentral] DEFAULT ((-1)) NOT NULL,
	[IsPrivateDaySchool]	SMALLINT CONSTRAINT [DF_School_IsPrivateDaySchool]  DEFAULT ((-1)) NOT NULL
    CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED ([SchoolId] ASC, [FiscalYear] ASC),
    CONSTRAINT [FK_School_EducationOrganization_SchoolId] FOREIGN KEY ([SchoolId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]) ON DELETE CASCADE,
    CONSTRAINT [FK_School_LocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY ([LocalEducationAgencyId], [FiscalYear]) REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId], [FiscalYear]),
    CONSTRAINT [FK_School_SchoolType] FOREIGN KEY ([SchoolTypeId]) REFERENCES [entity].[SchoolType] ([SchoolTypeId]),
    CONSTRAINT [FK_School_SectorType] FOREIGN KEY ([SectorTypeId]) REFERENCES [entity].[SectorType] ([SectorTypeId]),
	CONSTRAINT [chk_School_IsCTECentral] CHECK ((([IsCTECentral] = 0 OR [IsCTECentral] = 1) AND SchoolTypeID = 4) OR ([IsCTECentral] = -1 AND SchoolTypeID <> 4)),
	CONSTRAINT [FK_School_IsCTECentral] FOREIGN KEY ([IsCTECentral]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsOutOfState] FOREIGN KEY ([IsOutOfState]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsVirtual] FOREIGN KEY ([IsVirtual]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsSecureCare] FOREIGN KEY ([IsSecureCare]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsJuvenile] FOREIGN KEY ([IsJuvenile]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsExceptional] FOREIGN KEY ([IsExceptional]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsAlternative] FOREIGN KEY ([IsAlternative]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsHeadStart] FOREIGN KEY ([IsHeadStart]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsResidentialCenter] FOREIGN KEY ([IsResidentialCenter]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_School_IsPrivateDaySchool] FOREIGN KEY ([IsPrivateDaySchool]) REFERENCES [config].[MultistateBitValue] ([Id])   
);

GO



CREATE NONCLUSTERED INDEX [IX_School_FY_LEAid]
ON [entity].[School] ([FiscalYear],[LocalEducationAgencyId])

