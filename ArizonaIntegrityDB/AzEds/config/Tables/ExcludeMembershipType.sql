CREATE TABLE [config].[ExcludeMembershipType]
(
	[FiscalYear] INT NOT NULL , 
    [MembershipTypeDescriptorId] INT NOT NULL,
	CONSTRAINT [FK_ExcludeMembershipType_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]), 
    CONSTRAINT ExcludeMembershipType_PK PRIMARY KEY CLUSTERED ([MembershipTypeDescriptorId], [FiscalYear])

)
