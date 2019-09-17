CREATE TABLE [entity].[SectorType] (
    [SectorTypeId] INT             NOT NULL,
    [CodeValue]    NVARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_SectorType] PRIMARY KEY CLUSTERED ([SectorTypeId] ASC)
);

