CREATE TABLE [leadata].[LanguageUseType]
(
	[LanguageUseTypeId] [int] NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
    CONSTRAINT [PK_LanguageUseType] PRIMARY KEY CLUSTERED ([LanguageUseTypeId] ASC )
) 