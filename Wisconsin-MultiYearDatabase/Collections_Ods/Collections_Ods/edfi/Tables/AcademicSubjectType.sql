CREATE TABLE [edfi].[AcademicSubjectType](
	[AcademicSubjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [AcademicSubjectType_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [AcademicSubjectType_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [AcademicSubjectType_DF_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_AcademicSubjectType] PRIMARY KEY CLUSTERED 
(
	[AcademicSubjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for AcademicSubject' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectType', @level2type=N'COLUMN',@level2name=N'AcademicSubjectTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for academic subject type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description for academic subject type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The teaching field(s) taught by an individual; for example: English/Language Arts, Reading, Mathematics, Science, Social Sciences, etc.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectType'
GO



