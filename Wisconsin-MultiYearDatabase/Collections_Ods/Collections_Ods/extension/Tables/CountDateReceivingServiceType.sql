CREATE TABLE [extension].[CountDateReceivingServiceType] (
    [CountDateReceivingServiceTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)    NOT NULL,
    [Description]                     NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                NVARCHAR (450)   NOT NULL,
    [Id]                              UNIQUEIDENTIFIER CONSTRAINT [CountDateReceivingServiceType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                DATETIME         CONSTRAINT [CountDateReceivingServiceType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                      DATETIME         CONSTRAINT [CountDateReceivingServiceType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CountDateReceivingServiceType] PRIMARY KEY CLUSTERED ([CountDateReceivingServiceTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The status of the student during the specific count date (e.g. Present).', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateReceivingServiceType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateReceivingServiceType', @level2type = N'COLUMN', @level2name = N'CountDateReceivingServiceTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code value of a student''s count date status', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateReceivingServiceType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of a student''s count date status', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateReceivingServiceType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The short description of a student''s count date status', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CountDateReceivingServiceType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

