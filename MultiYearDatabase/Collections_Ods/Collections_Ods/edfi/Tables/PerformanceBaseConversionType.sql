CREATE TABLE [edfi].[PerformanceBaseConversionType] (
    [PerformanceBaseConversionTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)    NOT NULL,
    [Description]                     NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                NVARCHAR (450)   NOT NULL,
    [Id]                              UNIQUEIDENTIFIER CONSTRAINT [PerformanceBaseConversionType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                DATETIME         CONSTRAINT [PerformanceBaseConversionType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                      DATETIME         CONSTRAINT [PerformanceBaseConversionType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PerformanceBaseType] PRIMARY KEY CLUSTERED ([PerformanceBaseConversionTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Defines standard levels of competency or performance that can be used for dashboard visualizations: advanced, proficient, basic, and below basic.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PerformanceBaseConversionType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for PerformanceBase', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PerformanceBaseConversionType', @level2type = N'COLUMN', @level2name = N'PerformanceBaseConversionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for PerformanceBase type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PerformanceBaseConversionType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for PerformanceBase type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PerformanceBaseConversionType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'PerformanceBaseConversionType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_PerformanceBaseConversionType_Id]
    ON [edfi].[PerformanceBaseConversionType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

