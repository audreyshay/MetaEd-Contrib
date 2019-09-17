CREATE TABLE [leadata].[RecordOwnershipType] (
    [RecordOwnershipTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]                 NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_RecordOwnershipType] PRIMARY KEY CLUSTERED ([RecordOwnershipTypeId] ASC)
);
GO