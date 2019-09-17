CREATE TABLE [leadata].[StudentParentAssociation]
(
	[StudentUSI] [int] NOT NULL,
	[ParentUSI] [int] NOT NULL,
	[RelationTypeId] [int] NULL,
	[PrimaryContactStatus] [bit] NULL,
	[LivesWith] [bit] NULL,
	[EmergencyContactStatus] [bit] NULL,
	[ContactPriority] [int] NULL,
	[ContactRestrictions] [nvarchar](250) NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 	[HashValue] [binary](64) DEFAULT (00) NOT NULL,
    CONSTRAINT [PK_StudentParentAssociation] PRIMARY KEY CLUSTERED ([StudentUSI] ASC,[ParentUSI] ASC)
) 
GO

ALTER TABLE [leadata].[StudentParentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentParentAssociation_Parent_ParentUSI] FOREIGN KEY([ParentUSI])
REFERENCES [leadata].[Parent] ([ParentUSI])
GO

ALTER TABLE [leadata].[StudentParentAssociation] CHECK CONSTRAINT [FK_StudentParentAssociation_Parent_ParentUSI]
GO

ALTER TABLE [leadata].[StudentParentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentParentAssociation_RelationType_RelationTypeId] FOREIGN KEY([RelationTypeId])
REFERENCES [leadata].[RelationType] ([RelationTypeId])
GO

ALTER TABLE [leadata].[StudentParentAssociation] CHECK CONSTRAINT [FK_StudentParentAssociation_RelationType_RelationTypeId]
GO

ALTER TABLE [leadata].[StudentParentAssociation]  WITH CHECK ADD  CONSTRAINT [FK_StudentParentAssociation_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
GO

ALTER TABLE [leadata].[StudentParentAssociation] CHECK CONSTRAINT [FK_StudentParentAssociation_Student_StudentUSI]
GO
