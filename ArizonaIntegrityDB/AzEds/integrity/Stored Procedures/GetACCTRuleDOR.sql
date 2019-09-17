/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetACCTRuleDOR]
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**	Get DOR Data for integrity Accountability rule processing  
**               
**Input:
**
**Output:
**	DOR Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get MembershipDORData for integrity processing  
**
**Revision History:
**	Who					When		What
**	P Kanyar			06/29/2017	Initial Creation
**	P Kanyar			07/10/2017	Added DORStartDate & DOREndDate
**	P Kanyar			07/11/2017	Added SchoolEntryDate for C# code
**
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRuleDOR]
	@ExecutionId AS INT,
	@MessageId AS [NVARCHAR](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	       
		    --Get FiscalYear for a given ExecutionId
			DECLARE @FiscalYear INT
			SELECT @FiscalYear = FiscalYear
			FROM process.Execution
			WHERE ExecutionId = @ExecutionId
			
			IF @FiscalYear < 2018
				BEGIN 
					SELECT DISTINCT 
						   ih.StudentUSI, 
					       ih.SchoolId						AS 'SchoolID', 
						   ih.SchoolEntryDate				AS 'SchoolEntryDate',
						   seoa.EducationOrganizationId		AS 'DOR_LocalEducationAgencyID',		
						   seoa.StartDate					AS 'DORStartDate',
						   seoa.EndDate						AS 'DOREndDate'						   				   
					FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] ih

						   INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency seoa 
		  				      ON seoa.SchoolId = ih.SchoolId 
		  						 AND seoa.StudentUSI = ih.StudentUSI
								 AND seoa.FiscalYear = ih.FiscalYear  

						   INNER JOIN entity.vw_LocalEducationAgency dor 
		  				      ON dor.LocalEducationAgencyId = seoa.EducationOrganizationId 
							     AND dor.FiscalYear = seoa.FiscalYear						  
					WHERE ih.Executionid = @ExecutionId 
						  AND ih.messageid = @MessageId	
						  AND ih.IntegrityRuleTypeId IN (3,15)							 	
					ORDER BY ih.StudentUSI, ih.SchoolId, seoa.StartDate
				END
			ELSE 
				BEGIN
				SELECT DISTINCT 
						   ih.StudentUSI, 
					       ih.SchoolId						AS 'SchoolID', 
						   ih.SchoolEntryDate				AS 'SchoolEntryDate',
						   seoa.EducationOrganizationId		AS 'DOR_LocalEducationAgencyID',
						   seoa.StartDate					AS 'DORStartDate',
						   seoa.EndDate						AS 'DOREndDate'								   	
					FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] ih

						   INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency seoa 
		  				      ON seoa.SchoolId = ih.SchoolId 
		  						 AND seoa.StudentUSI = ih.StudentUSI
								 AND seoa.FiscalYear = ih.FiscalYear 
								 AND seoa.EntryDate = ih.SchoolEntryDate				-- 1:1 relationship for SchoolSchoolAssociationLocalEducationAgency with StudentSchoolAssociation for AzEDS 3.0
						   
						   INNER JOIN entity.vw_LocalEducationAgency dor 
		  				      ON dor.LocalEducationAgencyId = seoa.EducationOrganizationId 
							     AND dor.FiscalYear = seoa.FiscalYear	
					WHERE ih.Executionid = @ExecutionId 
						  AND ih.messageid = @MessageId	
						  AND ih.IntegrityRuleTypeId IN (3,15)							-- Bring data only for Accountability	and Accountability Non-Payment 	
					ORDER BY ih.StudentUSI, ih.SchoolId, seoa.StartDate
				END
END