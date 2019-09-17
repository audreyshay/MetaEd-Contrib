CREATE TABLE [leadata].[StudentCharacteristicType] 
(
    [StudentCharacteristicTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (50)    NOT NULL,
    [Description]                 NVARCHAR (1024)  NOT NULL,
    CONSTRAINT [PK_StudentCharacteristicsType] PRIMARY KEY CLUSTERED ([StudentCharacteristicTypeId] ASC)
);

GO