CREATE TABLE [leadata].[StaffIdentificationSystemType] (
    [StaffIdentificationSystemTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)   NOT NULL,
    [Description]                     NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_StaffIdentificationSystemType] PRIMARY KEY CLUSTERED ([StaffIdentificationSystemTypeId] ASC)
);

