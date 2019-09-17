CREATE TABLE [xref].[MethodCreditEarnedDescriptorType]
(
	[MethodCreditEarnedTypeId] int NOT NULL, 
	[MethodCreditEarnedTypeCodeValue] nvarchar(50) NOT NULL, 
	[MethodCreditEarnedTypeDescription] nvarchar(1024) NOT NULL,
	CONSTRAINT [PK_MethodCreditEarnedDescriptorType] PRIMARY KEY ([MethodCreditEarnedTypeId] ASC, [MethodCreditEarnedTypeCodeValue] ASC )
);