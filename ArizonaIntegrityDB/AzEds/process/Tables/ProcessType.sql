CREATE TABLE [process].[ProcessType] (
    [ProcessTypeId]   INT             IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (1024) NOT NULL,
    [DisplayCategory] VARCHAR (100)   NULL,
    [ProcessTypeJobName] NVARCHAR(250) NULL, 
    CONSTRAINT [PK_ProcessType] PRIMARY KEY CLUSTERED ([ProcessTypeId] ASC)
);





