CREATE TABLE [config].[AOIRequiredMinutes]
(
	[AOIRequiredMinutesId]			INT IDENTITY(1,1) NOT NULL,
	[FiscalYear]					INT NOT NULL,
	[GradeLevelTypeId]				INT NOT NULL,
	[AnnualRequiredHours]			Decimal(10,4) NOT NULL,
	[AnnualRequiredMinutes]			Decimal(10,4) NOT NULL,
	[AverageDailyRequiredMinutes]	Decimal(10,4) NOT NULL,	
    [CreateDate]			        DATETIME CONSTRAINT [DF_AOIRequiredMinutes_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AOIRequiredMinutes] PRIMARY KEY CLUSTERED ([AOIRequiredMinutesId] ASC),
    CONSTRAINT [FK_AOIRequiredMinutes_GradeLevelType] FOREIGN KEY ([GradeLevelTypeId]) REFERENCES [entity].[GradeLevelType] ([GradeLevelTypeId])
)
