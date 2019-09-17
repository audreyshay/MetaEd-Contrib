CREATE TABLE [entity].[SchoolType] (
    [SchoolTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]    NVARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_SchoolType] PRIMARY KEY CLUSTERED ([SchoolTypeId] ASC)
);

