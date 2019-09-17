CREATE TABLE [process].[StatusType] (
    [StatusTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_StatusType] PRIMARY KEY CLUSTERED ([StatusTypeId] ASC)
);



