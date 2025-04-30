CREATE TABLE [edfi].[ReasonExitedType] (
    [ReasonExitedTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [Description]        NVARCHAR (1024)  NOT NULL,
    [ShortDescription]   NVARCHAR (450)   NOT NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [ReasonExitedType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [ReasonExitedType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME         CONSTRAINT [ReasonExitedType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReasonExitedType] PRIMARY KEY CLUSTERED ([ReasonExitedTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ReasonExitedType_ShortDescription]
    ON [edfi].[ReasonExitedType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_ReasonExitedType]
    ON [edfi].[ReasonExitedType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reason the child left the program within a school or district.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ReasonExited', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedType', @level2type = N'COLUMN', @level2name = N'ReasonExitedTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for ReasonExited type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for ReasonExited type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReasonExitedType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

