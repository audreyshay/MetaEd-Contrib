CREATE TABLE [entity].[OperationalStatusType] (
    [OperationalStatusTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (50)   NOT NULL,
    [Description]             NVARCHAR (1024) NOT NULL,
	[IsActive]				  BIT			  CONSTRAINT [DF_OperationalStatusType_IsActive] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_OperationalStatusType] PRIMARY KEY CLUSTERED ([OperationalStatusTypeId] ASC)
);

