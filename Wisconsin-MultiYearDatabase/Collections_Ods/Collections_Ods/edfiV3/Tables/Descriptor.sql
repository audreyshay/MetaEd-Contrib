CREATE TABLE [edfiV3].[Descriptor] (
    [DescriptorId]       INT              IDENTITY (1, 1) NOT NULL,
    [Namespace]          NVARCHAR (255)   NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [ShortDescription]   NVARCHAR (75)    NOT NULL,
    [Description]        NVARCHAR (1024)  NULL,
    [PriorDescriptorId]  INT              NULL,
    [EffectiveBeginDate] DATE             NULL,
    [EffectiveEndDate]   DATE             NULL,
    [CreateDate]         DATETIME         CONSTRAINT [V3_Descriptor_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [V3_Descriptor_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [V3_Descriptor_DF_Id] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [V3_Descriptor_PK] PRIMARY KEY CLUSTERED ([DescriptorId] ASC),
    CONSTRAINT [V3_Descriptor_AK] UNIQUE NONCLUSTERED ([CodeValue] ASC, [Namespace] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [V3_UX_Descriptor_Id]
    ON [edfiV3].[Descriptor]([Id] ASC) WITH (FILLFACTOR = 75, PAD_INDEX = ON);
