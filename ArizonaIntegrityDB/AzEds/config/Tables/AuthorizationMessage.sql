CREATE TABLE [config].[AuthorizationMessage]
(
	[AuthorizationMessageId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorizationMessageCodeValue] [nvarchar](50) NOT NULL,
	[AuthorizationMessage] [nvarchar](500) NOT NULL, 
    CONSTRAINT [PK_AuthorizationMessage] PRIMARY KEY ([AuthorizationMessageId]),
)