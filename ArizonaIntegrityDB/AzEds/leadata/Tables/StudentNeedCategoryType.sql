CREATE TABLE [leadata].[StudentNeedCategoryType](
	[StudentNeedCategoryTypeId] [int] NOT NULL,
	[CodeValue] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_StudentNeedCategoryTypeId] PRIMARY KEY CLUSTERED ([StudentNeedCategoryTypeId] ASC) 
);
