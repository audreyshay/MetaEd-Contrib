CREATE TABLE [integrity].[ReportCategory] (
    [ReportCategoryId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_ReportCategory] PRIMARY KEY CLUSTERED ([ReportCategoryId] ASC)
);

