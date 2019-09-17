/************************************************************************************************************************
**Procedure Name: dashboard.LoadAzEDSCount
**
**Author: Britto Augustine
**
**Description: get enrollment, ell, sped counts from the AzEDS database by LEA, School and loads it into dashboard.RecordCount table
**			   called by the AzEDS nightly processing job after Integrity is completed
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  Britto Augustine		09/12/2016	Modified to split counts by DOR and DOA
**  Britto Augustine        05/02/2017  Removed the where condition ResponsibilityDescriptorId = 236, the ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**										Changed joins for DOR to use EntryDate because that is now available as part of AzEDS 3.0 changes.  
***************************************************************************************************************************/
CREATE PROC dashboard.LoadAzEDSCount
	@IntegrityExecutionId as int
AS
BEGIN

	declare @EventDateId as int
	declare @FY as int 
	declare @IntegrityStartDate as date
	declare @FYStartDate as date
	declare @FYEndDate as date

	declare @CurrentDateTime as datetime
	set @CurrentDateTime = GETDATE()

	--cerate or get event date id
	exec dashboard.CreateEventDate @ExecutionId = @IntegrityExecutionId, @EventDateId = @EventDateId output

	IF @EventDateId IS NULL
		THROW 51000, 'Could not create EventDateId.', 1;  


	--get FY from execution
	IF EXISTS (SELECT 1 FROM process.Execution WHERE ExecutionId = @IntegrityExecutionId)
		SELECT @FY = FiscalYear
		FROM process.Execution 
		WHERE ExecutionId = @IntegrityExecutionId
	ELSE		
		THROW 51000, 'Could not find Execution record.', 1;  

	IF EXISTS (select 1 from config.FiscalYear where FiscalYear = @FY) 
		select @FYStartDate = StartDate, @FYEndDate = EndDate
		from config.FiscalYear
		where FiscalYear = @FY
	ELSE
		THROW 51000, 'Invalid Fiscal Year.', 1;  

	--delete existing data so we can insert it below
	delete from dashboard.RecordCount
	where EventDateId = @EventDateId 
	  and RecordCountTypeId between 400 and 599


/***** GET DOA and DOR - BEGIN ****************************************************************************************************/

	IF OBJECT_ID('tempdb..#tmpStudentSchoolAssociation') IS NOT NULL DROP TABLE #tmpStudentSchoolAssociation

	create table #tmpStudentSchoolAssociation
	(
		FiscalYear int, 
		AttendingLocalEducationAgencyId int, 
		ResidentLocalEducationAgencyId int, 
		SchoolId int, 
		StudentUSI int, 
		EntryDate date,
		ExitWithdrawDate date,
	)

	--get DOA and DOR and insert into temp table
	;with cteStudentEducationOrganizationAssociation as 
	(
		--cte to get funding DOR  
		select seoa.FiscalYear, seoa.StudentUSI, seoa.SchoolId, seoa.EntryDate, lea.LocalEducationAgencyId as ResidentLocalEducationAgencyId
		from leadata.StudentSchoolAssociationLocalEducationAgency seoa with (nolock)
		left join entity.LocalEducationAgency lea with (nolock)
			on lea.FiscalYear = seoa.FiscalYear
		   and lea.LocalEducationAgencyId = seoa.EducationOrganizationId
		where seoa.FiscalYear = @FY
	)
	insert into #tmpStudentSchoolAssociation
		(FiscalYear, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, StudentUSI, EntryDate, ExitWithdrawDate)
	select ssa.FiscalYear, s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, seo.ResidentLocalEducationAgencyId,
			ssa.SchoolId, ssa.StudentUSI, ssa.EntryDate, ssa.ExitWithdrawDate
	from leadata.StudentSchoolAssociation ssa with (nolock)
	join entity.School s with (nolock)
		on s.SchoolId = ssa.SchoolId
		and s.fiscalyear = ssa.FiscalYear
	left join cteStudentEducationOrganizationAssociation seo
		on  ssa.FiscalYear = seo.FiscalYear
 		and	ssa.StudentUSI = seo.StudentUSI
		and ssa.SchoolId = seo.SchoolId
		and ssa.EntryDate = seo.EntryDate		
	where ssa.FiscalYear = @FY

	CREATE NONCLUSTERED INDEX [IX_tmpStudentSchoolAssociation] ON #tmpStudentSchoolAssociation
		(FiscalYear, StudentUSI, SchoolId, EntryDate)
	INCLUDE (AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId)

/***** GET DOA and DOR - END **********************************************************************************************************/


/***** LOAD STUDENT COUNTS - BEGIN ****************************************************************************************************/
/* Note: A student is counted only once per school                                                                                    */
	
	--insert Student Counts for Enrollments, FTE, Tution Payer, Special Enrollment and DOR
	insert into dashboard.RecordCount
		(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)

	--get StudentEnrollment count
	select @EventDateId as EventDateId, @FY as FiscalYear, 400 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct ssa.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId
		
	union

	--get Full Time Equivalency count
	select @EventDateId as EventDateId, @FY as FiscalYear, 401 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct fte.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationMembershipFTE fte  with (nolock)
		on fte.FiscalYear = ssa.FiscalYear
		and fte.StudentUSI = ssa.StudentUSI
		and fte.SchoolId = ssa.SchoolId
		and fte.EntryDate = ssa.EntryDate
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId
	
	union 

	--get Tution Payer count
	select @EventDateId as EventDateId, @FY as FiscalYear, 402 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct tp.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationTuitionPayer tp with (nolock)
		on tp.FiscalYear = ssa.FiscalYear
		and tp.StudentUSI = ssa.StudentUSI
		and tp.SchoolId = ssa.SchoolId
		and tp.EntryDate = ssa.EntryDate
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union 

	--get special enrollment count
	select @EventDateId as EventDateId, @FY as FiscalYear, 403 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct se.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationSpecialEnrollment se with (nolock)
		on se.FiscalYear = ssa.FiscalYear
		and se.StudentUSI = ssa.StudentUSI
		and se.SchoolId = ssa.SchoolId
		and se.EntryDate = ssa.EntryDate
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union

	--get DOR count
	select @EventDateId as EventDateId, @FY as FiscalYear, 404 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct seoa.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.[StudentSchoolAssociationLocalEducationAgency] seoa with (nolock)
		on seoa.FiscalYear = ssa.FiscalYear
		and seoa.StudentUSI = ssa.StudentUSI
		and seoa.SchoolId = ssa.SchoolId
		and seoa.EntryDate = ssa.EntryDate
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId
	
	union

	--get program only count
	select @EventDateId as EventDateId, @FY as FiscalYear, 406 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(distinct ssa.StudentUSI) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociation ssaPgm
		 on ssaPgm.FiscalYear = ssa.FiscalYear
		and ssaPgm.StudentUSI = ssa.StudentUSI
		and ssaPgm.SchoolId = ssa.SchoolId
		and ssaPgm.EntryDate = ssa.EntryDate
	    and ssaPgm.MembershipTypeDescriptorId = 11738 --program only membership
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId


	--insert Student Counts for Summer Withdrawals
	;with cteStudentSchoolAssociation as
	(
		--get all enrollments, excluding summer withdrawals
		select distinct s.LocalEducationAgencyId, ssa.SchoolId, ssa.StudentUSI
		from leadata.StudentSchoolAssociation ssa with (nolock)
		join entity.School s with (nolock)
		  on s.SchoolId = ssa.SchoolId
		 and s.FiscalYear = ssa.FiscalYear
		where ssa.MembershipTypeDescriptorId <> 11738   --exclude program only 
			and isnull(ssa.ExitWithdrawTypeDescriptorId, 0) not in (select ExitWithdrawTypeDescriptorId from config.ExcludeExitWithdrawType where FiscalYear = @FY)
			and ssa.FiscalYear = @FY
	),
	cteSummerWithdrawals as
	(
		--get summer withdrawals
		select distinct s.LocalEducationAgencyId, ssa.SchoolId, ssa.StudentUSI
		from leadata.StudentSchoolAssociation ssa with (nolock)
		join entity.School s with (nolock)
		  on s.SchoolId = ssa.SchoolId
		 and s.FiscalYear = ssa.FiscalYear
		where ssa.MembershipTypeDescriptorId <> 11738   --exclude program only 
			and isnull(ssa.ExitWithdrawTypeDescriptorId, 0) in (select ExitWithdrawTypeDescriptorId from config.ExcludeExitWithdrawType where FiscalYear = @FY)
			and ssa.FiscalYear = @FY
	)  
		insert into dashboard.RecordCount
			(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)

		--get counts of summer withdrawals. If a student is in enollments counts cte result and also in summer withdrwals cte result then that student is excluded from the final count.
		--setting ResidentLocalEducationAgencyId to null because summer withdrawals should not have DOR associated with it
		select @EventDateId as EventDateId, @FY as FiscalYear, 405 as RecordCountTypeId,
				sw.LocalEducationAgencyId as AttendingLocalEducationAgencyId, null as ResidentLocalEducationAgencyId, sw.SchoolId, count(distinct sw.StudentUSI) as RecordCount, 
				@CurrentDateTime as CreateDate
		from cteSummerWithdrawals sw 
		where not exists (select 1 
						  from cteStudentSchoolAssociation ssa
						  where ssa.LocalEducationAgencyId = sw.LocalEducationAgencyId
							and ssa.SchoolId = sw.SchoolId
							and ssa.StudentUSI = sw.StudentUSI)
		group by sw.LocalEducationAgencyId, sw.SchoolId 
				
	--insert Program Student Counts 
	;with cteStudentProgramAssociation as
	(
		select ProgramTypeId, StudentUSI, EducationOrganizationId, BeginDate
		from leadata.StudentProgramAssociation spa with (nolock) 
		where FiscalYear = @FY
		group by ProgramTypeId, StudentUSI, EducationOrganizationId, BeginDate 
	)
		insert into dashboard.RecordCount
			(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)
		
		select @EventDateId as EventDateId, @FY as FiscalYear,
				CASE WHEN spa.ProgramTypeId = 1  THEN 450	--ELL
				     WHEN spa.ProgramTypeId = 6  THEN 451	--SPED
					 WHEN spa.ProgramTypeId = 59 THEN 452	--support program
					 WHEN spa.ProgramTypeId = 60 THEN 453	--GCD
					 WHEN spa.ProgramTypeId = 61 THEN 454	--DRP
				END as RecordCountTypeId,
				s.LocalEducationAgencyId as AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, spa.EducationOrganizationId as SchoolId, count(*) AS RecordCount, 
				@CurrentDateTime as CreateDate
	 	 from cteStudentProgramAssociation spa
		 join entity.School s with (nolock) 
			   on s.SchoolId = spa.EducationOrganizationId
			  and s.fiscalyear = @FY
		 left join #tmpStudentSchoolAssociation ssa
			 on ssa.FiscalYear = @FY
			and spa.StudentUSI = ssa.StudentUSI
			and spa.EducationOrganizationId = ssa.SchoolId 
			and spa.BeginDate between ssa.EntryDate and isnull(ssa.ExitWithdrawDate, @FYEnddate)
		 group by spa.ProgramTypeId, s.LocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, spa.EducationOrganizationId

		
/***** LOAD STUDENT COUNTS - END ****************************************************************************************************/


/***** LOAD RECORD COUNTS - BEGIN ****************************************************************************************************/
/* Note: All records for the student and school is counted for record counts                                                         */

	--insert Record Counts for Enrollments, FTE, Tution Payer, Special Enrollment and DOR
	insert into dashboard.RecordCount
		(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)

	--get StudentEnrollment count.  
	select @EventDateId as EventDateId, @FY as FiscalYear, 500 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union

	--get Full Time Equivalency count
	select @EventDateId as EventDateId, @FY as FiscalYear, 501 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationMembershipFTE fte  with (nolock)
		on fte.StudentUSI = ssa.StudentUSI
		and fte.SchoolId = ssa.SchoolId
		and fte.EntryDate = ssa.EntryDate
		and fte.FiscalYear = ssa.FiscalYear
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union 

	--get Tution Payer count
	select @EventDateId as EventDateId, @FY as FiscalYear, 502 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationTuitionPayer tp with (nolock)
		on tp.StudentUSI = ssa.StudentUSI
		and tp.SchoolId = ssa.SchoolId
		and tp.EntryDate = ssa.EntryDate
		and tp.FiscalYear = ssa.FiscalYear
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union 

	--get special enrollment count
	select @EventDateId as EventDateId, @FY as FiscalYear, 503 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.StudentSchoolAssociationSpecialEnrollment se with (nolock)
		on se.StudentUSI = ssa.StudentUSI
		and se.SchoolId = ssa.SchoolId
		and se.EntryDate = ssa.EntryDate
		and se.FiscalYear = ssa.FiscalYear
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union

	--get DOR count
	select @EventDateId as EventDateId, @FY as FiscalYear, 504 as RecordCountTypeId, 
			ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from #tmpStudentSchoolAssociation ssa
	join leadata.[StudentSchoolAssociationLocalEducationAgency] seoa with (nolock)
		on seoa.StudentUSI = ssa.StudentUSI
		and seoa.SchoolId = ssa.SchoolId
		and seoa.EntryDate = ssa.EntryDate
		and seoa.FiscalYear = ssa.FiscalYear
	group by ssa.AttendingLocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, ssa.SchoolId

	union

	--get summer withdrawals counts
	select @EventDateId as EventDateId, @FY as FiscalYear, 505 as RecordCountTypeId, 
			s.LocalEducationAgencyId, dorssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from leadata.StudentSchoolAssociation ssa with (nolock)
	join #tmpStudentSchoolAssociation dorssa 
		 on dorssa.StudentUSI = ssa.StudentUSI
		and dorssa.SchoolId = ssa.SchoolId
		and dorssa.EntryDate = ssa.EntryDate
		and dorssa.FiscalYear = ssa.FiscalYear
	join entity.School s with (nolock)
		on s.SchoolId = ssa.SchoolId
		and s.FiscalYear = ssa.FiscalYear
	where ssa.MembershipTypeDescriptorId <> 11738   --exclude program only 
		and isnull(ssa.ExitWithdrawTypeDescriptorId, 0) in (select ExitWithdrawTypeDescriptorId from AzEDS.config.ExcludeExitWithdrawType where FiscalYear = @FY)
		and ssa.FiscalYear = @FY
	group by s.LocalEducationAgencyId, dorssa.ResidentLocalEducationAgencyId, ssa.SchoolId 

	union

	--get program only count
	select @EventDateId as EventDateId, @FY as FiscalYear, 506 as RecordCountTypeId, 
			s.LocalEducationAgencyId, dorssa.ResidentLocalEducationAgencyId, ssa.SchoolId, count(*) as RecordCount, 
			@CurrentDateTime as CreateDate
	from leadata.StudentSchoolAssociation ssa with (nolock)
	join #tmpStudentSchoolAssociation dorssa 
		 on dorssa.StudentUSI = ssa.StudentUSI
		and dorssa.SchoolId = ssa.SchoolId
		and dorssa.EntryDate = ssa.EntryDate
		and dorssa.FiscalYear = ssa.FiscalYear
	join entity.School s with (nolock)
		on s.SchoolId = ssa.SchoolId
		and s.FiscalYear = ssa.FiscalYear
	where ssa.MembershipTypeDescriptorId = 11738   --include program only 
		and ssa.FiscalYear = @FY
	group by s.LocalEducationAgencyId, dorssa.ResidentLocalEducationAgencyId, ssa.SchoolId 


	--insert program record counts
	insert into dashboard.RecordCount
			(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)

	select @EventDateId as EventDateId, @FY as FiscalYear, 
		   case when spa.ProgramTypeId = 1  then 550	--ELL
				when spa.ProgramTypeId = 6  then 551	--SPED
				when spa.ProgramTypeId = 59 then 552	--support program
				when spa.ProgramTypeId = 60 then 553	--GCD
				when spa.ProgramTypeId = 61 then 554	--DRP
			end as RecordCountTypeId,
		   s.LocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, spa.EducationOrganizationId, count(*) as RecordCount, 
		   @CurrentDateTime as CreateDate
	from leadata.StudentProgramAssociation spa with (nolock)
	join entity.School s with (nolock)
		on s.SchoolId = spa.EducationOrganizationId
	   and s.fiscalyear = spa.FiscalYear
	left join #tmpStudentSchoolAssociation ssa
	 	ON ssa.FiscalYear = @FY
	   and spa.StudentUSI = ssa.StudentUSI
	   and spa.EducationOrganizationId = ssa.SchoolId 
	   and spa.BeginDate between ssa.EntryDate and isnull(ssa.ExitWithdrawDate, @FYEnddate)
	where spa.FiscalYear = @FY			
	group by spa.ProgramTypeId, s.LocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, spa.EducationOrganizationId

	--insert SPED Need Counts
	insert into dashboard.RecordCount
			(EventDateId, FiscalYear, RecordCountTypeId, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCount, CreateDate)
			
	select @EventDateId as EventDateId, @FY as FiscalYear, 575 AS RecordCountTypeId, 
			s.LocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, sn.ReportingEducationOrganizationID, count(*) AS RecordCount, 
			@CurrentDateTime as CreateDate
	from leadata.StudentNeed sn with (nolock)
	join entity.School s with (nolock) 
		on sn.ReportingEducationOrganizationID = s.SchoolId
	   and s.fiscalyear = sn.FiscalYear
	left join #tmpStudentSchoolAssociation ssa
	 	on ssa.FiscalYear = @FY
	   and sn.StudentUSI = ssa.StudentUSI
	   and sn.ReportingEducationOrganizationID = ssa.SchoolId 
	where SN.StudentNeedDescriptorId IN (10255,10256,10257,10258,10259,10260,10261,10262,10263,10264, 10265,10266,10267,10268,10269,10270,10271)   -- sped need ids
	  and SN.FiscalYear = @FY
	group by s.LocalEducationAgencyId, ssa.ResidentLocalEducationAgencyId, sn.ReportingEducationOrganizationID


/***** LOAD RECORD COUNTS - END ****************************************************************************************************/


/***** CLEAN UP - BEGIN ************************************************************************************************************/


	IF OBJECT_ID('tempdb..#tmpStudentSchoolAssociation') IS NOT NULL DROP TABLE #tmpStudentSchoolAssociation


/***** CLEAN UP - END   ************************************************************************************************************/

END

