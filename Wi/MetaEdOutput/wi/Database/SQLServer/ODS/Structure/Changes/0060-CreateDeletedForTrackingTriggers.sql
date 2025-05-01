CREATE TRIGGER [wi].[wi_CertificatedProgramStatusDescriptor_TR_DeleteTracking] ON [wi].[CertificatedProgramStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_CertificatedProgramStatusDescriptor_TrackedDelete](CertificatedProgramStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CertificatedProgramStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificatedProgramStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[CertificatedProgramStatusDescriptor] ENABLE TRIGGER [wi_CertificatedProgramStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_CountDateNameDescriptor_TR_DeleteTracking] ON [wi].[CountDateNameDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_CountDateNameDescriptor_TrackedDelete](CountDateNameDescriptorId, Id, ChangeVersion)
    SELECT  d.CountDateNameDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CountDateNameDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[CountDateNameDescriptor] ENABLE TRIGGER [wi_CountDateNameDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_CountDateReceivingServiceDescriptor_TR_DeleteTracking] ON [wi].[CountDateReceivingServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_CountDateReceivingServiceDescriptor_TrackedDelete](CountDateReceivingServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.CountDateReceivingServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CountDateReceivingServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[CountDateReceivingServiceDescriptor] ENABLE TRIGGER [wi_CountDateReceivingServiceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_CteProgramAreaDescriptor_TR_DeleteTracking] ON [wi].[CteProgramAreaDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_CteProgramAreaDescriptor_TrackedDelete](CteProgramAreaDescriptorId, Id, ChangeVersion)
    SELECT  d.CteProgramAreaDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CteProgramAreaDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[CteProgramAreaDescriptor] ENABLE TRIGGER [wi_CteProgramAreaDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_IacCodeDescriptor_TR_DeleteTracking] ON [wi].[IacCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_IacCodeDescriptor_TrackedDelete](IacCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.IacCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IacCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[IacCodeDescriptor] ENABLE TRIGGER [wi_IacCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_ModifiedTermDescriptor_TR_DeleteTracking] ON [wi].[ModifiedTermDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_ModifiedTermDescriptor_TrackedDelete](ModifiedTermDescriptorId, Id, ChangeVersion)
    SELECT  d.ModifiedTermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ModifiedTermDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[ModifiedTermDescriptor] ENABLE TRIGGER [wi_ModifiedTermDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [wi].[wi_StateEndorsedRegionalCareerPathwayStatusDescriptor_TR_DeleteTracking] ON [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[wi_StateEndorsedRegionalCareerPathwayStatusDescriptor_TrackedDelete](StateEndorsedRegionalCareerPathwayStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.StateEndorsedRegionalCareerPathwayStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StateEndorsedRegionalCareerPathwayStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] ENABLE TRIGGER [wi_StateEndorsedRegionalCareerPathwayStatusDescriptor_TR_DeleteTracking]
GO


