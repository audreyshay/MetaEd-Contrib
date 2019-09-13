CREATE TABLE [edfi].[StaffIdentificationCode](
	[StaffUSI] [int] NOT NULL,
	[AssigningOrganizationIdentificationCode] [nvarchar](60) NULL,
	[IdentificationCode] [nvarchar](60) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [StaffIdentificationCode_DF_CreateDate]  DEFAULT (getdate()),
	[StaffIdentificationSystemDescriptorId] [int] NOT NULL,
	[SchoolYear] SMALLINT NOT NULL CONSTRAINT [StaffIdentificationCode_DF_SchoolYear] DEFAULT (datepart(year,getdate())),
 CONSTRAINT [PK_StaffIdentificationCode] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[StaffUSI] ASC,
	[StaffIdentificationSystemDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[StaffIdentificationCode] ADD CONSTRAINT [FK_StaffIdentificationCode_Staff_StaffUSI_SchoolYear] 
	FOREIGN KEY([SchoolYear], [StaffUSI])
	REFERENCES [edfi].[Staff] ([SchoolYear],[StaffUSI])
	ON DELETE CASCADE
GO

ALTER TABLE [edfi].[StaffIdentificationCode] ADD CONSTRAINT [FK_StaffIdentificationCode_StaffIdentificationSystemDescriptor_StaffIdentificationSystemDescriptorId] 
	FOREIGN KEY([StaffIdentificationSystemDescriptorId])
	REFERENCES [edfi].[StaffIdentificationSystemDescriptor] ([StaffIdentificationSystemDescriptorId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a staff by a state education agency.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationCode', @level2type=N'COLUMN',@level2name=N'StaffUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization code or name assigning the staff Identification Code.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationCode', @level2type=N'COLUMN',@level2name=N'AssigningOrganizationIdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a space, room, site, building, individual, organization, program, or institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationCode', @level2type=N'COLUMN',@level2name=N'IdentificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationCode', @level2type=N'COLUMN',@level2name=N'StaffIdentificationSystemDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A coding scheme that is used for identification and record-keeping purposes by schools, social services or other agencies to refer to a staff member.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationCode'
GO


