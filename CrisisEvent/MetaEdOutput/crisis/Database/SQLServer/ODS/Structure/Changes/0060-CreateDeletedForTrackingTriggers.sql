CREATE TRIGGER [crisis].[crisis_CrisisDetails_TR_DeleteTracking] ON [crisis].[CrisisDetails] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[crisis_CrisisDetails_TrackedDelete](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [crisis].[CrisisDetails] ENABLE TRIGGER [crisis_CrisisDetails_TR_DeleteTracking]
GO


CREATE TRIGGER [crisis].[crisis_CrisisEventDescriptor_TR_DeleteTracking] ON [crisis].[CrisisEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[crisis_CrisisEventDescriptor_TrackedDelete](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [crisis].[CrisisEventDescriptor] ENABLE TRIGGER [crisis_CrisisEventDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [crisis].[crisis_CrisisTypeDescriptor_TR_DeleteTracking] ON [crisis].[CrisisTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[crisis_CrisisTypeDescriptor_TrackedDelete](CrisisTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [crisis].[CrisisTypeDescriptor] ENABLE TRIGGER [crisis_CrisisTypeDescriptor_TR_DeleteTracking]
GO


