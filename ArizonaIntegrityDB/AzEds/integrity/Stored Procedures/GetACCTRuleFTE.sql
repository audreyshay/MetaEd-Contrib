/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleFTE]
**
**Author:
**      Rohith
**
**Description:  
**	Get MembershipFTEData for integrity membership rule processing  
**               
**Input:
**
**Output:
**	MembershipFTEData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get MembershipFTEData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Rohith	07/30/2015	Initial Creation
** Sucharita  12/02/2016  Added IntgrityRuleTypeId 15 to bring data for Accountability NonPayment (Task# 168956)
******************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetACCTRuleFTE]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	    --- Get Membership FTE Data
		SELECT DISTINCT
				ih.StudentUSI, 
				ih.SchoolId					    AS 'SchoolID', 
				ih.FiscalYear						AS 'FiscalYear', 
				CAST(ih.SchoolEntryDate AS DATETIME)		AS 'Entrydate', 
				ssamfte.FTEStartDate, 
				ssamfte.FTEEndDate, 
				mdes.CodeValue						AS 'FTEMembership'
		FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih	
		JOIN leadata.StudentSchoolAssociationMembershipFTE as ssamfte 
			ON ssamfte.FiscalYear = ih.FiscalYear
			AND ssamfte.StudentUSI = ih.StudentUSI 
			AND ssamfte.SchoolId = ih.SchoolId 
			AND ssamfte.EntryDate = ih.SchoolEntryDate 
		LEFT JOIN leadata.Descriptor as mdes 
			ON mdes.DescriptorId = ssamfte.MembershipFTEDescriptorId 
			AND mdes.FiscalYear = ssamfte.FiscalYear
			Where ih.Executionid = @executionid and ih.messageid = @messageid	
			And ih.IntegrityRuleTypeId in (3,15)  -- Bring data only for Accountability	and Accountability Non-Payment
		ORDER BY ih.StudentUSI, ih.SchoolId, ih.FiscalYear, EntryDate, ssamfte.FTEStartDate
END