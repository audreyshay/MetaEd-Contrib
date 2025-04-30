CREATE TABLE [edfi].[BehaviorType] (
    [BehaviorTypeId]   INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [BehaviorType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [BehaviorType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [BehaviorType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[PriorityOrder] [int] NULL,
	[FirearmRelated] [bit] NULL,
    CONSTRAINT [PK_BehaviorType] PRIMARY KEY CLUSTERED ([BehaviorTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enumeration items defining the categories of behavior coded for use in describing an incident.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for BehaviorCategoryType.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorType', @level2type = N'COLUMN', @level2name = N'BehaviorTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for BehaviorCategoryType.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for BehaviorCategory type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'BehaviorType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_BehaviorType_Id]
    ON [edfi].[BehaviorType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

