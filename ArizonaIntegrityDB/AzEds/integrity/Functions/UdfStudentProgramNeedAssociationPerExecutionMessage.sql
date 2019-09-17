CREATE FUNCTION [integrity].[UdfStudentProgramNeedAssociationPerExecutionMessage]
(
	@executionid int,
	@MessageId as [nvarchar](36),
	@fiscalYear int
)
RETURNS @StudentProgramNeedAssociation TABLE
(
	   FiscalYear int, 
	   StudentUSI int,
	   SchoolId int, 
	   ProgramEducationOrganizationId int, 
	   ProgramTypeId int, 
	   ProgramName varchar(255), 
	   ProgramBeginDate datetime,
	   ProgramEndDate datetime,
	   ReasonExitedDescriptorid int,
	   ExitCode varchar(60),
	   ProgramCode varchar(60),
	   NeedDescriptorId int, 
	   NeedCode varchar(60),
	   NeedStartDate datetime,
	   NeedEndDate datetime,
	   PrimaryStudentNeedIndicator bit,
	   SPASourceId uniqueIdentifier,
	   SNSourceId uniqueIdentifier
)
AS
BEGIN		

	INSERT @StudentProgramNeedAssociation
	SELECT DISTINCT SPA.FiscalYear, 
	   SPA.StudentUSI,
	   CASE WHEN SPA.EducationOrganizationId IS NULL AND SN.ReportingEducationOrganizationID IS NOT NULL THEN SN.ReportingEducationOrganizationID
	        WHEN SPA.EducationOrganizationId IS NOT NULL AND SN.ReportingEducationOrganizationID IS NULL THEN SPA.EducationOrganizationID
	        ELSE SPA.EducationOrganizationId 
	   END											AS 'SchoolId', 
	   SPA.ProgramEducationOrganizationId, 
	   SPA.ProgramTypeId, 
	   SPA.ProgramName, 
	   SPA.BeginDate								AS 'ProgramBeginDate',
	   SPA.EndDate									AS 'ProgramEndDate',
	   SPA.ReasonExitedDescriptorid					AS 'ReasonExitedDescriptorId',
	   PD.CodeValue									AS 'ExitCode',
	   PSD.CodeValue								AS 'ProgramCode',
	   SN.StudentNeedDescriptorId					AS 'NeedDescriptorId', 
	   SND.CodeValue								AS 'NeedCode',
	   SN.StudentNeedEntryDate						AS 'NeedStartDate',
	   SN.StudentNeedExitDate						AS 'NeedEndDate',
	   ISNULL(SN.PrimaryStudentNeedIndicator,0)     AS 'PrimaryStudentNeedIndicator',
	   SPA.SourceId                                 AS 'SPASourceId',
	   SN.SourceId									AS 'SNSourceId'
FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
INNER JOIN leadata.studentProgramassociation SPA
	ON ih.FiscalYear = spa.FiscalYear 
	AND ih.StudentUSI = spa.StudentUSI
	AND ih.ExecutionId= @executionid
	AND ih.MessageId = @MessageId
	AND ih.FiscalYear = @fiscalYear
	   LEFT JOIN leadata.StudentNeed SN
	     ON SPA.StudentUSI = SN.StudentUSI
		    AND SPA.FiscalYear = SN.FiscalYear
			AND SPA.EducationOrganizationId = SN.ReportingEducationOrganizationID
			--AND (( SN.StudentNeedEntryDate > = SPA.BeginDate
			--       AND StudentNeedEntryDate <= ISNULL(SPA.EndDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
			--	 )
			--	 OR (( ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))>=  SPA.BeginDate 
			--           AND ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE)) <= ISNULL(SPA.EndDate ,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
			--	     ) 
			--	    )
			--	)
		    AND SN.StudentNeedEntryDate <= ISNULL(SPA.EndDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
		    AND SPA.BeginDate <= ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
	   LEFT JOIN entity.ProgramService PS 
	     ON SPA.FiscalYear = PS.FiscalYear
		    AND SPA.ProgramEducationOrganizationId = PS.EducationOrganizationId
			AND SPA.ProgramTypeId = PS.ProgramTypeId 
			AND SPA.ProgramName = PS.ProgramName
	   LEFT JOIN leadata.Descriptor PSD
	     ON PS.ServiceDescriptorId = PSD.DescriptorId
		    AND PS.FiscalYear = PSD.FiscalYear
	   LEFT JOIN leadata.Descriptor PD
	     ON SPA.ReasonExitedDescriptorId = PD.DescriptorId
		    AND SPA.FiscalYear = PD.FiscalYear
	   LEFT JOIN leadata.Descriptor SND
	     ON SN.StudentNeedDescriptorId = SND.DescriptorId
		    AND SN.FiscalYear = SND.FiscalYear
	   LEFT JOIN entity.ProgramNeedCodeMapping PNCM
	     ON SPA.FiscalYear = PNCM.FiscalYear 
		    AND PSD.DescriptorId = PNCM.[ServiceDescriptorId]
			AND SND.DescriptorId = PNCM.[NeedDescriptorId]
WHERE  SND.DescriptorId IS NULL 
			 OR (PSD.DescriptorId = PNCM.[ServiceDescriptorId]
			     AND SND.DescriptorId = PNCM.[NeedDescriptorId]
				 )
UNION
SELECT DISTINCT SN.FiscalYear, 
	   SN.StudentUSI,
	   CASE WHEN SPA.EducationOrganizationId IS NULL AND SN.ReportingEducationOrganizationID IS NOT NULL THEN SN.ReportingEducationOrganizationID
            WHEN SPA.EducationOrganizationId IS NOT NULL AND SN.ReportingEducationOrganizationID IS NULL THEN SPA.EducationOrganizationID
            ELSE SPA.EducationOrganizationId 
       END											AS 'SchoolId', 
	   SPA.ProgramEducationOrganizationId, 
	   SPA.ProgramTypeId, 
	   SPA.ProgramName, 
	   SPA.BeginDate								AS 'ProgramBeginDate',
	   SPA.EndDate									AS 'ProgramEndDate',
	   SPA.ReasonExitedDescriptorid					AS 'ReasonExitedDescriptorId',
	   PD.CodeValue									AS 'ExitCode',
	   PSD.CodeValue								AS 'ProgramCode',
	   SN.StudentNeedDescriptorId					AS 'NeedDescriptorId', 
	   SND.CodeValue								AS 'NeedCode',
	   SN.StudentNeedEntryDate						AS 'NeedStartDate',
	   SN.StudentNeedExitDate						AS 'NeedEndDate',
	   ISNULL(SN.PrimaryStudentNeedIndicator,0)     AS 'PrimaryStudentNeedIndicator',
	   SPA.SourceId                                 AS 'SPASourceId',
	   SN.SourceId									AS 'SNSourceId'
FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] ih
INNER JOIN	leadata.StudentNeed SN
	ON ih.FiscalYear = SN.FiscalYear 
	AND ih.StudentUSI = SN.StudentUSI
	AND ih.ExecutionId= @executionid
	AND ih.MessageId = @MessageId
	AND ih.FiscalYear = @fiscalYear
	   LEFT JOIN leadata.StudentProgramAssociation SPA
	     ON  SN.StudentUSI = SPA.StudentUSI
	         AND SN.FiscalYear = SPA.FiscalYear
			 AND SPA.EducationOrganizationId = SN.ReportingEducationOrganizationID
			 --AND (( SN.StudentNeedEntryDate > = SPA.BeginDate
			 --      AND StudentNeedEntryDate <= ISNULL(SPA.EndDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
				-- )
				-- OR (( ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SN.FiscalYear AS VARCHAR(4)) AS DATE))>=  SPA.BeginDate 
			 --          AND ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SN.FiscalYear AS VARCHAR(4)) AS DATE)) <= ISNULL(SPA.EndDate ,CAST( '06-30-' + CAST(SN.FiscalYear AS VARCHAR(4)) AS DATE))
				--     ) 
				--    )
				--)
			AND SN.StudentNeedEntryDate <= ISNULL(SPA.EndDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
		    AND SPA.BeginDate <= ISNULL(SN.StudentNeedExitDate,CAST( '06-30-' + CAST(SPA.FiscalYear AS VARCHAR(4)) AS DATE))
	   LEFT JOIN entity.ProgramService PS 
	     ON SPA.FiscalYear = PS.FiscalYear
		    AND SPA.ProgramEducationOrganizationId = PS.EducationOrganizationId
			AND SPA.ProgramTypeId = PS.ProgramTypeId 
			AND SPA.ProgramName = PS.ProgramName
	   LEFT JOIN leadata.Descriptor PSD
	     ON PS.ServiceDescriptorId = PSD.DescriptorId
		    AND PS.FiscalYear = PSD.FiscalYear
	   LEFT JOIN leadata.Descriptor PD
	     ON SPA.ReasonExitedDescriptorId = PD.DescriptorId
		    AND SPA.FiscalYear = PD.FiscalYear
	   LEFT JOIN leadata.Descriptor SND
	     ON SN.StudentNeedDescriptorId = SND.DescriptorId
		    AND SN.FiscalYear = SND.FiscalYear
	   LEFT JOIN entity.ProgramNeedCodeMapping PNCM
	     ON SPA.FiscalYear = PNCM.FiscalYear 
		    AND PSD.DescriptorId = PNCM.[ServiceDescriptorId]
			AND SND.DescriptorId = PNCM.[NeedDescriptorId]
			WHERE  PSD.DescriptorId IS NULL 
	         --OR SND.CodeValue IS NULL 
			 OR (PSD.DescriptorId = PNCM.[ServiceDescriptorId]
			     AND SND.DescriptorId = PNCM.[NeedDescriptorId]
				 )
	RETURN
END
