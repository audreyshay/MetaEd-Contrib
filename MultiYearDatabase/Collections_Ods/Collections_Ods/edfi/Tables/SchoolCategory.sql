CREATE TABLE [edfi].[SchoolCategory] (
    [SchoolId]             INT      NOT NULL,
    [SchoolCategoryTypeId] INT      NOT NULL,
    [CreateDate]           DATETIME CONSTRAINT [SchoolCategory_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
    CONSTRAINT [PK_SchoolCategory] PRIMARY KEY CLUSTERED 
		([SchoolYear],[SchoolId], [SchoolCategoryTypeId]),
    CONSTRAINT [FK_SchoolCategory_School_SchoolId] 
		FOREIGN KEY ([SchoolYear],[SchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId]) 
		ON DELETE CASCADE,
    CONSTRAINT [FK_SchoolCategory_SchoolCategoryType_SchoolCategoryTypeId] 
		FOREIGN KEY ([SchoolCategoryTypeId]) 
		REFERENCES [edfi].[SchoolCategoryType] ([SchoolCategoryTypeId])
);





