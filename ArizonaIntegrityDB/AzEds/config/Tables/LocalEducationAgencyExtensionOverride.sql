CREATE TABLE [config].[LocalEducationAgencyExtensionOverride](
	[LocalEducationAgencyId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[SectorTypeId] [int] NOT NULL,
	[IsOutOfState] [bit] NULL,
	[IsJTED] [bit] NULL,
	[IsAccommodationDistrict] [bit] NULL,
	[IsSecureCare] [bit] NULL,
	[IsExceptional] [bit] NULL,
	[IsHeadStart] [bit] NULL,
	[IsValidForDOR] [bit] NULL,
	[IsTransportation] [bit] NULL,
	[ElementaryNotInHighSchool] [bit] NULL,
	[HighSchoolDistrict] [bit] NULL,
 CONSTRAINT [PK_LocalEducationAgencyExtensionOverride] PRIMARY KEY CLUSTERED 
(
	[LocalEducationAgencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [config].[LocalEducationAgencyExtensionOverride]  WITH CHECK ADD  CONSTRAINT [FK_LocalEducationAgencyExtensionOverride_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [config].[LocalEducationAgencyExtensionOverride] CHECK CONSTRAINT [FK_LocalEducationAgencyExtensionOverride_FiscalYear]
GO

ALTER TABLE [config].[LocalEducationAgencyExtensionOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_LocalEducationAgencyExtensionOverride_SectorType] FOREIGN KEY([SectorTypeId])
REFERENCES [entity].[SectorType] ([SectorTypeId])
GO

ALTER TABLE [config].[LocalEducationAgencyExtensionOverride] CHECK CONSTRAINT [FK_LocalEducationAgencyExtensionOverride_SectorType]
GO