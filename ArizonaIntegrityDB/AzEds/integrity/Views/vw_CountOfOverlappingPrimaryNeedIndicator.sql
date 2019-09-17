/**************************************************************************
** Script Name:[vw_CountOfOverlappingPrimaryNeedIndicator]
** 
**
** Author: PSharma
** 
**
** Description: This view is used by two SPEDProgramAssociation for State and FED SPED
**	It returns the count of other need which are ovelapping with a FedralPrimaryNeedIndicator set to true
**
**
** 
** 
**
**  Revision History: Created - PSharma 10/10/2016
**	PSharma	11/22/2016 Added the Need category filter to the second table in join. Without that it was puuling the othercategories also.
**  PSharma 12/8/2016 Uncommented SN1.PrimaryStudentNeedIndicator = 1. It was probably commented by mistake
**************************************************************************/

CREATE VIEW [integrity].[vw_CountOfOverlappingPrimaryNeedIndicator] 
AS
	SELECT sn1.studentusi,sn1.ReportingEducationOrganizationID,sn1.FiscalYear,COUNT(*) as OverlappingPrimaryNeedCount
		FROM leadata.StudentNeed SN1
			INNER JOIN leadata.StudentNeed SN2
				ON (SN2.SourceId <> SN1.SourceId
					AND SN2.StudentNeedEntryDate >= SN1.StudentNeedEntryDate 
					AND  SN2.StudentNeedEntryDate <= ISNULL(SN1.StudentNeedExitDate,CAST(CAST(sn1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				)
			        AND  SN1.StudentUSI = SN2.StudentUSI
					AND  SN1.FiscalYear = SN2.FiscalYear
					AND  SN1.PrimaryStudentNeedIndicator = 1
					AND  SN2.PrimaryStudentNeedIndicator = 1
				    AND  SN1.ReportingEducationOrganizationID = SN2.ReportingEducationOrganizationID
			INNER JOIN leadata.StudentNeedDescriptor SND
				ON SN1.StudentNeedDescriptorId = SND.StudentNeedDescriptorId
					AND SND.StudentNeedCategoryTypeId = 1
			INNER JOIN leadata.StudentNeedDescriptor SND2
				ON SN2.StudentNeedDescriptorId = SND2.StudentNeedDescriptorId
					AND SND2.StudentNeedCategoryTypeId = 1
		Group By sn1.studentusi,sn1.ReportingEducationOrganizationID,sn1.FiscalYear
GO


