CREATE TABLE [edfi].[DisabilityDeterminationSourceType]
(
	[DisabilityDeterminationSourceTypeId] INT IDENTITY(1,1) NOT NULL, 
    [CodeValue] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(1024) NOT NULL, 
    [ShortDescription] NVARCHAR(450) NOT NULL, 
    [Id] UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL, 
    [LastModifiedDate] DATETIME DEFAULT (getdate()) NOT NULL, 
    [CreateDate] DATETIME DEFAULT (getdate()) NOT NULL,
	CONSTRAINT [PK_DisabilityDeterminiationSourceType] PRIMARY KEY CLUSTERED ([DisabilityDeterminationSourceTypeId] ASC),
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Disability Determination Source Type' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'DisabilityDeterminationSourceType', @level2type=N'COLUMN',@level2name=N'DisabilityDeterminationSourceTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code of the Disability Determination Source Type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'DisabilityDeterminationSourceType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the Disability Determination Source Type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'DisabilityDeterminationSourceType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short description of the Disability Determination Source Type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'DisabilityDeterminationSourceType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source that provided the disability determination.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'DisabilityDeterminationSourceType'
GO