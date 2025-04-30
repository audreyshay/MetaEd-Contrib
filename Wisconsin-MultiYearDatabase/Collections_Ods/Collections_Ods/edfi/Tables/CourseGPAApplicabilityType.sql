CREATE TABLE [edfi].[CourseGPAApplicabilityType](
	[CourseGPAApplicabilityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CourseGPAApplicabilityType] PRIMARY KEY CLUSTERED 
(
	[CourseGPAApplicabilityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CourseGPAApplicabilityType] ADD  CONSTRAINT [CourseGPAApplicabilityType_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [edfi].[CourseGPAApplicabilityType] ADD  CONSTRAINT [CourseGPAApplicabilityType_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [edfi].[CourseGPAApplicabilityType] ADD  CONSTRAINT [CourseGPAApplicabilityType_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CourseGPAApplicability' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseGPAApplicabilityType', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicabilityTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for CourseGPAApplicability type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseGPAApplicabilityType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseGPAApplicabilityType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the course GPA applicability type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseGPAApplicabilityType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator of whether or not this course being described is included in the computation of the student''s Grade Point Average, and if so, if it is weighted differently than regular courses.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseGPAApplicabilityType'
GO
