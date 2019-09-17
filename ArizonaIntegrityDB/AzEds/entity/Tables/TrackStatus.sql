CREATE TABLE [entity].[TrackStatus](
	[CalendarCode] NVARCHAR (60) NOT NULL DEFAULT ('Not Applicable'),
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[TrackNumber] [int] NOT NULL DEFAULT -2,
	[TrackLocalEducationAgencyId] [int] NOT NULL,
	[IsCertified] [bit] NOT NULL DEFAULT (0),
	[IsADEApproved] [bit] NOT NULL DEFAULT (1),
	[IsValid] [bit] NULL,
	[CertificationDate] [datetime] NULL,
	[ADEApprovalDate] [datetime] NOT NULL,
	[ValidationDate] [datetime] NULL,
	[ADEApprovedBy] [nchar](500) NOT NULL,
	[CertifiedBy] [nchar](500) NULL,
	CONSTRAINT [PK_TrackStatus] PRIMARY KEY CLUSTERED  ([CalendarCode] ASC,[EducationOrganizationId] ASC,	[FiscalYear] ASC, [TrackNumber] ASC, [TrackLocalEducationAgencyId] ASC ),
	CONSTRAINT [FK_TrackStatus_EducationOrgnization] FOREIGN KEY([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
) 
GO

ALTER TABLE [entity].[TrackStatus] CHECK CONSTRAINT [FK_TrackStatus_EducationOrgnization]
GO