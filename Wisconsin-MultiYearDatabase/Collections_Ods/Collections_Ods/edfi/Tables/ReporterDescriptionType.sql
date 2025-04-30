CREATE TABLE [edfi].[ReporterDescriptionType] (
    [ReporterDescriptionTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                 NVARCHAR (50)    NOT NULL,
    [Description]               NVARCHAR (1024)  NOT NULL,
    [ShortDescription]          NVARCHAR (450)   NOT NULL,
    [Id]                        UNIQUEIDENTIFIER CONSTRAINT [ReporterDescriptionType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]          DATETIME         CONSTRAINT [ReporterDescriptionType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                DATETIME         CONSTRAINT [ReporterDescriptionType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReporterDescriptionType] PRIMARY KEY CLUSTERED ([ReporterDescriptionTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information on the type of individual who reported the incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ReporterDescription', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionType', @level2type = N'COLUMN', @level2name = N'ReporterDescriptionTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for ReporterDescription type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the reporter description type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ReporterDescriptionType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ReporterDescriptionType_Id]
    ON [edfi].[ReporterDescriptionType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

