/********************************************************************************************************
**Procedure Name:
**     [integrity].[GetStateSpedRuleStudentNeed]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPED StudentNeedData for integrity processing  
**               
**Input:
**
**Output:
**	SPED StudentNeedData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPED StudentNeedData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/15/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  PSharma		10/10/2016 Added PrimaryNeedIndicator count
**  PSharma		11/21/2016 Uncommented esn.ReportingEducationOrganizationID = SPEDDM.SchoolId to fix the issues with 40050 and 40000
                           where we need to validate the needs at one school.
**  PSharma     12/12/2016 Added a flag AtleastOnePrimaryNeed
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetStateSpedRuleStudentNeed]
@ExecutionId int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
   
		

	      --- Get SPED Student Need Data
			SELECT DISTINCT ssa.StudentUSI, 
			       esn.ReportingEducationOrganizationID													AS 'SchoolID', 
				   SPEDDM.FiscalYear																	AS 'FiscalYear',
				   esn.StudentNeedEntryDate,															
				   esn.StudentNeedExitDate,																
				   snd.CodeValue																		AS 'StudentNeedDescriptor',
				   esn.PrimaryStudentNeedIndicator														AS 'IsPrimaryNeed',
				   integrity.IsNeedApprovedForSchool (ssa.SchoolId,snd.CodeValue)						AS 'IsNeedApprovedForSchool',
				   integrity.IsProgramSchoolLEA(esn.ReportingEducationOrganizationID,esn.FiscalYear)    AS 'ReportingEducationOrganizationIsLEA',
				   ISNULL(fpni.OverlappingPrimaryNeedCount,0)											AS 'OverlappingPrimaryNeedCount',
				   cast(CASE WHEN api.OnePrimaryNeed is null THEN 0 ELSE 1 END as bit)					AS 'OnePrimaryNeed'
			FROM   leadata.StudentNeed esn 
			    INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
			         ON esn.StudentUSI = SPEDDM.StudentUSI	
						AND  esn.FiscalYear	= SPEDDM.FiscalYear			 
						AND SPEDDM.IntegrityRuleTypeId IN (6,8)   -- Brings only data for STATE SPED & Fed Sped
					    AND esn.ReportingEducationOrganizationID = SPEDDM.SchoolId
				LEFT JOIN [integrity].[vw_OnePrimaryNeedIndicator] api
					ON esn.StudentUSI =api.studentusi
					AND esn.ReportingEducationOrganizationID = api.ReportingEducationOrganizationID
					AND esn.StudentNeedDescriptorId = api.StudentNeedDescriptorId
					AND esn.FiscalYear = api.FiscalYear
					AND esn.StudentNeedEntryDate = api.StudentNeedEntryDate
				LEFT JOIN leadata.StudentSchoolAssociation ssa
				     ON ssa.StudentUSI = SPEDDM.StudentUSI
					    AND ssa.SchoolId = SPEDDM.SchoolId
						AND SSA.FiscalYear = SPEDDM.FiscalYear
					  --  AND ssa.EntryDate = SPEDDM.SchoolEntryDate
		  	    LEFT JOIN leadata.StudentNeedDescriptor esnd
			         ON esn.StudentNeedDescriptorId =  esnd.StudentNeedDescriptorId
				LEFT JOIN leadata.Descriptor snd
			         ON esnd.StudentNeedDescriptorId = snd.DescriptorId
				LEFT JOIN [integrity].[vw_CountOfOverlappingPrimaryNeedIndicator] fpni
					ON esn.StudentUSI = fpni.StudentUSI
					   AND esn.FiscalYear = fpni.FiscalYear
					   AND esn.ReportingEducationOrganizationID = fpni.ReportingEducationOrganizationID 
		    WHERE  SPEDDM.Executionid = @ExecutionId and SPEDDM.messageid = @MessageId	
			AND esnd.StudentNeedCategoryTypeId = 1
		    ORDER BY ssa.StudentUSI,esn.ReportingEducationOrganizationID, esn.StudentNeedEntryDate                   
END
