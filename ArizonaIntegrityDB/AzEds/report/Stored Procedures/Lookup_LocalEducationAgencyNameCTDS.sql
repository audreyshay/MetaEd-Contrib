
/*****************************************************************
**Procedure Name:
**      report.Lookup_LocalEducationAgencyNameCTDS
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Lookup EdOrg name and CTDS by @LocalEducationAgencyId
**    
**Input:
**  @LocalEducationAgencyId - Id of LEA 
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from all the reports
**
**Revision History:
**	P Kanyar		02/23/2016	Initial Creation
**
******************************************************************/
CREATE PROC [report].[Lookup_LocalEducationAgencyNameCTDS]
	@LocalEducationAgencyId int,
	@FiscalYear int

AS
BEGIN

SET NOCOUNT ON;

	SELECT DISTINCT
		LocalEducationAgencyName + ' (' + CONVERT(nvarchar(20),LocalEducationAgencyId) + ')' AS LocalEducationAgencyName,
		SUBSTRING(LTRIM(LocalEducationAgencyCTDS), 1, 2) + '-' + SUBSTRING(LTRIM(LocalEducationAgencyCTDS), 3, 2) + '-' + SUBSTRING(LTRIM(LocalEducationAgencyCTDS), 5, 2) + '-' + SUBSTRING(LTRIM(LocalEducationAgencyCTDS), 7, 3) AS LocalEducationAgencyCTDS
	FROM
		[entity].[vw_LocalEducationAgency]  
	WHERE 
		FiscalYear = @FiscalYear 
			AND LocalEducationAgencyId = @LocalEducationAgencyId

    RETURN(@@ERROR)
END

/*End Lookup_LocalEducationAgencyNameCTDS*/
