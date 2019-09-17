/********************************************************************************************************
**Procedure Name:
**      integrity.GetSupportProgramStudentRaceData
**
**Author:
**      PSharma
**
**Description:  
**	Get Student Support Program Information Data for integrity processing  
**               
**Input:
**
**Output:
**	Student Support Program Information Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student Support Program Data for integrity processing  
**
**Revision History:
**	Who					When		What
**	PSharma				09/10/2016	Initial Creation
**  Sucharita           03/01/2019  Removed join with Student Table and added join on EducationOrganizationId
**                                  and IntegrityRuleTypeId =14 with StudentRace table.
**  Sucharita           04/23/2019  Removed join on EducationOrganizationId
**********************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetSupportProgramStudentRaceData]
	@ExecutionId int,
	@MessageId as [nvarchar](36)
AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

BEGIN 
	--Get Student Support Program Data
	SELECT DISTINCT 
		SPEDDM.StudentUSI,
		SR.RaceTypeId				AS RACE                                            
	FROM  
		[integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM		
		JOIN leadata.StudentRace SR ON
			(  SPEDDM.StudentUSI = SR.StudentUSI			   
			   AND SPEDDM.IntegrityRuleTypeId =14   ------------------------Brings only data for Support Program 
			)
	WHERE  
		SPEDDM.Executionid = @ExecutionId AND 
		SPEDDM.messageid = @MessageId	
END

