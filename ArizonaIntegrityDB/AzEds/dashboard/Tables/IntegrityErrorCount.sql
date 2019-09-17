CREATE TABLE dashboard.IntegrityErrorCount(               
EventDateId						INT				NOT NULL,                                 
FiscalYear						INT				NOT NULL,
SchoolId						INT				NOT NULL,         
AttendingLocalEducationAgencyId INT				NOT NULL,
IntegrityRuleTypeId				INT				NOT NULL,
ExceptionMessageCode			NVARCHAR(50)	NOT NULL,
ExceptionSeverityId				INT				NOT NULL,
RecordCount						INT				NOT NULL CONSTRAINT [DF_IntegrityErrorCount_RecordCount]  DEFAULT ((0)),
CONSTRAINT [PK_EventDateId_FY_SchId_LEAId_IRTId_EMC_ESI] PRIMARY KEY CLUSTERED
	(
		 EventDateId					 ASC
		,FiscalYear						 ASC
		,SchoolId						 ASC
		,AttendingLocalEducationAgencyId ASC
		,IntegrityRuleTypeId			 ASC
		,ExceptionMessageCode			 ASC
		,ExceptionSeverityId			 ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_EventDateId FOREIGN KEY (EventDateId)
 REFERENCES  dashboard.EventDate(EventDateId)
 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_FiscalYear_SchoolId FOREIGN KEY (SchoolId,FiscalYear)
 REFERENCES  entity.School(SchoolId,FiscalYear)
 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_AttendingLocalEducationAgencyId FOREIGN KEY (AttendingLocalEducationAgencyId,FiscalYear)
 REFERENCES  entity.LocalEducationAgency (LocalEducationAgencyId,FiscalYear)
 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_IntegrityRuleTypeId FOREIGN KEY (IntegrityRuleTypeId)
 REFERENCES  integrity.IntegrityRuleType (IntegrityRuleTypeId)
 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_ExceptionMessageCode FOREIGN KEY (ExceptionMessageCode)
 REFERENCES  integrity.IntegrityExceptionMessage (ExceptionMessageCode)  
 GO
 ALTER TABLE dashboard.IntegrityErrorCount WITH CHECK ADD CONSTRAINT FK_IntegrityErrorCount_ExceptionSeverityId FOREIGN KEY (ExceptionSeverityId)
 REFERENCES  integrity.ExceptionSeverity (ExceptionSeverityId)    
 GO