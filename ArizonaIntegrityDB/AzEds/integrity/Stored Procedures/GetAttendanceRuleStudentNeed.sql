/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityAttendanceStudentNeedData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Attendance StudentNeedData for integrity processing  
**               
**Input:
**
**Output:
**	Attendance StudentNeedData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Attendance StudentNeedData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/01/2015	Initial Creation
**	Rohith		10/22/2015 commentiing join condition on school entry date as for attendance the Schoolentry date will be null in IntegrityNeed table
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetAttendanceRuleStudentNeed]
@ExecutionId INT,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	     
	      --- Get Student Need Data
			SELECT DISTINCT ssa.StudentUSI, 
			       ssa.SchoolId							AS 'SchoolID', 
				   ISNull(ssa.FiscalYear,ADM.FiscalYear)   AS 'FiscalYear', 
				   CAST(ssa.EntryDate AS DATETIME)		AS 'Entrydate', 
				   esn.StudentNeedEntryDate,
				   esn.StudentNeedExitDate,
				   snd.CodeValue						AS 'StudentNeedDescriptor'
			FROM   leadata.StudentSchoolAssociation ssa 
			    INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] ADM
			         ON ssa.StudentUSI = ADM.StudentUSI
					    AND ssa.SchoolId = ADM.SchoolId
					    --AND ssa.EntryDate = ADM.SchoolEntryDate 
						AND ssa.FiscalYear = ADm.FiscalYear
						AND ADM.IntegrityRuleTypeId = 2  -- for Attendance data only 
		  	    INNER JOIN leadata.StudentNeed esn
			         ON ssa.StudentUSI = esn.StudentUSI
				        AND ssa.SchoolId = esn.ReportingEducationOrganizationID
						 AND ssa.FiscalYear = esn.FiscalYear
                LEFT JOIN leadata.StudentNeedDescriptor esnd
			         ON esn.StudentNeedDescriptorId =  esnd.StudentNeedDescriptorId					
				LEFT JOIN leadata.Descriptor snd
			         ON esnd.StudentNeedDescriptorId = snd.DescriptorId
					 and snd.FiscalYear = ssa.FiscalYear
			Where ADM.Executionid = @executionid and ADM.messageid = @messageid						 
			and esn.StudentNeedDescriptorId = 10283
		    ORDER BY ssa.StudentUSI, ssa.SchoolId, EntryDate, esn.StudentNeedEntryDate                   
END
GO


