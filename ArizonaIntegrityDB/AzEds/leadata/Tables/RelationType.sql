CREATE TABLE [leadata].[RelationType]
 (
	[RelationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
    CONSTRAINT [PK_RelationType] PRIMARY KEY CLUSTERED ([RelationTypeId] ASC)
 )
