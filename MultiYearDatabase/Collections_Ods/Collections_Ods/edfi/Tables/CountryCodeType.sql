CREATE TABLE [edfi].[CountryCodeType] (
    [CountryCodeTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (50)    NOT NULL,
    [Description]       NVARCHAR (1024)  NOT NULL,
    [ShortDescription]  NVARCHAR (450)   NOT NULL,
    [Id]                UNIQUEIDENTIFIER CONSTRAINT [CountryCodeType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]  DATETIME         CONSTRAINT [CountryCodeType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]        DATETIME         CONSTRAINT [CountryCodeType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CountryCodeType] PRIMARY KEY CLUSTERED ([CountryCodeTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CountryCodeType_ShortDescription]
    ON [edfi].[CountryCodeType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_CountryCodeType]
    ON [edfi].[CountryCodeType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The names of countries. (Note: A list of countries and codes is currently maintained and updated by the ISO as ISO 3166 on its website: http://www.iso.org/iso/country_codes.htm).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CountryCodeType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for CountryCode', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CountryCodeType', @level2type = N'COLUMN', @level2name = N'CountryCodeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for CountryCode type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CountryCodeType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CountryCodeType', @level2type = N'COLUMN', @level2name = N'Description';

