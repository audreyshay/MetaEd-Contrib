CREATE TABLE [extension].[ModifiedTermType](
    [ModifiedTermTypeId] [INT] IDENTITY(1,1) NOT NULL,
    [CodeValue] [NVARCHAR](50) NOT NULL,
    [Description] [NVARCHAR](1024) NOT NULL,
    [ShortDescription] [NVARCHAR](450) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL, 
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL, 
    CONSTRAINT [ModifiedTermType_PK] PRIMARY KEY CLUSTERED (
        [ModifiedTermTypeId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[ModifiedTermType] ADD CONSTRAINT [ModifiedTermType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[ModifiedTermType] ADD CONSTRAINT [ModifiedTermType_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[ModifiedTermType] ADD CONSTRAINT [ModifiedTermType_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modifed term tyeps for discipline endpoint', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ModifiedTermType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for ModifiedTerm', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'ModifiedTermType', @level2type=N'COLUMN', @level2name=N'ModifiedTermTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This column is deprecated.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'ModifiedTermType', @level2type=N'COLUMN', @level2name=N'CodeValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description for the ModifiedTerm type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'ModifiedTermType', @level2type=N'COLUMN', @level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value for the ModifiedTerm type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE',@level1name=N'ModifiedTermType', @level2type=N'COLUMN', @level2name=N'ShortDescription'
GO