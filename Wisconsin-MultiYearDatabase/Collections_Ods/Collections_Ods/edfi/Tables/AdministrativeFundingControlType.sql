CREATE TABLE [edfi].[AdministrativeFundingControlType] (
    [AdministrativeFundingControlTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                          NVARCHAR (50)    NOT NULL,
    [ShortDescription]                   NVARCHAR (450)   NOT NULL,
    [Description]                        NVARCHAR (1024)  NULL,
    [Id]                                 UNIQUEIDENTIFIER CONSTRAINT [AdministrativeFundingControlType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                   DATETIME         CONSTRAINT [AdministrativeFundingControlType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                         DATETIME         CONSTRAINT [AdministrativeFundingControlType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AdministrativeFundingControlType] PRIMARY KEY CLUSTERED ([AdministrativeFundingControlTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AdministrativeFundingControlType_ShortDescription]
    ON [edfi].[AdministrativeFundingControlType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_AdministrativeFundingControlType]
    ON [edfi].[AdministrativeFundingControlType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the type of education institution as classified by its funding source.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdministrativeFundingControlType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for AdministrationFundingControl', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdministrativeFundingControlType', @level2type = N'COLUMN', @level2name = N'AdministrativeFundingControlTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for AdministrationFundingControl type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdministrativeFundingControlType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdministrativeFundingControlType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AdministrativeFundingControlType', @level2type = N'COLUMN', @level2name = N'Description';

