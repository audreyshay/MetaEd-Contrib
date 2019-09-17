
CREATE TYPE [915].[WhitelistDetailTableType] AS TABLE(
	[RequestId] [int] NOT NULL,
	[FileDetailId] [int] NOT NULL,
	[StudentUniqueId] [nvarchar](32) NULL,
	[SchoolId] [int] NOT NULL,
	[PropertyLocator] [nvarchar](200) NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ResourceTypeId] [int] NOT NULL
)
GO


