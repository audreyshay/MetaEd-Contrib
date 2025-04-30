CREATE TABLE [edfi].[RaceType] (
    [RaceTypeId]       INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [RaceType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [RaceType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [RaceType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RaceType] PRIMARY KEY CLUSTERED ([RaceTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_RaceType_ShortDescription]
    ON [edfi].[RaceType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_RaceType]
    ON [edfi].[RaceType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The general racial category which most clearly reflects the individual''s recognition of his or her community or with which the individual most identifies.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RaceType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Race', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RaceType', @level2type = N'COLUMN', @level2name = N'RaceTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Race type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RaceType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'RaceType', @level2type = N'COLUMN', @level2name = N'Description';

