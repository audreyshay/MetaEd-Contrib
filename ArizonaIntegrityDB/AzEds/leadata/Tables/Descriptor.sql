CREATE TABLE [leadata].[Descriptor] (
    [FiscalYear]         INT             CONSTRAINT [DF_Descriptor_FiscalYear] DEFAULT ((2015)) NOT NULL,
    [DescriptorId]       INT             IDENTITY (1, 1) NOT NULL,
	[Namespace]			 NVARCHAR (255)  NOT NULL,
    [CodeValue]          NVARCHAR (50)   NOT NULL,
    [Description]        NVARCHAR (1024) NULL,
    [EffectiveBeginDate] DATE            NULL,
    [EffectiveEndDate]   DATE            NULL,
    [LastModifiedDate]   DATETIME        CONSTRAINT [Descriptor_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME        CONSTRAINT [Descriptor_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[ShortDescription] [nvarchar](75) NULL,
    CONSTRAINT [PK_Descriptor] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [DescriptorId] ASC)
);

GO

CREATE NONCLUSTERED INDEX [IXNC_Descriptor_DescriptorID]
    ON [leadata].[Descriptor]([DescriptorId] ASC)
    INCLUDE([CodeValue]);


