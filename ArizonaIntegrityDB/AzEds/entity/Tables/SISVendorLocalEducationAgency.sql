CREATE TABLE [entity].[SISVendorLocalEducationAgency](
	[SISVendorID] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LocalEducationAgencyID] [int] NOT NULL,
	[SelfHosted] [bit] NOT NULL CONSTRAINT [DF_SISVendorLocalEducationAgency_SelfHosted]  DEFAULT ((0)),
	[OnAzeds] [bit] NOT NULL CONSTRAINT [DF_SISVendorLocalEducationAgency_OnAzeds]  DEFAULT ((0)),
	CONSTRAINT [PK_SISVendorLocalEducationAgency] PRIMARY KEY CLUSTERED 
	(
		[SISVendorID] ASC,
		[FiscalYear] ASC,
		[LocalEducationAgencyID] ASC
	), 
	CONSTRAINT [FK_SISVendorLocalEducationAgency_LocalEducationAgency] FOREIGN KEY([LocalEducationAgencyID], [FiscalYear])
		REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId], [FiscalYear]),
	CONSTRAINT [FK_SISVendorLocalEducationAgency_SISVendors] FOREIGN KEY([SISVendorID])
		REFERENCES [entity].[SISVendors] ([VendorID])
); 

GO
