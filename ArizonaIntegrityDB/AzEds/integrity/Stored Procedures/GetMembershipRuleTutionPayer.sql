/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleTutionPayer]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get TutionPayerCollection for integrity membership rule processing  
**               
**Input:
**
**Output:
**	TutionPayerCollection for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get TutionPayerData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	01/05/2015	Initial Creation
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetMembershipRuleTutionPayer]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	       --- Get Membership TutionPayer Data
			SELECT DISTINCT 
				   ssa.StudentUSI, 
			       ssa.SchoolId							AS 'SchoolID', 
				   ssa.FiscalYear						AS 'FiscalYear', 
				   CAST(ssa.EntryDate AS DATETIME)		AS 'Entrydate', 
				   ssat.PayerStartDate,
				   ssat.PayerEndDate,
				   d.CodeValue							AS 'PayerDescriptor'
		    FROM [integrity].[vw_GetIntegrityHistoryPerExecution]  ih  
				INNER JOIN leadata.StudentSchoolAssociation ssa 
  					 ON ssa.FiscalYear = ih.FiscalYear 
					AND ssa.StudentUSI = ih.StudentUSI
					AND ssa.SchoolId = ih.SchoolId
					AND ssa.EntryDate = ih.SchoolEntryDate	
					AND ih.IntegrityRuleTypeId = 1 -- for Membership data only 				
		  	    INNER JOIN leadata.StudentSchoolAssociationTuitionPayer ssat 
					 ON ssat.FiscalYear = ssa.FiscalYear 
					AND ssat.StudentUSI = ssa.StudentUSI 
					AND ssat.SchoolId = ssa.SchoolId 
					AND ssat.EntryDate = ssa.EntryDate
                LEFT JOIN leadata.Descriptor d
				     ON ssat.TuitionPayerDescriptorId = d.DescriptorId
					AND ssat.FiscalYear = d.FiscalYear
				Where ih.Executionid = @executionid and ih.messageid = @messageid	
           ORDER BY ssa.StudentUSI, ssa.SchoolId, ssa.FiscalYear, EntryDate, ssat.PayerStartDate                    
END