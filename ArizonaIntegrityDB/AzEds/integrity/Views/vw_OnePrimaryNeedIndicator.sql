/**************************************************************************
** Script Name:[vw_OnePrimaryNeedIndicator]
** 
**
** Author: PSharma
** 
**
** Description: This view is used by two SPEDProgramAssociation for State and FED SPED
**	It returns a record if a need has one primary need indicator during the time frame of need
**
** Revision History: Created - PSharma 12/13/2016
** PSharma 12/15/2016 Added one more date condition to handle the dates which are apart
** PSharma 12/15/2016 Handle NULL for PrimaryNeedIndicator as it can be can be NULL
****************************************************************************************************************************************/

CREATE VIEW [integrity].[vw_OnePrimaryNeedIndicator] 
AS

	SELECT sn1.studentusi,sn1.ReportingEducationOrganizationID,sn1.FiscalYear,sn1.StudentNeedDescriptorId,sn1.StudentNeedEntryDate,sn1.PrimaryStudentNeedIndicator,cast(1 as bit) as OnePrimaryNeed
		FROM leadata.StudentNeed SN1
			INNER JOIN leadata.StudentNeed SN2
				ON (SN2.SourceId <> SN1.SourceId
					AND 
					(SN2.StudentNeedEntryDate >= SN1.StudentNeedEntryDate AND  SN2.StudentNeedEntryDate <= ISNULL(SN1.StudentNeedExitDate,CAST(CAST(sn1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)))
					  OR
					(SN1.StudentNeedEntryDate >= SN2.StudentNeedEntryDate AND  SN1.StudentNeedEntryDate <= ISNULL(SN2.StudentNeedExitDate,CAST(CAST(sn2.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)))
				)
			        AND  SN1.StudentUSI = SN2.StudentUSI
					AND  SN1.FiscalYear = SN2.FiscalYear
					AND  ISNULL(SN1.PrimaryStudentNeedIndicator,0) <> ISNULL(SN2.PrimaryStudentNeedIndicator,0)
				    AND  SN1.ReportingEducationOrganizationID = SN2.ReportingEducationOrganizationID
			INNER JOIN leadata.StudentNeedDescriptor SND
				ON SN1.StudentNeedDescriptorId = SND.StudentNeedDescriptorId
					AND SND.StudentNeedCategoryTypeId = 1
			INNER JOIN leadata.StudentNeedDescriptor SND2
				ON SN2.StudentNeedDescriptorId = SND2.StudentNeedDescriptorId
					AND SND2.StudentNeedCategoryTypeId = 1
		Group By sn1.studentusi,sn1.ReportingEducationOrganizationID,sn1.FiscalYear,sn1.StudentNeedDescriptorId,sn1.StudentNeedEntryDate,sn1.PrimaryStudentNeedIndicator