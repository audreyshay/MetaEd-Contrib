/**********************************************************************************
**Procedure Name:
**      [report].[GetReportStudentAbsenceList]
**
**Author:
**		Pratibha Kanyar 
**
**Description:  
**	Get Student School Associations and its SubmittedBy, DOA and DOR LEA Id,
**  and Absence data to implement report FERPA security
**            
**Input:
**	@ReportLEAId   - LEAId the report is executed for
**	@ReportLEAType - Unspecified 0, DOA 1, DOR 2 report types
**	@SchoolsList   - School(s) the report is executed for
**	@FiscalYear	   - FiscalYear to filter upon
**
**Returns:
**
**Implementation:
**	Used by Excessive Absence Report stored proc in AzEDS db
** 
**Revision History:
**	Who					When		What
**	P Kanyar			11/02/2015	Initial Creation (Renamed GetReportStudentAttendanceList)
**	P Kanyar			12/08/2015	Added TrackEdOrgId,TrackNumber,FiscalYear to the result set
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**	Amit Verma			05/17/2017  Added the fiscal year logic to check for DOR
**	P Kanyar			01/24/2018	Added join with @SchoolsList inside cteStudentEducationOrganization queries
---------------------------------------------------------------------------------------------------------
**	P Kanyar			03/04/2019	Modified for AZEDS 5.0 changes- DOR recordownershiptypeid from FY2020 has changed to 1, DOR table has changed to ssalea,
**									added CalendarCode to the resultset
*****************************************************************************************************************************************************/
-- The stored proc is bringing both excused and unexcused absence eventdates and not any in-attendance
-- The Absence date is not checked/ filtered to be within the school enrollment date

--declare @SchoolsList as nvarchar(max)= '4517,4711,4710',	@ReportLEAId  as int = 4153,	@ReportLEAType as int = 2,	@FiscalYear as int =2019 				--Unspecified 0, DOA 1, DOR 2

CREATE PROCEDURE [report].[GetReportStudentAbsenceList]  
    @SchoolsList as nvarchar(max),
	@ReportLEAId  as int ,
	@ReportLEAType as int,				--Unspecified 0, DOA 1, DOR 2
	@FiscalYear as int 

AS
BEGIN 

    SET NOCOUNT ON;

	IF @ReportLEAType IN (0, 1)
	BEGIN	
		IF @FiscalYear <2018
			BEGIN
	
				--cte to bring StudentEdOrgs submitted by the LEA requesting the report, so we can					
				--join with that below even though the student ed org dates are outside the student school		
				--association date ranges
				;WITH cteStudentSchoolAssociationLEA AS
				(
					SELECT 
						ssalea.StudentUSI, 
						ssalea.EducationOrganizationId,
						ssalea.SchoolId,
						ssalea.StartDate,
						ssalea.FiscalYear,
						ssalea.SourceId
					FROM 
						[leadata].[StudentSchoolAssociationLocalEducationAgency] ssalea
							INNER JOIN
						[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssalea.SchoolId			-- ADDED 1/19/2018
								AND ssalea.FiscalYear = @FiscalYear
							INNER JOIN 
						leadata.RecordOwnership seoro ON seoro.FiscalYear = ssalea.FiscalYear   
								AND seoro.ResourceId = ssalea.SourceId
								AND seoro.RecordOwnershipTypeId = 7									--student DOR
							INNER JOIN 
						entity.School sch ON sch.SchoolId = ssalea.SchoolId
								AND sch.FiscalYear = ssalea.FiscalYear	
					WHERE (seoro.SubmittedByEducationOrganizationId = @ReportLEAId OR sch.LocalEducationAgencyId = @ReportLEAId )
				) 


				SELECT DISTINCT
					s.StudentUSI, 
					s.StudentUniqueId,
					s.FirstName,
					s.LastSurname,
					s.MiddleName,
					s.BirthDate,	
					ssa.SchoolId, 
	 				ssa.EntryDate, 
					ssa.ExitWithdrawDate,
					ssa.EntryGradeLevelDescriptorId,
					ssa.TrackEducationOrganizationId,
					ssa.TrackNumber,
					ssa.CalendarCode,
					ssa.FiscalYear,
					ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
					ssaero.SubmittedByEducationOrganizationId	AS SSAESubmittedByEducationOrganizationId,
					sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
					ssalea.EducationOrganizationId				AS DORLocalEducationAgencyId,
					ssalea.StartDate							AS DORStartDate,
					ssa.SourceId								AS SSAResourceId,
					ssae.SourceId								AS SSAEResourceId,
					ssalea.SourceId								AS SEOResourceId,
					ssae.EventDate								AS AbsenceAttendanceDate,
					ssae.InstructionalMinutes					AS AttendanceMinutes,
					ad.CodeValue								AS AbsenceAmount,
					ssae.AttendanceEventCategoryDescriptorId
				FROM 
					leadata.StudentSchoolAssociation ssa
						INNER JOIN 
					[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssa.SchoolId			-- updated 1/19/2018
							AND ssa.FiscalYear = @FiscalYear
						INNER JOIN 
					entity.School sch ON sch.SchoolId = ssa.SchoolId
							AND sch.FiscalYear = ssa.FiscalYear
						INNER JOIN 
					leadata.Student s ON s.StudentUSI = ssa.StudentUSI
						INNER JOIN 
					leadata.RecordOwnership ssaro ON ssaro.FiscalYear = ssa.FiscalYear   
							AND ssaro.ResourceId = ssa.SourceId
							AND ssaro.RecordOwnershipTypeId = 1											-- student school		
						INNER JOIN 
					leadata.StudentSchoolAttendanceEvent ssae ON ssae.FiscalYear = ssa.FiscalYear     
							AND ssae.StudentUSI = ssa.StudentUSI
							AND ssae.SchoolId = ssa.SchoolId
							AND ssae.AttendanceEventCategoryDescriptorId IN (10499,10498)				-- Unexcused and Excused absences
						INNER JOIN
					leadata.RecordOwnership ssaero ON ssaero.FiscalYear = ssae.FiscalYear   
							AND ssaero.ResourceId = ssae.SourceId
							AND ssaero.RecordOwnershipTypeId = 5										-- Student Attendance  
						LEFT JOIN 
					cteStudentSchoolAssociationLEA ssalea ON ssalea.StudentUSI = ssa.StudentUSI
							AND ssalea.SchoolId = ssa.SchoolId
							AND ssalea.FiscalYear = ssa.FiscalYear
						LEFT JOIN
					leadata.Descriptor ad ON ad.DescriptorId = ssae.AbsenceAmountDescriptorId 
							AND ad.FiscalYear = ssae.FiscalYear
				 WHERE ((ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 
							AND	ssaero.SubmittedByEducationOrganizationId = @ReportLEAId )			
							OR sch.LocalEducationAgencyId = @ReportLEAId )	    
			END
		ELSE 
			BEGIN
	
				--cte to bring StudentEdOrgs submitted by the LEA requesting the report, so we can					
				--join with that below even though the student ed org dates are outside the student school		
				--association date ranges
				;WITH cteStudentSchoolAssociationLEA AS
				(
					SELECT 
						ssalea.StudentUSI, 
						ssalea.EducationOrganizationId,
						ssalea.SchoolId,
						ssalea.EntryDate,
						ssalea.StartDate,
						ssalea.FiscalYear,
						ssalea.SourceId
					FROM 
						[leadata].[StudentSchoolAssociationLocalEducationAgency] ssalea
							INNER JOIN
						[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssalea.SchoolId			
								AND ssalea.FiscalYear = @FiscalYear
							INNER JOIN 
						leadata.RecordOwnership seoro ON seoro.FiscalYear = ssalea.FiscalYear   
								AND seoro.ResourceId = ssalea.SourceId
								AND (( @FiscalYear < 2020 AND seoro.RecordOwnershipTypeId = 7)			--student DOR
										OR (@FiscalYear >= 2020 AND seoro.RecordOwnershipTypeId = 1)
									)										
							INNER JOIN 
						entity.School sch ON sch.SchoolId = ssalea.SchoolId
								AND sch.FiscalYear = ssalea.FiscalYear	
					WHERE (seoro.SubmittedByEducationOrganizationId = @ReportLEAId 
								OR sch.LocalEducationAgencyId = @ReportLEAId )
				) 

				SELECT DISTINCT
					s.StudentUSI, 
					s.StudentUniqueId,
					s.FirstName,
					s.LastSurname,
					s.MiddleName,
					s.BirthDate,	
					ssa.SchoolId, 
	 				ssa.EntryDate, 
					ssa.ExitWithdrawDate,
					ssa.EntryGradeLevelDescriptorId,
					ssa.TrackEducationOrganizationId,
					ssa.TrackNumber,
					ssa.CalendarCode,
					ssa.FiscalYear,
					ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
					ssaero.SubmittedByEducationOrganizationId	AS SSAESubmittedByEducationOrganizationId,
					sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
					ssalea.EducationOrganizationId				AS DORLocalEducationAgencyId,
					ssalea.StartDate							AS DORStartDate,
					ssa.SourceId								AS SSAResourceId,
					ssae.SourceId								AS SSAEResourceId,
					ssalea.SourceId								AS SEOResourceId,
					ssae.EventDate								AS AbsenceAttendanceDate,
					ssae.InstructionalMinutes					AS AttendanceMinutes,
					ad.CodeValue								AS AbsenceAmount,
					ssae.AttendanceEventCategoryDescriptorId
				FROM 
					leadata.StudentSchoolAssociation ssa
						INNER JOIN 
					[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssa.SchoolId			-- updated 1/19/2018
							AND ssa.FiscalYear = @FiscalYear
						INNER JOIN 
					entity.School sch ON sch.SchoolId = ssa.SchoolId
							AND sch.FiscalYear = ssa.FiscalYear
						INNER JOIN 
					leadata.Student s ON s.StudentUSI = ssa.StudentUSI
						INNER JOIN 
					leadata.RecordOwnership ssaro ON ssaro.FiscalYear = ssa.FiscalYear   
							AND ssaro.ResourceId = ssa.SourceId
							AND ssaro.RecordOwnershipTypeId = 1											-- student school		
						INNER JOIN 
					leadata.StudentSchoolAttendanceEvent ssae ON ssae.FiscalYear = ssa.FiscalYear   
							AND ssae.StudentUSI = ssa.StudentUSI
							AND ssae.SchoolId = ssa.SchoolId
							AND ssae.AttendanceEventCategoryDescriptorId IN (10499,10498)				-- Unexcused and Excused absences
						INNER JOIN
					leadata.RecordOwnership ssaero ON ssaero.FiscalYear = ssae.FiscalYear  
							AND ssaero.ResourceId = ssae.SourceId
							AND ssaero.RecordOwnershipTypeId = 5										-- Student Attendance  
						LEFT JOIN 
					cteStudentSchoolAssociationLEA ssalea ON ssalea.FiscalYear = ssa.FiscalYear    
							AND ssalea.StudentUSI = ssa.StudentUSI
							AND ssalea.SchoolId = ssa.SchoolId
							AND ssalea.EntryDate = ssa.EntryDate
						LEFT JOIN
					leadata.Descriptor ad ON ad.DescriptorId = ssae.AbsenceAmountDescriptorId 
							AND ad.FiscalYear = ssae.FiscalYear
				 WHERE ((ssaro.SubmittedByEducationOrganizationId = @ReportLEAId 
							AND	ssaero.SubmittedByEducationOrganizationId = @ReportLEAId )			
							OR sch.LocalEducationAgencyId = @ReportLEAId )	    
			END
	END
	ELSE
		IF @ReportLEAType = 2	
			BEGIN
				IF @FiscalYear < 2018
				BEGIN
					;WITH cteStudentSchoolAssociationLEA AS
					(
						SELECT 
							ssalea.StudentUSI, 
							ssalea.EducationOrganizationId,
							ssalea.SchoolId,
							ssalea.StartDate,
							ssalea.FiscalYear,
							ssalea.SourceId,
							seoro.SubmittedByEducationOrganizationId
						FROM 
							[leadata].[StudentSchoolAssociationLocalEducationAgency] ssalea
								INNER JOIN
							[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssalea.SchoolId			-- ADDED 1/19/2018
									AND ssalea.FiscalYear = @FiscalYear
								INNER JOIN 
							leadata.RecordOwnership seoro ON seoro.FiscalYear = ssalea.FiscalYear   
									AND seoro.ResourceId = ssalea.SourceId
									AND seoro.RecordOwnershipTypeId = 7										--student DOR
								INNER JOIN 
							entity.School sch ON sch.SchoolId = ssalea.SchoolId
									AND sch.FiscalYear = ssalea.FiscalYear	
						WHERE ssalea.EducationOrganizationId = @ReportLEAId 
					)	 

					SELECT DISTINCT
						s.StudentUSI, 
						s.StudentUniqueId,
						s.FirstName,
						s.LastSurname,
						s.MiddleName,
						s.BirthDate,	
						ssa.SchoolId, 
	 					ssa.EntryDate, 
						ssa.ExitWithdrawDate,
						ssa.EntryGradeLevelDescriptorId,
						ssa.TrackEducationOrganizationId,
						ssa.TrackNumber,
						ssa.CalendarCode,
						ssa.FiscalYear,
						ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
						ssaero.SubmittedByEducationOrganizationId	AS SSAESubmittedByEducationOrganizationId,
						sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
						ssalea.EducationOrganizationId				AS DORLocalEducationAgencyId,
						ssalea.StartDate							AS DORStartDate,
						ssa.SourceId								AS SSAResourceId,
						ssae.SourceId								AS SSAEResourceId,
						ssalea.SourceId								AS SEOResourceId,
						ssae.EventDate								AS AbsenceAttendanceDate,
						ssae.InstructionalMinutes					AS AttendanceMinutes,
						ad.CodeValue								AS AbsenceAmount,
						ssae.AttendanceEventCategoryDescriptorId
					FROM 
						leadata.StudentSchoolAssociation ssa
							INNER JOIN 
						[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssa.SchoolId			-- updated 1/19/2018
								AND ssa.FiscalYear = @FiscalYear
							INNER JOIN 
						entity.School sch ON sch.SchoolId = ssa.SchoolId
								AND sch.FiscalYear = ssa.FiscalYear
							INNER JOIN 
						leadata.Student s ON s.StudentUSI = ssa.StudentUSI
							INNER JOIN 
						leadata.RecordOwnership ssaro ON ssaro.FiscalYear = ssa.FiscalYear  
								AND ssaro.ResourceId = ssa.SourceId
								AND ssaro.RecordOwnershipTypeId = 1											-- student school		
							INNER JOIN 
						leadata.StudentSchoolAttendanceEvent ssae ON    ssae.StudentUSI = ssa.StudentUSI
								AND ssae.SchoolId = ssa.SchoolId
								AND ssae.FiscalYear = ssa.FiscalYear
								AND ssae.AttendanceEventCategoryDescriptorId IN (10499,10498)				-- Unexcused and Excused absences
							INNER JOIN 
						leadata.RecordOwnership ssaero ON ssaero.FiscalYear = ssae.FiscalYear    
								AND ssaero.ResourceId = ssae.SourceId
								AND ssaero.RecordOwnershipTypeId = 5										-- Student Attendance  
							LEFT JOIN 
						cteStudentSchoolAssociationLEA ssalea ON ssalea.FiscalYear = ssa.FiscalYear  
								AND ssalea.StudentUSI = ssa.StudentUSI
								AND ssalea.SchoolId = ssa.SchoolId
							LEFT JOIN
						leadata.Descriptor ad ON ad.DescriptorId = ssae.AbsenceAmountDescriptorId 
								AND ad.FiscalYear = ssae.FiscalYear
					WHERE ssalea.EducationOrganizationId = @ReportLEAId  
							AND ( ssaro.SubmittedByEducationOrganizationId = @ReportLEAId  
									OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
									OR ssaro.SubmittedByEducationOrganizationId = ssalea.SubmittedByEducationOrganizationId )
							AND ( ssaero.SubmittedByEducationOrganizationId = @ReportLEAId  
									OR ssaero.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
									OR ssaero.SubmittedByEducationOrganizationId = ssalea.SubmittedByEducationOrganizationId )
				END  
		ELSE 
			BEGIN
				;WITH cteStudentSchoolAssociationLEA AS
				(
					SELECT 
						ssalea.StudentUSI, 
						ssalea.EducationOrganizationId,
						ssalea.SchoolId,
						ssalea.EntryDate,
						ssalea.StartDate,
						ssalea.FiscalYear,
						ssalea.SourceId,
						seoro.SubmittedByEducationOrganizationId
					FROM 
						[leadata].[StudentSchoolAssociationLocalEducationAgency] ssalea
							INNER JOIN
						[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssalea.SchoolId			
								AND ssalea.FiscalYear = @FiscalYear
							INNER JOIN 
						leadata.RecordOwnership seoro ON seoro.FiscalYear = ssalea.FiscalYear   
								AND seoro.ResourceId = ssalea.SourceId
								AND ( (@FiscalYear < 2020 AND seoro.RecordOwnershipTypeId = 7)
										OR (@FiscalYear >= 2020 AND seoro.RecordOwnershipTypeId = 1)	--student DOR
									)
							INNER JOIN 
						entity.School sch ON sch.SchoolId = ssalea.SchoolId
								AND sch.FiscalYear = ssalea.FiscalYear	
					WHERE ssalea.EducationOrganizationId = @ReportLEAId 
				)	 

				SELECT DISTINCT
					s.StudentUSI, 
					s.StudentUniqueId,
					s.FirstName,
					s.LastSurname,
					s.MiddleName,
					s.BirthDate,	
					ssa.SchoolId, 
	 				ssa.EntryDate, 
					ssa.ExitWithdrawDate,
					ssa.EntryGradeLevelDescriptorId,
					ssa.TrackEducationOrganizationId,
					ssa.TrackNumber,
					ssa.CalendarCode,
					ssa.FiscalYear,
					ssaro.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
					ssaero.SubmittedByEducationOrganizationId	AS SSAESubmittedByEducationOrganizationId,
					sch.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
					ssalea.EducationOrganizationId				AS DORLocalEducationAgencyId,
					ssalea.StartDate							AS DORStartDate,
					ssa.SourceId								AS SSAResourceId,
					ssae.SourceId								AS SSAEResourceId,
					ssalea.SourceId								AS SEOResourceId,
					ssae.EventDate								AS AbsenceAttendanceDate,
					ssae.InstructionalMinutes					AS AttendanceMinutes,
					ad.CodeValue								AS AbsenceAmount,
					ssae.AttendanceEventCategoryDescriptorId
				FROM 
					leadata.StudentSchoolAssociation ssa
						INNER JOIN 
					[util].[Split](@SchoolsList, ',' ) us ON us.Token = ssa.SchoolId		
							AND ssa.FiscalYear = @FiscalYear
						INNER JOIN 
					entity.School sch ON sch.SchoolId = ssa.SchoolId
							AND sch.FiscalYear = ssa.FiscalYear
						INNER JOIN 
					leadata.Student s ON s.StudentUSI = ssa.StudentUSI
						INNER JOIN 
					leadata.RecordOwnership ssaro ON ssaro.FiscalYear = ssa.FiscalYear   
							AND ssaro.ResourceId = ssa.SourceId
							AND ssaro.RecordOwnershipTypeId = 1											-- student school		
						INNER JOIN 
					leadata.StudentSchoolAttendanceEvent ssae ON ssae.FiscalYear = ssa.FiscalYear   
							AND ssae.StudentUSI = ssa.StudentUSI
							AND ssae.SchoolId = ssa.SchoolId
							AND ssae.AttendanceEventCategoryDescriptorId IN (10499,10498)				-- Unexcused and Excused absences
						INNER JOIN
					leadata.RecordOwnership ssaero ON ssaero.FiscalYear = ssae.FiscalYear 
							AND ssaero.ResourceId = ssae.SourceId 
							AND ssaero.RecordOwnershipTypeId = 5										-- Student Attendance  
						LEFT JOIN 
					cteStudentSchoolAssociationLEA ssalea ON ssalea.FiscalYear = ssa.FiscalYear   
							AND ssalea.StudentUSI = ssa.StudentUSI
							AND ssalea.SchoolId = ssa.SchoolId
							AND ssalea.EntryDate = ssa.EntryDate
						LEFT JOIN
					leadata.Descriptor ad ON ad.DescriptorId = ssae.AbsenceAmountDescriptorId 
							AND ad.FiscalYear = ssae.FiscalYear
				WHERE ssalea.EducationOrganizationId = @ReportLEAId  
						AND ( ssaro.SubmittedByEducationOrganizationId = @ReportLEAId  
								OR ssaro.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
								OR ssaro.SubmittedByEducationOrganizationId = ssalea.SubmittedByEducationOrganizationId )
						AND ( ssaero.SubmittedByEducationOrganizationId = @ReportLEAId  
								OR ssaero.SubmittedByEducationOrganizationId = sch.LocalEducationAgencyId
								OR ssaero.SubmittedByEducationOrganizationId = ssalea.SubmittedByEducationOrganizationId )
						AND ssaro.FiscalYear = @FiscalYear	
			END          
	END
END

/* End [report].[GetReportStudentAbsenceList] */
