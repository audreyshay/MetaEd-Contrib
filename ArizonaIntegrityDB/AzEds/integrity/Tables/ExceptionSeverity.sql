CREATE TABLE [integrity].[ExceptionSeverity] (
    [ExceptionSeverityId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]         NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_ExceptionSeverity] PRIMARY KEY CLUSTERED ([ExceptionSeverityId] ASC)
);

