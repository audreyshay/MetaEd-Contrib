CREATE TABLE [leadata].[RecordOwnership] (
    [FiscalYear]         INT             NOT NULL,
    [ResourceId]                         UNIQUEIDENTIFIER NOT NULL,
    [RecordOwnershipTypeId]        INT              NOT NULL,
    [SubmittedByEducationOrganizationId] INT              NOT NULL,
    CONSTRAINT [PK_RecordOwnership] PRIMARY KEY CLUSTERED ([FiscalYear], [ResourceId], [SubmittedByEducationOrganizationId], [RecordOwnershipTypeId]),
    CONSTRAINT [FK_RecordOwnership_RecordOwnershipType] FOREIGN KEY ([RecordOwnershipTypeId]) REFERENCES [leadata].[RecordOwnershipType] ([RecordOwnershipTypeId])
);
GO

CREATE INDEX [IX_RecordOwnership]  
ON [leadata].[RecordOwnership] ([FiscalYear], [RecordOwnershipTypeId]) 
INCLUDE ([ResourceId], [SubmittedByEducationOrganizationId])