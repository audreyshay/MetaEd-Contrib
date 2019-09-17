CREATE TABLE [xref].[RepeatIdentifierDescriptorType]
(
	[RepeatIdentifierTypeId] int not null, 
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	CONSTRAINT [PK_RepeatIdentifierDescriptorType] PRIMARY KEY CLUSTERED ([RepeatIdentifierTypeId] ASC, [CodeValue] ASC)
);
