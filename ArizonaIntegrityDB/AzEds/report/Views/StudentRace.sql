CREATE VIEW [report].[StudentRace]
AS
	SELECT
		STD.StudentUSI
		, CASE WHEN count(*) > 1 THEN 'MU'		  ELSE  MAX(RT.CodeValue) END AS CodeValue
		, CASE WHEN count(*) > 1 THEN 'Multiple'  ELSE MAX(RT.Description) END AS StudentRace
		--,'Multiple' AS StudentRace
	FROM leadata.Student STD
		  LEFT JOIN leadata.StudentRace SR ON STD.StudentUSI = SR.StudentUSI
			LEFT JOIN leadata.RaceType rt ON SR.RaceTypeId = rt.RaceTypeId
	WHERE SR.RaceTypeId IS NOT NULL
	GROUP BY STD.StudentUSI
GO