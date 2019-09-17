CREATE TABLE [config].[MembershipActivityCodeTypeLookUp](
	[MembershipActivityCodeTypeId] [int] NOT NULL,
	[DescriptorId] [int] NOT NULL,
	[BeginFiscalYear] [int] NOT NULL,
	[EndFiscalYear] [int] NOT NULL,
 CONSTRAINT [PK_MembershipActivityCodeTypeLookUp] PRIMARY KEY CLUSTERED 
(
	[MembershipActivityCodeTypeId] ASC,
	[DescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

