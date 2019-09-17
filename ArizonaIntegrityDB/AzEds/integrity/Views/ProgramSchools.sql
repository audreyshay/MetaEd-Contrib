	create view integrity.ProgramSchools
	AS
	SELECT DISTINCT elea.SchoolId
		    FROM leadata.StudentProgramAssociation spa
			  INNER JOIN entity.School elea
			      on spa.EducationOrganizationId = elea.SchoolId