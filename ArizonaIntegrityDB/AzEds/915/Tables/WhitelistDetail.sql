

CREATE TABLE [915].[WhitelistDetail](
	[RequestId] [bigint] NOT NULL,
	[WhitelistDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileDetailId] [bigint] NOT NULL,
	[StudentUniqueId] [nvarchar](32) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[PropertyLocator] [nvarchar](200) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NOT NULL,
	[ResourceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_WhitelistDetail] PRIMARY KEY CLUSTERED 
(
	[WhitelistDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [915].[WhitelistDetail]  WITH CHECK ADD  CONSTRAINT [FK_WhitelistDetail_ResourceType] FOREIGN KEY([ResourceTypeId])
REFERENCES [config].[ResourceType] ([ResourceTypeId])
GO

ALTER TABLE [915].[WhitelistDetail] CHECK CONSTRAINT [FK_WhitelistDetail_ResourceType]
GO


