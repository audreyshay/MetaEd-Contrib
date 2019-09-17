CREATE TABLE [config].[MembershipActivityCodeType](
	[MembershipActivityCodeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MembershipActivityCodeType] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(1024) NOT NULL,
	
 CONSTRAINT [PK_MembershipActivityCodeType] PRIMARY KEY CLUSTERED 
(
	[MembershipActivityCodeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

