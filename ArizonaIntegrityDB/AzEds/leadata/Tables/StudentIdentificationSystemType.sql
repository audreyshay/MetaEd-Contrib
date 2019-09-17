CREATE TABLE [leadata].[StudentIdentificationSystemType] (
    [StudentIdentificationSystemTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                         NVARCHAR (50)   NOT NULL,
    [Description]                       NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_StudentIdentificationSystemType] PRIMARY KEY CLUSTERED ([StudentIdentificationSystemTypeId] ASC)
);

