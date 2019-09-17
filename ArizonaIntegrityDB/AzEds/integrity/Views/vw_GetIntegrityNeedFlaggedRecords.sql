
CREATE VIEW [integrity].[vw_GetIntegrityNeedFlaggedRecords]
AS
	 SELECT 			
			IND.IntegrityNeedId, 
			IND.FiscalYear, 
			IND.IntegrityRuleTypeId, 
			IND.IsIntegrityNeeded, 
			IND.StudentUSI, 
			IND.StudentUniqueId,
			IND.SchoolId, 
			IND.SchoolEntryDate,
			IND.TermTypeId,
			T.CodeValue as TermType,
			IND.LocalCourseCode,
			IND.StaffUSI,
			IND.StaffUniqueId,		
			IRT.IntegrityTypeId,
			IND.SchoolYear,
			IND.SectionBeginDate,
			IND.TrackLocalEducationAgencyId,
			IND.TrackNumber,
			IND.SubmittedByEducationOrganizationId,
			PST.processSubTypeid,
			PST.Description as ProcessSubTypeDescription, 
			PT.processTYPEID,
			PT.Description as ProcessTypeDescription,
			TDT.TermDescriptorId 
	  FROM  integrity.IntegrityNeed IND  (NOLOCK)			
	      JOIN integrity.IntegrityRuleType IRT (NOLOCK)
		    ON IRT.IntegrityRuleTypeId = IND.IntegrityRuleTypeId
		  JOIN integrity.IntegrityType IT (nolock) 
			ON IRT.IntegrityTypeId = IT.IntegrityTypeId
		 JOIN process.ProcessSubType PST (NOLOCK)
		 ON PST.ProcessSubTypeId = IT.IntegrityTypeId
		 JOIN process.ProcessType PT (NOLOCK)
		 ON PT.ProcessTypeId = PST.ProcessTypeId
          LEFT JOIN entity.TermType T 
		  ON T.TermTypeId = IND.TermTypeId
		 LEFT JOIN xref.TermDescriptorType TDT 
		 ON T.TermTypeId = TDT.TermTypeId
		WHERE IND.IsIntegrityNeeded = 1
GO