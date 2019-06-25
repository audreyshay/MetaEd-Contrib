BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.ClassGroup') AND name = N'UX_ClassGroup_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ClassGroup_Id ON [edfixcrdc].[ClassGroup]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.CommunityProviderLocation') AND name = N'UX_CommunityProviderLocation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CommunityProviderLocation_Id ON [edfixcrdc].[CommunityProviderLocation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.StudentClassGroupAssociation') AND name = N'UX_StudentClassGroupAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentClassGroupAssociation_Id ON [edfixcrdc].[StudentClassGroupAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixcrdc.StudentCommunityProviderLocationAssociation') AND name = N'UX_StudentCommunityProviderLocationAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentCommunityProviderLocationAssociation_Id ON [edfixcrdc].[StudentCommunityProviderLocationAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

