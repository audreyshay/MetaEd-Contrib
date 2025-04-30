CREATE TABLE [edfi].[VisaType] (
    [VisaTypeId]       INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [VisaType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [VisaType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [VisaType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_VisaType] PRIMARY KEY CLUSTERED ([VisaTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indicator of a non-U.S. citizen''s Visa type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'VisaType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'VisaType', @level2type = N'COLUMN', @level2name = N'VisaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'VisaType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'VisaType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'VisaType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

