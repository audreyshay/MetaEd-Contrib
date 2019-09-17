CREATE TABLE [config].[SaisMergeFiscalYearMap](
	[Id] [int] identity(1,1)  NOT NULL,
	[query] varchar(max) NOT NULL,	
	[IsActive] [bit] NOT NULL,
	Createddate datetime NOT NULL DEFAULT getdate()
 CONSTRAINT [SaisMergeFiscalYearMap_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
