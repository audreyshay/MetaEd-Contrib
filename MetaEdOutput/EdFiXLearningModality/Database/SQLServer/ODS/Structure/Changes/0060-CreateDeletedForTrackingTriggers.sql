CREATE TRIGGER [edfixlearningmodality].[edfixlearningmodality_ModalityTimeTypeDescriptor_TR_DeleteTracking] ON [edfixlearningmodality].[ModalityTimeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_edfixlearningmodality].[ModalityTimeTypeDescriptor](ModalityTimeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ModalityTimeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ModalityTimeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixlearningmodality].[ModalityTimeTypeDescriptor] ENABLE TRIGGER [edfixlearningmodality_ModalityTimeTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixlearningmodality].[edfixlearningmodality_ModalityTypeDescriptor_TR_DeleteTracking] ON [edfixlearningmodality].[ModalityTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_edfixlearningmodality].[ModalityTypeDescriptor](ModalityTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ModalityTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ModalityTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixlearningmodality].[ModalityTypeDescriptor] ENABLE TRIGGER [edfixlearningmodality_ModalityTypeDescriptor_TR_DeleteTracking]
GO


