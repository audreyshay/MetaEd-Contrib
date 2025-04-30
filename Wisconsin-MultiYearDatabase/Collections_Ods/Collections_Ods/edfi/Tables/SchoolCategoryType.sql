CREATE TABLE [edfi].[SchoolCategoryType] (
    [SchoolCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (50)    NOT NULL,
    [Description]          NVARCHAR (1024)  NOT NULL,
    [ShortDescription]     NVARCHAR (450)   NOT NULL,
    [Id]                   UNIQUEIDENTIFIER CONSTRAINT [SchoolCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]     DATETIME         CONSTRAINT [SchoolCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]           DATETIME         CONSTRAINT [SchoolCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SchoolCategoryType] PRIMARY KEY CLUSTERED ([SchoolCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SchoolCategoryType_ShortDescription]
    ON [edfi].[SchoolCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_SchoolCategoryType]
    ON [edfi].[SchoolCategoryType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of school (e.g., High School, Middle School or Elementary School).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolCategoryType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for SchoolCategory', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolCategoryType', @level2type = N'COLUMN', @level2name = N'SchoolCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for SchoolCategory type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolCategoryType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolCategoryType', @level2type = N'COLUMN', @level2name = N'Description';

