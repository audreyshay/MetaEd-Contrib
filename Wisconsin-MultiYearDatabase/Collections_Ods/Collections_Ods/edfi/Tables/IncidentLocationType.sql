CREATE TABLE [edfi].[IncidentLocationType] (
    [IncidentLocationTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]              NVARCHAR (50)    NOT NULL,
    [Description]            NVARCHAR (1024)  NOT NULL,
    [ShortDescription]       NVARCHAR (450)   NOT NULL,
    [Id]                     UNIQUEIDENTIFIER CONSTRAINT [IncidentLocationType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]       DATETIME         CONSTRAINT [IncidentLocationType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]             DATETIME         CONSTRAINT [IncidentLocationType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IncidentLocationType] PRIMARY KEY CLUSTERED ([IncidentLocationTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies where the incident occurred and whether or not it occurred on school property.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'IncidentLocationType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for IncidentLocation', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'IncidentLocationType', @level2type = N'COLUMN', @level2name = N'IncidentLocationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for IncidentLocation type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'IncidentLocationType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'IncidentLocationType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the incident location type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'IncidentLocationType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_IncidentLocationType_Id]
    ON [edfi].[IncidentLocationType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

