
CREATE TABLE [915].[FileContent](
	[FileContentId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileDetailId] [bigint] NOT NULL,
	[Content] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_FileContent] PRIMARY KEY CLUSTERED 
(
	[FileContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [915].[FileContent]  WITH CHECK ADD  CONSTRAINT [FK_FileContent_WhiteFileDetail] FOREIGN KEY([FileDetailId])
REFERENCES [915].[FileDetail] ([FileDetailId])
GO

ALTER TABLE [915].[FileContent] CHECK CONSTRAINT [FK_FileContent_WhiteFileDetail]
GO


