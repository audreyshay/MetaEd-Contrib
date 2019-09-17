
/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityELLStudentData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student ELL Program Participation Data for integrity processing  
**               
**Input:
**
**Output:
**	Student ELL Program Participation Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student ELL Program Participation Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/13/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  Sucharita   02/20/2019  Fetching CalendarCode as part of 3.0 changes from 2020 onwards. For previous years, default value for calendar code will be 'Not Applicable'
**  Sucharita   02/26/2019  Removed CalendarCode, we will fetch calendar based on TrackEducationOrganizationId (the way it was happening before)
*************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateELLRuleStudent]
@ExecutionId as int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	 
	  --Get Student ELL Program Participation Data
      SELECT DISTINCT S.StudentUSI,
	         S.StudentUniqueId,
	         S.BirthDate,
			 SSA.SchoolId							 AS 'SchoolID',
			 ELLDM.FiscalYear					     AS 'FiscalYear' ,
			 SSA.TrackEducationOrganizationId        AS 'TrackEducationOrganizationId'			                                                                          
      FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ELLDM
	       INNER JOIN leadata.StudentSchoolAssociation SSA
		         ON SSA.StudentUSI = ELLDM.StudentUSI
				    AND SSA.SchoolId = ELLDM.SchoolId
				--	AND SSA.EntryDate = ELLDM.SchoolEntryDate
					AND SSA.FiscalYear = ELLDM.FiscalYear
					AND ELLDM.IntegrityRuleTypeId = 7   -- Brings only data for STATE ELL Type
      	   INNER JOIN leadata.Student S
		         ON ELLDM.StudentUSI = S.StudentUSI
		   LEFT JOIN leadata.StudentProgramAssociation SPA
                 ON ELLDM.StudentUSI = SPA.StudentUSI
      		        AND ELLDM.SchoolId = SPA.EducationOrganizationId
					AND ELLDM.Fiscalyear = SPA.FiscalYear
			WHERE  ELLDM.Executionid = @ExecutionId and ELLDM.messageid = @MessageId	
		   AND SPA.ProgramTypeId = 1
END
