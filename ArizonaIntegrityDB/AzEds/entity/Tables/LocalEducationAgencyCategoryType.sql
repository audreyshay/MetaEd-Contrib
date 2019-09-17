CREATE TABLE [entity].[LocalEducationAgencyCategoryType] (
    [LocalEducationAgencyCategoryTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                          NVARCHAR (50)   NOT NULL,
    [Description]                        NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_LEACategoryType] PRIMARY KEY CLUSTERED ([LocalEducationAgencyCategoryTypeId] ASC)
);

