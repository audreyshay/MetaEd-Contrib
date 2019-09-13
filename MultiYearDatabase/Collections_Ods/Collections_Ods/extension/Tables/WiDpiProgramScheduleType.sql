CREATE TABLE [extension].[WiDpiProgramScheduleType] (
    [WiDpiProgramScheduleTypeId] INT         IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (50)    NOT NULL,
    [Description]         NVARCHAR (1024)  NOT NULL,
    [ShortDescription]    NVARCHAR (450)   NOT NULL,
    [Id]                  UNIQUEIDENTIFIER CONSTRAINT [WiDpiProgramScheduleType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]    DATETIME         CONSTRAINT [WiDpiProgramScheduleType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]          DATETIME         CONSTRAINT [WiDpiProgramScheduleType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WiDpiProgramScheduleType] PRIMARY KEY CLUSTERED ([WiDpiProgramScheduleTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicator of school day schedule for Four year old and Five year old Kindergartners', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiProgramScheduleType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiProgramScheduleType', @level2type = N'COLUMN', @level2name = N'WiDpiProgramScheduleTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The code value of a program schedule', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiProgramScheduleType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The description of a program schedule', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiProgramScheduleType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The short description of a program schedule', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiProgramScheduleType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

