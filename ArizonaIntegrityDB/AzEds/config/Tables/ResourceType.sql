CREATE TABLE [config].[ResourceType] (
    [ResourceTypeId]                                          INT            NOT NULL,
    [Resource]                                                NVARCHAR (255) NOT NULL,
    [RequestBodyPropertyNameToExtractEducationOrganizationId] NVARCHAR (255) NULL,
    [AggregateRootEntityName]                                 NVARCHAR (255) NULL,
    [BeginFiscalYear]                                         INT            NULL,
    [EndFiscalYear]                                           INT            NULL,
    [SQLCommand]                                              NVARCHAR (MAX) NULL,
    [IsValidForStudent915]                                    BIT            DEFAULT ((0)) NULL,
    [RequestTypeId]                                           INT            NOT NULL,
    [IsValidForNonStudent915]                                 BIT            CONSTRAINT [DF_Config_ResourceType_IsValidForNonStudent915] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ResourceType] PRIMARY KEY CLUSTERED ([ResourceTypeId] ASC),
    CONSTRAINT [FK_ResourceType_FiscalYear_BeginFiscalYear] FOREIGN KEY ([BeginFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
    CONSTRAINT [FK_ResourceType_FiscalYear_EndFiscalYear] FOREIGN KEY ([EndFiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
    CONSTRAINT [FK_ResourceType_RequestTypeId] FOREIGN KEY ([RequestTypeId]) REFERENCES [config].[RequestType915] ([RequestTypeId])
);


GO

--CREATE UNIQUE INDEX [UX_ResourceType_Resource] ON [config].[ResourceType] ([Resource])
--GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_ResourceType_ResourceTypeId_Resource] ON [config].[ResourceType]
(
	[ResourceTypeId] ASC,
	[Resource] ASC

)
GO
