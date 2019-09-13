CREATE TABLE [edfi].[CitizenshipStatusType] (
    [CitizenshipStatusTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (50)    NOT NULL,
    [Description]             NVARCHAR (1024)  NULL,
    [ShortDescription]        NVARCHAR (450)   NOT NULL,
    [Id]                      UNIQUEIDENTIFIER CONSTRAINT [CitizenshipStatusType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]        DATETIME         CONSTRAINT [CitizenshipStatusType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]              DATETIME         CONSTRAINT [CitizenshipStatusType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CitizenshipStatusType] PRIMARY KEY CLUSTERED ([CitizenshipStatusTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CitizenshipStatusType_ShortDescription]
    ON [edfi].[CitizenshipStatusType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_CitizenshipStatusType]
    ON [edfi].[CitizenshipStatusType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indicator of whether or not the person is a U.S. citizen.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CitizenshipStatusType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CitizenshipStatusType', @level2type = N'COLUMN', @level2name = N'CitizenshipStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CitizenshipStatusType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CitizenshipStatusType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CitizenshipStatusType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

