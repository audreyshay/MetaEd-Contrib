CREATE TABLE [leadata].[RecordOwnershipTypeResourceTypeAssociation] (
    [RecordOwnershipTypeId] INT   NOT NULL,
    [ResourceTypeId]        INT   NOT NULL,
    CONSTRAINT [PK_RecordOwnershipTypeResourceTypeAssociation] PRIMARY KEY CLUSTERED ([RecordOwnershipTypeId] ASC, [ResourceTypeId] ASC),
	CONSTRAINT [FK_RecordOwnershipTypeResourceTypeAssociation_RecordOwnershipTypeId] FOREIGN KEY ([RecordOwnershipTypeId]) REFERENCES [leadata].[RecordOwnershipType] ([RecordOwnershipTypeId]), 
	CONSTRAINT [FK_RecordOwnershipTypeResourceTypeAssociation_ResourceTypeId] FOREIGN KEY ([ResourceTypeId]) REFERENCES [config].[ResourceType] ([ResourceTypeId])
);
GO
