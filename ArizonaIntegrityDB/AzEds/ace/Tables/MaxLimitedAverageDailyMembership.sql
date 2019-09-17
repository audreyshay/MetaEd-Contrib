CREATE TABLE [ace].[MaxLimitedAverageDailyMembership]
(
	[MaxLimitedAverageDailyMembershipId]	INT				IDENTITY (1, 1) NOT NULL,
	[SchoolTypeId]			INT				NOT NULL,
	[MaxLimitedAverageDailyMembership]		DECIMAL(10,4)	NOT NULL,
	[IsCTECentral]			SMALLINT		CONSTRAINT [DF_MaxLimitedAverageDailyMembership_IsCTECentral] DEFAULT ((-1)) NOT NULL,
	[IsConcurrent]			SMALLINT		CONSTRAINT [DF_MaxLimitedAverageDailyMembership_IsConcurrent] DEFAULT ((-1)) NOT NULL,
	[FiscalYear]			INT				NOT NULL,
	[GcdLevel]				INT				NULL
    CONSTRAINT [PK_MaxLimitedAverageDailyMembership] PRIMARY KEY CLUSTERED ([MaxLimitedAverageDailyMembershipId] ASC),
	CONSTRAINT [FK_MaxLimitedAverageDailyMembership_SchoolType] FOREIGN KEY ([SchoolTypeId]) REFERENCES [entity].[SchoolType] ([SchoolTypeId]),
	CONSTRAINT [FK_MaxLimitedAverageDailyMembership_IsCTECentral] FOREIGN KEY ([IsCTECentral]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [FK_MaxLimitedAverageDailyMembership_IsConcurrent] FOREIGN KEY ([IsConcurrent]) REFERENCES [config].[MultistateBitValue] ([Id]),
	CONSTRAINT [chk_MaxLimitedAverageDailyMembership_IsCTECentral] CHECK ((([IsCTECentral] = 0 OR [IsCTECentral] = 1) AND SchoolTypeID = 4) OR ([IsCTECentral] = -1 AND SchoolTypeID <> 4))      
)
