CREATE TABLE [leadata].[StudentNeedDescriptor](
	[StudentNeedDescriptorId] [int] NOT NULL,
	[StudentNeedCategoryTypeId] [int] NOT NULL,
 CONSTRAINT [PK_StudentNeedDescriptor] PRIMARY KEY CLUSTERED ([StudentNeedDescriptorId] ASC),
 CONSTRAINT [FK_StudentNeedDescriptor_StudentNeedCategoryType] FOREIGN KEY ([StudentNeedCategoryTypeId]) REFERENCES [leadata].[StudentNeedCategoryType] ([StudentNeedCategoryTypeId])
);