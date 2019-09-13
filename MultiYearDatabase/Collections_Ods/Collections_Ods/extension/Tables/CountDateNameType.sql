CREATE TABLE [extension].[CountDateNameType] (
    [CountDateNameTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (50)    NOT NULL,
    [Description]         NVARCHAR (1024)  NOT NULL,
    [ShortDescription]    NVARCHAR (450)   NOT NULL,
    [Id]                  UNIQUEIDENTIFIER CONSTRAINT [CountDateNameType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]    DATETIME         CONSTRAINT [CountDateNameType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]          DATETIME         CONSTRAINT [CountDateNameType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CountDateNameType] PRIMARY KEY CLUSTERED ([CountDateNameTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The count date during the school year (e.g. 3rd Fri Sept).', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateNameType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateNameType', @level2type = N'COLUMN', @level2name = N'CountDateNameTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The code value of a count date', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateNameType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The description of a count date', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateNameType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The short description of a count date', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateNameType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

