CREATE TABLE process.ProcessTypeRecordOwnershipTypeAssociation
( 
	[ProcessTypeId] INT  NOT NULL, 
	[RecordOwnershipTypeId] INT  NOT NULL,
	CONSTRAINT [PK_ProcessTypeRecordOwnershipTypeAssociation] PRIMARY KEY CLUSTERED ([RecordOwnershipTypeId] ASC, [ProcessTypeId] ASC),
	CONSTRAINT [FK_ProcessTypeRecordOwnershipTypeAssociation_RecordOwnershipTypeId] FOREIGN KEY ([RecordOwnershipTypeId]) REFERENCES [leadata].[RecordOwnershipType] ([RecordOwnershipTypeId]), 
	CONSTRAINT [FK_ProcessTypeRecordOwnershipTypeAssociation_ProcessTypeId] FOREIGN KEY ([ProcessTypeId]) REFERENCES [process].[ProcessType] ([ProcessTypeId])

);