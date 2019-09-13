CREATE TABLE [edfi].[EducationOrganizationAddress] (
    [EducationOrganizationId]  INT            NOT NULL,
    [AddressTypeId]            INT            NOT NULL,
    [StreetNumberName]         NVARCHAR (150) NOT NULL,
    [ApartmentRoomSuiteNumber] NVARCHAR (50)  NULL,
    [BuildingSiteNumber]       NVARCHAR (20)  NULL,
    [City]                     NVARCHAR (30)  NOT NULL,
    [StateAbbreviationTypeId]  INT            NOT NULL,
    [PostalCode]               NVARCHAR (17)  NOT NULL,
    [NameOfCounty]             NVARCHAR (30)  NULL,
    [CountyFIPSCode]           NVARCHAR (5)   NULL,
    [Latitude]                 NVARCHAR (20)  NULL,
    [Longitude]                NVARCHAR (20)  NULL,
    [BeginDate]                DATE           NULL,
    [EndDate]                  DATE           NULL,
    [CreateDate]               DATETIME       CONSTRAINT [EducationOrganizationAddress_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
  	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	CONSTRAINT [PK_EducationOrganizationAddress] PRIMARY KEY CLUSTERED ([SchoolYear] ASC,[EducationOrganizationId] ASC, [AddressTypeId] ASC),
    CONSTRAINT [FK_EducationOrganizationAddress_AddressType_AddressTypeId] FOREIGN KEY ([AddressTypeId]) REFERENCES [edfi].[AddressType] ([AddressTypeId]),
    CONSTRAINT [FK_EducationOrganizationAddress_EducationOrganization_EducationOrganizationId] FOREIGN KEY ([SchoolYear],[EducationOrganizationId]) REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]) ON DELETE CASCADE,
    CONSTRAINT [FK_EducationOrganizationAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY ([StateAbbreviationTypeId]) REFERENCES [edfi].[StateAbbreviationType] ([StateAbbreviationTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_EducationOrganizationAddress_AddressType_AddressTypeId]
    ON [edfi].[EducationOrganizationAddress]([AddressTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_EducationOrganizationAddress_EducationOrganization_EducationOrganizationId]
    ON [edfi].[EducationOrganizationAddress]([EducationOrganizationId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_EducationOrganizationAddress_StateAbbreviationType_StateAbbreviationTypeId]
    ON [edfi].[EducationOrganizationAddress]([StateAbbreviationTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The abbreviation for the state (within the United States) or outlying area in which an address is located.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'StateAbbreviationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The five or nine digit zip code or overseas postal code portion of an address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'PostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'NameOfCounty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Definition The Federal Information Processing Standards (FIPS) numeric code for the county issued by the National Institute of Standards and Technology (NIST). Counties are considered to be the "first-order subdivisions" of each State and statistically equivalent entity, regardless of their local designations (county, parish, borough, etc.) Counties in different States will have the same code. A unique county number is created when combined with the 2-digit FIPS State Code.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'CountyFIPSCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The geographic latitude of the physical address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'Latitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The geographic longitude of the physical address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'Longitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The first date the address is valid. For physical addresses, the date the person moved to that address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The last date the address is valid. For physical addresses, this would be the date the person moved from that address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The set of elements that describes an address, including the street address, city, state and ZIP code.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Address', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'AddressTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The street number and street name or post office box number of an address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'StreetNumberName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The apartment, room, or suite number of an address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'ApartmentRoomSuiteNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The number of the building on the site, if more than one building shares the same address.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'BuildingSiteNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The name of the city in which an address is located.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationOrganizationAddress', @level2type = N'COLUMN', @level2name = N'City';

