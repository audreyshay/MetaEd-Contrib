CREATE TABLE [edfi].[AddressType] (
    [AddressTypeId]    INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [AddressType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [AddressType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [AddressType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED ([AddressTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The type of address listed for an individual or organization.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AddressType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Address', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'COLUMN', @level2name = N'AddressTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Address type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the address type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_AddressType_Id]
    ON [edfi].[AddressType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

