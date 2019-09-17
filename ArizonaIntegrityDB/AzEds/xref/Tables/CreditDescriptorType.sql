CREATE TABLE [xref].[CreditDescriptorType]
(
	[CreditTypeId] [int] NOT NULL,
	[CreditTypeCodeValue] [nvarchar](50) NOT NULL,
	[CreditTypeDescription] [nvarchar](50) NOT NULL
	CONSTRAINT [PK_CreditDescriptorType] PRIMARY KEY ([CreditTypeId] ASC, [CreditTypeCodeValue] ASC )
) 