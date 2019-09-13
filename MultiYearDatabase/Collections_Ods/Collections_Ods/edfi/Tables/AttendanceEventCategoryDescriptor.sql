CREATE TABLE [edfi].[AttendanceEventCategoryDescriptor] (
    [AttendanceEventCategoryDescriptorId] INT NOT NULL,
    [AttendanceEventCategoryTypeId]       INT NOT NULL,
    CONSTRAINT [PK_AttendanceEventCategoryDescriptor] PRIMARY KEY CLUSTERED ([AttendanceEventCategoryDescriptorId] ASC),
    CONSTRAINT [FK_AttendanceEventCategoryDescriptor_AttendanceEventCategoryType_AttendanceEventCategoryTypeId] FOREIGN KEY ([AttendanceEventCategoryTypeId]) REFERENCES [edfi].[AttendanceEventCategoryType] ([AttendanceEventCategoryTypeId]),
    CONSTRAINT [FK_AttendanceEventCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([AttendanceEventCategoryDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor holds the category of the attendance event (e.g., tardy).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryDescriptor', @level2type = N'COLUMN', @level2name = N'AttendanceEventCategoryDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for AttendanceEventCategoryType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AttendanceEventCategoryDescriptor', @level2type = N'COLUMN', @level2name = N'AttendanceEventCategoryTypeId';

