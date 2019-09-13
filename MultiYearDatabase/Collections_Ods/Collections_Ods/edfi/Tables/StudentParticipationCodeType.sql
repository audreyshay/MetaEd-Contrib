CREATE TABLE [edfi].[StudentParticipationCodeType](
	[StudentParticipationCodeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	CONSTRAINT [PK_StudentParticipationCodeType] PRIMARY KEY CLUSTERED ( [StudentParticipationCodeTypeId] )
);

GO

ALTER TABLE [edfi].[StudentParticipationCodeType] ADD  CONSTRAINT [StudentParticipationCodeType_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [edfi].[StudentParticipationCodeType] ADD  CONSTRAINT [StudentParticipationCodeType_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [edfi].[StudentParticipationCodeType] ADD  CONSTRAINT [StudentParticipationCodeType_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for StudentParticipationCode' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentParticipationCodeType', @level2type=N'COLUMN',@level2name=N'StudentParticipationCodeTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for StudentParticipationCode type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentParticipationCodeType', @level2type=N'COLUMN',@level2name=N'CodeValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the descriptor.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentParticipationCodeType', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A shortened description for the student participation code type.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentParticipationCodeType', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The role or type of participation of a student in a discipline incident; for example: Victim, Perpetrator, Witness, Reporter.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StudentParticipationCodeType'
GO


