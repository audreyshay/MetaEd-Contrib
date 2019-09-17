/*************************************************************
**Procedure Name:
**      integrity.GetDRPRuleStudent
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student Data for DRP integrity processing  
**               
**Input:
**
**Output:
**	Student Data for DRP integrity processing  
**
**Returns:
**
**Implementation:
**	Used to get Student Data for DRP integrity processing   
**
**Revision History:
**	Who				When		What
**	Amit Verma		07/29/2016	Initial Creation
**	Rohith			08/03/2016  Adding SchoolID
**  Sucharita       02/25/2019  Removed extra join with CountryCodeType and StateAbbreviationType table.
**                              Removed FirstName and LastNmae fields.
************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetDRPRuleStudent]
@ExecutionId INT,
@MessageId NVARCHAR(36)
AS
BEGIN 

      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock but at SP level.
	 
	  --Get Student Data for DRP integrity processing 
      SELECT DISTINCT 
			 S.StudentUSI,			 
	         S.BirthDate					AS 'DateOfBirth',			
			 DRP.SchoolID
      FROM  integrity.vw_GetIntegrityHistoryPerExecution DRP
			JOIN leadata.Student S
		      ON DRP.StudentUSI = S.StudentUSI 
			     AND DRP.IntegrityRuleTypeId = 4			-- DRP Integrity Type
			JOIN leadata.StudentProgramAssociation SPA
              ON DRP.StudentUSI = SPA.StudentUSI
      		     AND DRP.SchoolId = SPA.EducationOrganizationId
				 AND DRP.Fiscalyear = SPA.FiscalYear			
	  WHERE DRP.Executionid = @ExecutionId 
			AND DRP.messageid = @MessageId	
		    AND SPA.ProgramTypeId = 61						-- DRP Program type

END
