
CREATE TABLE [915].[FileDetail](
	[FileDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[FileSizeBytes] [int] NOT NULL,
	[CreatedDtm] [datetime] NOT NULL,
	[CreatedBy] [nchar](100) NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[FiletypeId] [int] NOT NULL,
 CONSTRAINT [PK_WhiteFileDetail] PRIMARY KEY CLUSTERED 
(
	[FileDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [915].[FileDetail]  WITH CHECK ADD  CONSTRAINT [FK_FileDetail_915Filetype] FOREIGN KEY([FiletypeId])
REFERENCES [config].[Filetype915] ([Filetype915Id])
GO

ALTER TABLE [915].[FileDetail] CHECK CONSTRAINT [FK_FileDetail_915Filetype]
GO

ALTER TABLE [915].[FileDetail]  WITH CHECK ADD  CONSTRAINT [FK_WhiteFileDetail_Request1] FOREIGN KEY([RequestId])
REFERENCES [915].[Request] ([RequestId])
GO

ALTER TABLE [915].[FileDetail] CHECK CONSTRAINT [FK_WhiteFileDetail_Request1]
GO


