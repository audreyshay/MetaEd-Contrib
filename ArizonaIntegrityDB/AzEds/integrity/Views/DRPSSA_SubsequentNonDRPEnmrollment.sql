CREATE VIEW [integrity].[DRPSSA_SubsequentNonDRPEnmrollment]
AS 
SELECT DRP.FiscalYear, 
       DRP.StudentUSI, 
       DRP.SchoolId, 
       DRP.EntryDate, 
       CONVERT(BIT, CASE WHEN COUNT(*) >= 1 THEN 1 ELSE 0 END) AS SubsequentNonDRPEnmrollment30Days 
FROM   (SELECT * 
        FROM   leadata.StudentSchoolAssociation 
        WHERE  MembershipTypeDescriptorId <> 11743														-- 'D' TYPE MEMBERSHIP
		  )SSA 
       INNER JOIN (SELECT *  
                   FROM   leadata.StudentSchoolAssociation 
                   WHERE  MembershipTypeDescriptorId = 11743 
				          AND ExitWithdrawDate IS NOT NULL
				   ) DRP 
               ON SSA.EntryDate <= DATEADD(DAY,30,DRP.ExitWithdrawDate)
			      AND SSA.EntryDate > DRP.EntryDate
				  AND SSA.EntryDate > DRP.ExitWithdrawDate
			      AND SSA.StudentUSI = DRP.StudentUSI 
                  --AND SSA.SchoolId = DRP.SchoolId 
GROUP  BY DRP.StudentUSI, 
          DRP.SchoolId, 
          DRP.EntryDate, 
          DRP.FiscalYear