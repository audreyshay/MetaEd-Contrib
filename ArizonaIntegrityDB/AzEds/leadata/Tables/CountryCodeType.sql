CREATE TABLE [leadata].[CountryCodeType] (
    [CountryCodeTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (50)   NOT NULL,
    [Description]       NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_CountryCodeType] PRIMARY KEY CLUSTERED ([CountryCodeTypeId] ASC)
);

