
/*
**	09/21/2016	PSharma	Added FiscalYear to the Join condition
**  09/28/2016  PSharma removed one condition from the join
**  09/29/2016  PSharma changed the select
** 	04/02/2017	Rchinta	change in the order of joins that match with primary key. 
*/
CREATE VIEW  [integrity].[StudentProgramAssociation_IsELLConcurrent] 
AS
SELECT SPA1.StudentUSI, 
	   SPA1.EducationOrganizationId, 
	   SPA1.ProgramTypeId, 
	   SPA1.FiscalYear, 
	   CONVERT(BIT,1) AS IsConcurrentlyEnrolledInEll
FROM leadata.StudentProgramAssociation (nolock) SPA1
	 INNER JOIN leadata.StudentProgramAssociation (nolock) SPA2
			  ON SPA1.FiscalYear = SPA2.FiscalYear
			  AND  SPA1.StudentUSI = SPA2.StudentUSI
			  AND SPA1.ProgramTypeId = SPA2.ProgramTypeId
			  AND (
					  SPA2.BeginDate >= SPA1.BeginDate 					 
					  AND SPA2.BeginDate <= ISNULL(SPA1.EndDate,CAST(CAST(SPA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
					  OR (SPA1.BeginDate >= SPA2.BeginDate 
					  AND  SPA1.BeginDate <= ISNULL(SPA2.EndDate,CAST(CAST(SPA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)))
				  )	
			 AND SPA1.EducationOrganizationId <> SPA2.EducationOrganizationId
WHERE SPA1.ProgramTypeId = 1 
GROUP BY SPA1.StudentUSI, SPA1.EducationOrganizationId, SPA1.ProgramTypeId, SPA1.FiscalYear
