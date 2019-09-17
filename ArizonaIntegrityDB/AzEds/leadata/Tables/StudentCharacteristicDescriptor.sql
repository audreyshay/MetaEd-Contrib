CREATE TABLE [leadata].[StudentCharacteristicDescriptor]
(
	[StudentCharacteristicDescriptorId] [int] NOT NULL,
	[StudentCharacteristicTypeId] [int] NULL,
	CONSTRAINT [PK_StudentCharacteristicDescriptor] PRIMARY KEY CLUSTERED ([StudentCharacteristicDescriptorId] ASC)

) ON [PRIMARY]

GO


ALTER TABLE [leadata].[StudentCharacteristicDescriptor]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentCharacteristicDescriptor_StudentCharacteristicType_StudentCharacteristicTypeId] FOREIGN KEY([StudentCharacteristicTypeId])
REFERENCES [leadata].[StudentCharacteristicType] ([StudentCharacteristicTypeId])
GO

ALTER TABLE [leadata].[StudentCharacteristicDescriptor] CHECK CONSTRAINT [FK_StudentCharacteristicDescriptor_StudentCharacteristicType_StudentCharacteristicTypeId]
GO
