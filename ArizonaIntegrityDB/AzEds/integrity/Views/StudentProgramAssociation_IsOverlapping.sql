/*
** 	04/02/2017	Rchinta	change in the order of joins that match with primary key. 
*/
CREATE VIEW  [integrity].[StudentProgramAssociation_IsOverlapping] 
AS
SELECT SPA1.StudentUSI, 
          SPA1.EducationOrganizationId, 
          SPA1.ProgramTypeId, 
          SPA1.FiscalYear, 
          CONVERT(BIT,CASE WHEN COUNT(SPA2.StudentUSI) > 1 THEN 1 ELSE 0 END) AS IsProgramOverlapping
FROM leadata.StudentProgramAssociation SPA1 (nolock)
       LEFT JOIN leadata.StudentProgramAssociation SPA2 (nolock)
                     ON   SPA1.FiscalYear = SPA2.FiscalYear
						  AND SPA1.StudentUSI = SPA2.StudentUSI
						  AND SPA1.ProgramTypeId = SPA2.ProgramTypeId
						  AND SPA1.ProgramEducationOrganizationId = SPA2.ProgramEducationOrganizationId
						  AND (SPA1.BeginDate <= SPA2.EndDate OR SPA2.EndDate IS NULL)
                          AND (SPA1.EndDate >= SPA2.BeginDate OR SPA1.EndDate IS NULL)                         
                          AND SPA1.EducationOrganizationId = SPA2.EducationOrganizationId 
						  AND(SPA1.ProgramName <> SPA2.ProgramName
						  OR SPA1.BeginDate <> SPA2.BeginDate)                         
GROUP BY SPA1.StudentUSI, SPA1.EducationOrganizationId, SPA1.ProgramTypeId, SPA1.FiscalYear

GO

