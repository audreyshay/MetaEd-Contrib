CREATE TABLE [ace].[LimitingLevelType]
(
	[LimitingLevelTypeId]  INT IDENTITY (1, 1) NOT NULL,
    [LimitingLevelType]						NVARCHAR(50)    NOT NULL,
    CONSTRAINT [PK_LimitingLevelType] PRIMARY KEY CLUSTERED ([LimitingLevelTypeId] ASC)
)
