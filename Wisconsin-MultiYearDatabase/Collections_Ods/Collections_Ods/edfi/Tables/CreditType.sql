CREATE TABLE [edfi].[CreditType] (
    [CreditTypeId]     INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [CreditType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [CreditType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [CreditType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CreditType] PRIMARY KEY CLUSTERED ([CreditTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CreditType_ShortDescription]
    ON [edfi].[CreditType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_CreditType]
    ON [edfi].[CreditType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of credits or units of value awarded for the completion of a course.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CreditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CreditType', @level2type = N'COLUMN', @level2name = N'CreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Credit type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CreditType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CreditType', @level2type = N'COLUMN', @level2name = N'Description';

