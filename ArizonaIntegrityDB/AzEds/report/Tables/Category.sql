CREATE TABLE [report].[Category]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CategoryId] NVARCHAR(50) NULL, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(250) NOT NULL
)