CREATE TABLE [extension].[CteProgramAreaType]
(
	[CteProgramAreaTypeId] [INT] IDENTITY(1,1) NOT NULL,
    [CodeValue] [NVARCHAR](50) NOT NULL,
    [Description] [NVARCHAR](1024) NOT NULL,
    [ShortDescription] [NVARCHAR](450) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL, 
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL, 
	CONSTRAINT [CteProgramAreaType_PK] PRIMARY KEY CLUSTERED (
        [CteProgramAreaTypeId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Wisconsin CTE program areas.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CteProgramAreaType'
GO
