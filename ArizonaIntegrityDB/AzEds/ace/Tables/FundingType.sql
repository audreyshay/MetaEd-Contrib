CREATE TABLE [ace].[FundingType]
(
	[FundingTypeId] INT NOT NULL IDENTITY, 
    [Description] NVARCHAR(1024) NOT NULL, 
    [IsFundable] BIT NOT NULL,	
    CONSTRAINT [PK_FundingType] PRIMARY KEY CLUSTERED ([FundingTypeId] ASC)
)
