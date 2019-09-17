CREATE TABLE [integrity].[IntegrityType] (
    [IntegrityTypeId] INT NOT NULL,
    CONSTRAINT [PK_IntegrityType] PRIMARY KEY CLUSTERED ([IntegrityTypeId] ASC),
    CONSTRAINT [FK_IntegrityType_ProcessSubType] FOREIGN KEY ([IntegrityTypeId]) REFERENCES [process].[ProcessSubType] ([ProcessSubTypeId])
);

