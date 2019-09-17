CREATE TABLE [process].[BusinessGroup] (
    [BusinessGroupId]   INT             IDENTITY (1, 1) NOT NULL,
    [BusinessGroupName] NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_BusinessGroup] PRIMARY KEY CLUSTERED ([BusinessGroupId] ASC)
);

