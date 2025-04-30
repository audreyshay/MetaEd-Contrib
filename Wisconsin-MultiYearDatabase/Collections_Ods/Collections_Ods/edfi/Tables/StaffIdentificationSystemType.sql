CREATE TABLE [edfi].[StaffIdentificationSystemType](
	[StaffIdentificationSystemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [StaffIdentificationSystemType_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [StaffIdentificationSystemType_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [StaffIdentificationSystemType_DF_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_StaffIdentificationSystemType] PRIMARY KEY CLUSTERED 
(
	[StaffIdentificationSystemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for StaffIdentificationSystem' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemType', @level2type=N'COLUMN',@level2name=N'StaffIdentificationSystemTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for StaffIdentificationSystem type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the staff identification system type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A coding scheme that is used for identification and record-keeping purposes by schools, social services or other agencies to refer to a staff member.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemType'
GO


