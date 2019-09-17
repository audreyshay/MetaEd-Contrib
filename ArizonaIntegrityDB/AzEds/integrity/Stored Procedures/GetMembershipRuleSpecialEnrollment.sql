/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleSpecialEnrollment]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SpecialEnrollment for integrity membership rule processing  
**               
**Input:
**
**Output:
**	SpecialEnrollment for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SpecialEnrollment for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	01/05/2015	Initial Creation
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetMembershipRuleSpecialEnrollment]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	     SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.   
	       --- Get Membership SpecialEnrollment Data
			SELECT DISTINCT 
				   ih.StudentUSI, 
			       ih.SchoolId							AS 'SchoolID', 
				   ih.FiscalYear						AS 'FiscalYear', 
				   CAST(ih.SchoolEntryDate AS DATETIME)		AS 'Entrydate', 
				   ssase.SpecialEnrollmentStartDate,
				   ssase.SpecialEnrollmentEndDate,
				   sed.CodeValue						AS 'SpecialEnrollmentDescriptor'
		    FROM   [integrity].[vw_GetIntegrityHistoryPerExecution]  ih
		  	    INNER JOIN leadata.StudentSchoolAssociationSpecialEnrollment ssase 
		  			   ON ssase.FiscalYear = ih.FiscalYear
					  AND ssase.StudentUSI = ih.StudentUSI 
		  			  AND ssase.SchoolId = ih.SchoolId 
		  			  AND ssase.EntryDate = ih.SchoolEntryDate 
		        LEFT JOIN leadata.Descriptor sed 
		  	    	  ON ssase.SpecialEnrollmentDescriptorId = sed.DescriptorId
					  AND ssase.FiscalYear = sed.FiscalYear
			Where ih.Executionid = @executionid and ih.messageid = @messageid	
			And ih.IntegrityRuleTypeId = 1 -- for Membership data only 				
            ORDER BY ih.StudentUSI, ih.SchoolId, ih.FiscalYear, EntryDate, ssase.SpecialEnrollmentStartDate
END