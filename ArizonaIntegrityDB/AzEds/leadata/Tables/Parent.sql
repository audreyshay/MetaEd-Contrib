CREATE TABLE [leadata].[Parent]
(
	[ParentUSI] [int] IDENTITY(1,1) NOT NULL,
	[ParentUniqueId] [nvarchar](32) NOT NULL,
	[PersonalTitlePrefix] [nvarchar](75) NULL,
	[FirstName] [nvarchar](75) NOT NULL,
	[MiddleName] [nvarchar](75) NULL,
	[LastSurname] [nvarchar](75) NOT NULL,
	[GenerationCodeSuffix] [nvarchar](75) NULL,
	[MaidenName] [nvarchar](75) NULL,
	[SexTypeId] [int] NULL,
	[LoginId] [nvarchar](60) NULL,
	[EmploymentStatus] [bit] NULL, 
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [Parent_DF_HashValue] DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED ([ParentUSI] ASC)
) 
GO

ALTER TABLE [leadata].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_Parent_SexType_SexTypeId] FOREIGN KEY([SexTypeId])
REFERENCES [leadata].[SexType] ([SexTypeId])
GO

ALTER TABLE [leadata].[Parent] CHECK CONSTRAINT [FK_Parent_SexType_SexTypeId]
GO