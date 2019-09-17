CREATE VIEW  [integrity].[StudSchAsso_IsConcurrentOtherThanJTED] 
AS
WITH SSA1
 AS
 ( SELECT SSA.StudentUSI, 
	   SSA.SchoolId,
	   SSA.EntryDate,
	   SSA.ExitWithdrawDate,
	   SSA.FiscalYear,
	   LEA.IsCTE
   FROM leadata.StudentSchoolAssociation SSA
        JOIN entity.School S 
		 ON SSA.FiscalYear = S.FiscalYear
		    AND SSA.SchoolId = S.SchoolId
			AND SSA.MembershipTypeDescriptorId = 11743
		JOIN entity.LocalEducationAgency LEA
		  ON S.FiscalYear = LEA.FiscalYear
		     AND S.LocalEducationAgencyId = LEA.LocalEducationAgencyId
			 AND LEA.IsCTE <>1
  ), SSA2 
     AS (SELECT SSA.StudentUSI, 
				SSA.SchoolId,
				SSA.EntryDate,
				SSA.ExitWithdrawDate,
				SSA.FiscalYear,
				LEA.IsCTE
		 FROM leadata.StudentSchoolAssociation SSA
			  JOIN entity.School S 
			   ON SSA.FiscalYear = S.FiscalYear
			      AND SSA.SchoolId = S.SchoolId
			  JOIN entity.LocalEducationAgency LEA
			    ON S.FiscalYear = LEA.FiscalYear
			       AND S.LocalEducationAgencyId = LEA.LocalEducationAgencyId
				   AND LEA.IsCTE <> 1)
  SELECT SSA1.StudentUSI, 
	   SSA1.SchoolId,
	   SSA1.EntryDate,
	   SSA1.FiscalYear, 
	   CONVERT(BIT,CASE WHEN COUNT(*) >= 1 THEN 1 ELSE 0 END) AS ConcurrentEnrollment_at_otherthanJTED
       FROM SSA1
	   JOIN SSA2
			 ON (SSA2.EntryDate >= SSA1.EntryDate 
				 AND SSA2.EntryDate < ISNULL(SSA1.ExitWithdrawDate,CAST(CAST(SSA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				 OR (SSA1.EntryDate > SSA2.EntryDate 
				 AND  SSA1.EntryDate < ISNULL(SSA2.ExitWithdrawDate,CAST(CAST(SSA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)))
				)
				AND SSA1.StudentUSI = SSA2.StudentUSI
				AND SSA1.SchoolId <> SSA2.SchoolId
				AND SSA1.FiscalYear = SSA2.FiscalYear
GROUP BY SSA1.StudentUSI, SSA1.SchoolId, SSA1.EntryDate, SSA1.FiscalYear