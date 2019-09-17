CREATE TABLE [ace].[AggregationType] (
    [AggregationTypeId] INT             IDENTITY (1, 1) NOT NULL,
    [Description]       NVARCHAR (1024) NOT NULL,
    [ADMTypeId]         INT             NOT NULL,
    CONSTRAINT [PK_AggregationType] PRIMARY KEY CLUSTERED ([AggregationTypeId] ASC),
    CONSTRAINT [FK_AggregationType_ADMType] FOREIGN KEY ([ADMTypeId]) REFERENCES [ace].[ADMType] ([ADMTypeId])
);

