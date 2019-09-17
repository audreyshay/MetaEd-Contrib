CREATE TABLE [ace].[ADMType] (
    [ADMTypeId] INT NOT NULL,
    [Description] NVARCHAR(1024) NOT NULL, 
    CONSTRAINT [PK_ProcessSubType] PRIMARY KEY CLUSTERED ([ADMTypeId] ASC),
    CONSTRAINT [FK_ADMType_ProcessSubType] FOREIGN KEY ([ADMTypeId]) REFERENCES [process].[ProcessSubType] ([ProcessSubTypeId])
);

