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
**  Sucharita   12/02/2016  Added IntgrityRuleTypeId 15 to bring data for Accountability NonPayment (Task# 168956)
********************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetACCTRuleTutionPayer]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	       --- Get Membership TutionPayer Data
			SELECT DISTINCT 
				   ih.StudentUSI, 
			       ih.SchoolId							AS 'SchoolID', 
				   ih.FiscalYear						AS 'FiscalYear', 
				   CAST(ih.SchoolEntryDate AS DATETIME)		AS 'Entrydate', 
				   ssat.PayerStartDate,
				   ssat.PayerEndDate,
				   d.CodeValue							AS 'PayerDescriptor'
		    FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih	 				
		  	    INNER JOIN leadata.StudentSchoolAssociationTuitionPayer ssat 
					 ON ssat.FiscalYear = ih.FiscalYear 
					AND ssat.StudentUSI = ih.StudentUSI 
					AND ssat.SchoolId = ih.SchoolId 
					AND ssat.EntryDate = ih.SchoolEntryDate
                LEFT JOIN leadata.Descriptor d
				     ON ssat.TuitionPayerDescriptorId = d.DescriptorId
					AND ssat.FiscalYear = d.FiscalYear
					Where ih.Executionid = @executionid and ih.messageid = @messageid	
			AND ih.IntegrityRuleTypeId in (3,15)  -- Bring data only for Accountability	and Accountability Non-Payment
           ORDER BY ih.StudentUSI, ih.SchoolId, ih.FiscalYear, EntryDate, ssat.PayerStartDate                    
END