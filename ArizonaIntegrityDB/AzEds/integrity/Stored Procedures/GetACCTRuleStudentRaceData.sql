/********************************************************************************************************
**Procedure Name:
**      integrity.GetACCTRuleStudentRaceData
**
**Author:
**      SMahapatra
**
**Description:  
**	Get Student Accountability Information Data for integrity processing  
**               
**Input:
**
**Output:
**	Student Accountability Information Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student Accountability Data for integrity processing  
**
**Revision History:
**	Who					When		What
**	Sucharita			01/17/2017	Initial Creation
**  Sucharita           02/08/2019  Removed join with Student table and added join on EducationOrganizationId 
**  Sucharita           04/23/2019  Removed join on EducationOrganizationId
*********************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRuleStudentRaceData]
	@ExecutionId int,
	@MessageId as [nvarchar](36)
AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

BEGIN 
	--Student Accountability Information Data
	SELECT DISTINCT 
		ih.StudentUSI,
		SR.RaceTypeId				AS StudentRace                                            
	FROM  
	    [integrity].[vw_GetIntegrityHistoryPerExecution] ih
		 inner join  leadata.StudentRace SR ON
		            ih.StudentUSI = SR.StudentUSI			       
			        AND ih.IntegrityRuleTypeId in (3,15)  -- Bring data only for Accountability and Accountability Non-Payment					
	WHERE  
		ih.Executionid = @ExecutionId AND 
		ih.messageid = @MessageId	
END