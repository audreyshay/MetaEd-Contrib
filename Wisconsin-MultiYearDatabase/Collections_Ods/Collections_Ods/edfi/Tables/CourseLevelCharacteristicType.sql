CREATE TABLE [edfi].[CourseLevelCharacteristicType](
	[CourseLevelCharacteristicTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [CourseLevelCharacteristicType_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [CourseLevelCharacteristicType_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [CourseLevelCharacteristicType_DF_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_CourseLevelCharacteristicsType] PRIMARY KEY CLUSTERED 
(
	[CourseLevelCharacteristicTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for CourseLevelCharacteristics type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristicType', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for CourseLevelCharacteristics type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristicType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristicType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the course level characteristic type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristicType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The item for indication of the nature and difficulty of instruction: Remedial, Basic, Honors, Ap, IB, Dual Credit, CTE. etc.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristicType'
GO