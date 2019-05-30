CREATE TRIGGER [crisis].[crisis_CrisisDetails_TR_UpdateChangeVersion] ON [crisis].[CrisisDetails] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [crisis].[CrisisDetails]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [crisis].[CrisisDetails] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

