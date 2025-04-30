CREATE TABLE [edfi].[CareerPathwayType](
	[CareerPathwayTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CareerPathwayType] PRIMARY KEY CLUSTERED 
(
	[CareerPathwayTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CareerPathwayType] ADD  CONSTRAINT [CareerPathwayType_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [edfi].[CareerPathwayType] ADD  CONSTRAINT [CareerPathwayType_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [edfi].[CareerPathwayType] ADD  CONSTRAINT [CareerPathwayType_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CareerPathway' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CareerPathwayType', @level2type=N'COLUMN',@level2name=N'CareerPathwayTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for CareerPathway type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CareerPathwayType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CareerPathwayType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the career pathway type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CareerPathwayType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The career cluster or pathway representing the career path of the Vocational/Career Tech concentrator.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CareerPathwayType'
GO

