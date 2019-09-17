CREATE TABLE [process].[ProcessSubType] (
    [ProcessSubTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [ProcessTypeId]    INT             NOT NULL,
    [Description]      NVARCHAR (1024) NOT NULL,
    [BusinessGroupId]  INT             NOT NULL,
    CONSTRAINT [PK_ProcessSubType] PRIMARY KEY CLUSTERED ([ProcessSubTypeId] ASC),
    CONSTRAINT [FK_ProcessSubType_BusinessGroup] FOREIGN KEY ([BusinessGroupId]) REFERENCES [process].[BusinessGroup] ([BusinessGroupId]),
    CONSTRAINT [FK_ProcessSubType_ProcessType] FOREIGN KEY ([ProcessTypeId]) REFERENCES [process].[ProcessType] ([ProcessTypeId])
);




GO


