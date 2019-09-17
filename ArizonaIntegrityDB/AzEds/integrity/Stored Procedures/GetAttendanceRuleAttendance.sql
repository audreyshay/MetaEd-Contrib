/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityAttendanceData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Attendance for integrity processing  
**               
**Input:
**
**Output:
**	Attendance for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Attendance for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/01/2015	Initial Creation
**	Rohith		08/04/2015	modifying the tables used in joins and making sure they still work the same as old procedures
**	Rohith		10/22/2015 commentiing join condition on school entry date as for attendance the Schoolentry date will be null in IntegrityNeed table
** ROhith		5/9/2019	changing the order of joins, plus including @fiscalyear when joining against descriptor table
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetAttendanceRuleAttendance]
@ExecutionId INT,
@MessageId as [nvarchar](36)
AS
BEGIN 


      SET NOCOUNT ON;    		    
	 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	  --Get FiscalYear for a given ExecutionId
			DECLARE @FiscalYear INT

			SELECT @FiscalYear = FiscalYear
			FROM process.Execution
			WHERE ExecutionId = @ExecutionId

	       --- Get Attendance Data 
			 SELECT DISTINCT ssa.StudentUSI, 
			        ssa.SchoolId						AS 'SchoolID',
				    ADM.FiscalYear						AS 'FiscalYear',
					ssae.EventDate						AS 'AttendanceEventDate',
				    ssae.InstructionalMinutes,
					aecd.CodeValue							AS 'AttendanceType',
					aad.CodeValue							AS 'AbsenceAmount'
             FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] ADM
		     INNER JOIN leadata.StudentSchoolAssociation ssa 
			      ON ssa.StudentUSI = ADM.StudentUSI
					 AND ssa.SchoolId = ADM.SchoolId
					-- AND ssa.EntryDate = ADM.SchoolEntryDate 
					 AND ssa.FiscalYear = ADM.FiscalYear
					 AND ADM.IntegrityRuleTypeId = 2  -- for Attendance data only 
			 INNER JOIN leadata.StudentSchoolAttendanceEvent ssae 
		  		  ON ssae.FiscalYear =  ADM.FiscalYear
					 AND ssae.StudentUSI = ssa.StudentUSI 
		  			 AND ssae.SchoolId = ssa.SchoolId 		  			
			 INNER JOIN leadata.Descriptor aecd
			      ON aecd.FiscalYear = ssae.FiscalYear and aecd.DescriptorId = ssae.AttendanceEventCategoryDescriptorId and aecd.FiscalYear = @FiscalYear
			 LEFT JOIN leadata.descriptor aad 
		  		  ON aad.FiscalYear = ssae.FiscalYear and ssae.AbsenceAmountDescriptorId = aad.DescriptorId and aad.FiscalYear = @FiscalYear
				  Where adm.Executionid = @executionid and adm.messageid = @messageid	
		     --LEFT JOIN leadata.Descriptor attdes   -- you dont need this join anymore as we have already joined to descriptor in the above line
		  		 -- ON aad.AbsenceAmountDescriptorId = attdes.DescriptorId 
			 ORDER BY ssa.StudentUSI, SchoolId, EventDate
END
GO


