CREATE TABLE [edfi].[AttendanceEventCategoryType] (
    [AttendanceEventCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                     NVARCHAR (50)    NOT NULL,
    [Description]                   NVARCHAR (1024)  NOT NULL,
    [ShortDescription]              NVARCHAR (450)   NOT NULL,
    [Id]                            UNIQUEIDENTIFIER CONSTRAINT [AttendanceEventCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]              DATETIME         CONSTRAINT [AttendanceEventCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                    DATETIME         CONSTRAINT [AttendanceEventCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AttendanceEventCategoryType] PRIMARY KEY CLUSTERED ([AttendanceEventCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AttendanceEventCategoryType_ShortDescription]
    ON [edfi].[AttendanceEventCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_AttendanceEventCategoryType]
    ON [edfi].[AttendanceEventCategoryType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code categorizing the attendance event (e.g., excused absence, unexcused absence).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for AttendanceEventCategoryType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryType', @level2type = N'COLUMN', @level2name = N'AttendanceEventCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for AttendanceEventCategory Type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for AttendanceEventCategory type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

