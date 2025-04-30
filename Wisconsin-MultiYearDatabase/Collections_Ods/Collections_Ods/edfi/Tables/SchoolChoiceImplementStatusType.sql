CREATE TABLE [edfi].[SchoolChoiceImplementStatusType] (
    [SchoolChoiceImplementStatusTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                         NVARCHAR (50)    NOT NULL,
    [Description]                       NVARCHAR (1024)  NULL,
    [ShortDescription]                  NVARCHAR (450)   NOT NULL,
    [Id]                                UNIQUEIDENTIFIER CONSTRAINT [SchoolChoiceImplementStatusType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                  DATETIME         CONSTRAINT [SchoolChoiceImplementStatusType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                        DATETIME         CONSTRAINT [SchoolChoiceImplementStatusType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SchoolChoiceImplementStatusType] PRIMARY KEY CLUSTERED ([SchoolChoiceImplementStatusTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SchoolChoiceImplementStatusType_ShortDescription]
    ON [edfi].[SchoolChoiceImplementStatusType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_SchoolChoiceImplementStatusType]
    ON [edfi].[SchoolChoiceImplementStatusType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of whether the LEA was able to implement the provisions for public school choice under Title I, Part A, Section 1116 of ESEA, as amended.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolChoiceImplementStatusType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolChoiceImplementStatusType', @level2type = N'COLUMN', @level2name = N'SchoolChoiceImplementStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolChoiceImplementStatusType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolChoiceImplementStatusType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'SchoolChoiceImplementStatusType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

