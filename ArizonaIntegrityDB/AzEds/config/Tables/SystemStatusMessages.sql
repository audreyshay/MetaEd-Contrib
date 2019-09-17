CREATE TABLE [config].[SystemStatusMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[MessageText] [nvarchar](MAX) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[SeverityLevelTypeId] [int] NOT NULL,
	[CreateDate] [DateTime] NOT NULL DEFAULT GETDATE(),
 CONSTRAINT [PK_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [config].[SystemStatusMessages]  WITH CHECK ADD FOREIGN KEY([SeverityLevelTypeId])
REFERENCES [config].[SystemStatusMessagesSeverityLevel] ([SeverityLevelTypeId])
GO
