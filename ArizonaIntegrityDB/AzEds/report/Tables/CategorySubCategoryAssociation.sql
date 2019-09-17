CREATE TABLE [report].[CategorySubCategoryAssociation]
(
	[CategoryId] INT NOT NULL , 
    [SubCategoryId] INT NOT NULL, 
    PRIMARY KEY ([CategoryId], [SubCategoryId]), 
    CONSTRAINT [FK_CategorySubCategoryAssociation_Category] FOREIGN KEY ([CategoryId]) REFERENCES [report].[Category]([Id]),
	CONSTRAINT [FK_CategorySubCategoryAssociation_SubCategory] FOREIGN KEY ([SubCategoryId]) REFERENCES [report].[SubCategory]([Id])
)