/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleDOR]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get DOR Data for integrity membership rule processing  
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
**	Amit Verma			01/05/2015	Initial Creation
**  Sucharita Mahapatra	07/27/2016  Added ResponsibilityDescriptorId to the select statement
**  PSharma				09/29/2016  Changed entity.LocalEducationAgency to entity.vw_LocalEducationAgency AND IsActive flag
**  Amit Verma			04/21/2017	Changed the SP to Check the logic for FY2018
**  Britto Augustine	05/01/2017	Added additional EntryDate column to get from StudentEducationOrganizationAssociation so we can match 
**									the DOR records to Enrollment records on the .net side properly
** Rohith Chintamaneni	05/09/2019	Adding FiscalYear = @fiscalyear to entity.vw_LocalEducationAgency DOR 
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetMembershipRuleDOR]
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
						   IH.StudentUSI, 
					       IH.SchoolId																	AS 'SchoolID', 
						   SEOA.EducationOrganizationId													AS 'DOR_LocalEducationAgencyID',						   
						   DOR.LocalEducationAgencyCTDS													AS 'DORCTDS',
						   DOR.LocalEducationAgencyCategoryCode											AS 'DistrictOfResidenceType', 
						   DOR.SectorTypeCode															AS 'DORSectorType',
						   SEOA.StartDate                                                               AS 'DORStartDate',
						   SEOA.EndDate                                                                 AS 'DOREndDate',
						   SEOA.EntryDate                                                               AS 'SchoolEntryDate',
						   (CASE WHEN DOR.IsOutOfState = 1 THEN 1 ELSE 0 END)							AS 'IsOutOfState',
						   (CASE WHEN DOR.IsCTE = 1 THEN 1 ELSE 0 END)									AS 'IsJTED',
						   (CASE WHEN DOR.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)				AS 'IsAccommodationDistrict' ,
						   (CASE WHEN DOR.IsSecureCare = 1 THEN 1 ELSE 0 END)							AS 'IsSecureCare',
						   (CASE WHEN DOR.IsExceptional = 1 THEN 1 ELSE 0 END)							AS 'IsExceptional',
						   (CASE WHEN DOR.IsHeadStart = 1 THEN 1 ELSE 0 END)							AS 'IsHeadStart',
						   (CASE WHEN DOR.IsValidForDOR = 1 THEN 1 ELSE 0 END)							AS 'IsValidForDOR',
					       (CASE WHEN DOR.IsTransportation = 1 THEN 1 ELSE 0 END)						AS 'IsTransportation',
						   (CASE WHEN DOR.IsElementaryNotInHighSchool = 1 THEN 1 ELSE 0 END)			AS 'ElementaryNotInHighSchool',
						   (CASE WHEN DOR.OperationalStatusTypeId = 1 THEN 1 ELSE 0 END)				AS 'IsActive',
						   SEOA.ResponsibilityDescriptorId                                              AS 'ResponsibilityDescriptorId'
					FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] IH
						   INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA 
		  				      ON SEOA.SchoolId = IH.SchoolId 
		  						 AND SEOA.StudentUSI = IH.StudentUSI
								 AND SEOA.FiscalYear = IH.FiscalYear  
						   INNER JOIN entity.vw_LocalEducationAgency DOR 
		  				      ON DOR.LocalEducationAgencyId = SEOA.EducationOrganizationId 
							     AND DOR.FiscalYear = SEOA.FiscalYear and DOR.FiscalYear = @FiscalYear
					WHERE IH.Executionid = @ExecutionId 
						  AND IH.messageid = @MessageId	
						  AND IH.IntegrityRuleTypeId = 1 -- for Membership data only 	
					ORDER BY IH.StudentUSI, IH.SchoolId, SEOA.StartDate
				END
			ELSE 
				BEGIN
					SELECT DISTINCT 
						   IH.StudentUSI, 
					       IH.SchoolId																	AS 'SchoolID', 
						   SEOA.EducationOrganizationId													AS 'DOR_LocalEducationAgencyID',
						   DOR.LocalEducationAgencyCTDS													AS 'DORCTDS',
						   DOR.LocalEducationAgencyCategoryCode											AS 'DistrictOfResidenceType', 
						   DOR.SectorTypeCode															AS 'DORSectorType',
						   SEOA.StartDate                                                               AS 'DORStartDate',
						   SEOA.EndDate                                                                 AS 'DOREndDate',
						   SEOA.EntryDate                                                               AS 'SchoolEntryDate',
						   (CASE WHEN DOR.IsOutOfState = 1 THEN 1 ELSE 0 END)							AS 'IsOutOfState',
						   (CASE WHEN DOR.IsCTE = 1 THEN 1 ELSE 0 END)									AS 'IsJTED',
						   (CASE WHEN DOR.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)				AS 'IsAccommodationDistrict' ,
						   (CASE WHEN DOR.IsSecureCare = 1 THEN 1 ELSE 0 END)							AS 'IsSecureCare',
						   (CASE WHEN DOR.IsExceptional = 1 THEN 1 ELSE 0 END)							AS 'IsExceptional',
						   (CASE WHEN DOR.IsHeadStart = 1 THEN 1 ELSE 0 END)							AS 'IsHeadStart',
						   (CASE WHEN DOR.IsValidForDOR = 1 THEN 1 ELSE 0 END)							AS 'IsValidForDOR',
					       (CASE WHEN DOR.IsTransportation = 1 THEN 1 ELSE 0 END)						AS 'IsTransportation',
						   (CASE WHEN DOR.IsElementaryNotInHighSchool = 1 THEN 1 ELSE 0 END)			AS 'ElementaryNotInHighSchool',
						   (CASE WHEN DOR.OperationalStatusTypeId = 1 THEN 1 ELSE 0 END)				AS 'IsActive',
						   SEOA.ResponsibilityDescriptorId                                              AS 'ResponsibilityDescriptorId'
					FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] IH
						   INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA 
		  				      ON SEOA.SchoolId = IH.SchoolId 
		  						 AND SEOA.StudentUSI = IH.StudentUSI
								 AND SEOA.FiscalYear = IH.FiscalYear  
								 AND SEOA.EntryDate = IH.SchoolEntryDate  -- 1:1 relationship for SchoolSchoolAssociationLocalEducationAgency with StudentSchoolAssociation for AzEDS 3.0
						   INNER JOIN entity.vw_LocalEducationAgency DOR 
		  				      ON DOR.LocalEducationAgencyId = SEOA.EducationOrganizationId 
							     AND DOR.FiscalYear = SEOA.FiscalYear and DOR.FiscalYear = @FiscalYear
					WHERE IH.Executionid = @ExecutionId 
						  AND IH.messageid = @MessageId	
						  AND IH.IntegrityRuleTypeId = 1 -- for Membership data only 	
					ORDER BY IH.StudentUSI, IH.SchoolId, SEOA.StartDate
				END

END