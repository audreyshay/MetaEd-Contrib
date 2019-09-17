CREATE TABLE [xref].[AddressDescriptorType]
(
	[AddressTypeId] int NOT NULL,	
	[AddressTypeCodeValue] nvarchar(50) NOT NULL,
	[AddressTypeDescription] nvarchar(50) NOT NULL,
	CONSTRAINT [PK_AddressDescriptorType] PRIMARY KEY CLUSTERED ([AddressTypeId]ASC, [AddressTypeCodeValue]ASC)
);
