CREATE TABLE [entity].[CharterStatusType](
	[CharterStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ShortDescription] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [CharterStatusType_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [CharterStatusType_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [CharterStatusType_DF_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_CharterStatusType] PRIMARY KEY CLUSTERED (	[CharterStatusTypeId] ASC)
 ); 