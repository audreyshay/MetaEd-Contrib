CREATE TABLE [integrity].[IntegrityTypeNeedCategoryTypeAssociation](
	[IntegrityTypeId] [int] NOT NULL,
	[StudentNeedCategoryTypeId] [int] NOT NULL,
 CONSTRAINT [PK_IntegrityTypeNeedCategoryTypeAssociation] PRIMARY KEY CLUSTERED ([IntegrityTypeId] ASC,	[StudentNeedCategoryTypeId] ASC),
 CONSTRAINT [FK_IntegrityTypeNeedCategoryTypeAssociation_IntegrityType] FOREIGN KEY ([IntegrityTypeId]) REFERENCES [integrity].[IntegrityType] ([IntegrityTypeId]),
 CONSTRAINT [FK_IntegrityTypeNeedCategoryTypeAssociation_StudentNeedCategoryType] FOREIGN KEY ([StudentNeedCategoryTypeId]) REFERENCES [LeaData].[StudentNeedCategoryType] ([StudentNeedCategoryTypeId])
);

