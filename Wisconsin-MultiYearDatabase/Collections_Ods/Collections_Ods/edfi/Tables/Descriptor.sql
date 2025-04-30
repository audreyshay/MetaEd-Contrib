CREATE TABLE [edfi].[Descriptor] (
    [DescriptorId]       INT              IDENTITY (1, 1) NOT NULL,
    [Namespace]          NVARCHAR (255)   NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [ShortDescription]   NVARCHAR (75)    NOT NULL,
    [Description]        NVARCHAR (1024)  NULL,
    [PriorDescriptorId]  INT              NULL,
    [EffectiveBeginDate] DATE             NULL,
    [EffectiveEndDate]   DATE             NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [Descriptor_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [Descriptor_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME         CONSTRAINT [Descriptor_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Descriptor] PRIMARY KEY CLUSTERED ([DescriptorId] ASC),
    --CONSTRAINT [AK_Descriptor] UNIQUE NONCLUSTERED ([Namespace] ASC, [CodeValue] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_Descriptor]
    ON [edfi].[Descriptor]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the base entity for the descriptor pattern.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'DescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A globally unique namespace that identifies this descriptor set. Author is strongly encouraged to use the Universal Resource Identifier (http, ftp, file, etc.) for the source of the descriptor definition. Best practice is for this source to be the descriptor file itself, so that it can be machine-readable and be fetched in real-time, if necessary.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'Namespace';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'PriorDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The beginning date of the period when the descriptor is in effect. If omitted, the default is immediate effectiveness.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'EffectiveBeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The end date of the period when the descriptor is in effect.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'Descriptor', @level2type = N'COLUMN', @level2name = N'EffectiveEndDate';

