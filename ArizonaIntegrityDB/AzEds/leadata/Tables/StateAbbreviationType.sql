CREATE TABLE [leadata].[StateAbbreviationType] (
    [StateAbbreviationTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (50)   NOT NULL,
    [Description]             NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_StateAbbreviationType] PRIMARY KEY CLUSTERED ([StateAbbreviationTypeId] ASC)
);

