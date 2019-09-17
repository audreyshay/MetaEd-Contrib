CREATE PROCEDURE [config].[GetApiAuthorizationOverride]
    @FiscalYear int = null
AS
BEGIN	

    SELECT 
             aeo.ApiAuthorizationOverrideId
            ,aeo.EducationOrganizationId
            ,aeo.FiscalYear
            ,CASE 
                WHEN lea.LocalEducationAgencyId IS NOT NULL THEN aeo.EducationOrganizationId
                ELSE sch.LocalEducationAgencyId
             END AS  LocalEducationAgencyId
            ,CASE
                WHEN sch.SchoolId IS NULL THEN 0
                ELSE 1
             END AS IsSchool
            ,sch.SchoolName
            ,sch.SchoolCTDS
            ,CASE
                WHEN lea.LocalEducationAgencyId IS NULL THEN 0
                ELSE 1
             END AS IsLocalEducationAgency
            ,lea.LocalEducationAgencyName
            ,lea.LocalEducationAgencyCTDS
            ,aeo.AllowedFromDate
            ,aeo.AllowedToDate
            ,aeo.CreatedBy
            ,aeo.CreatedDate
            ,aeo.LastModifiedBy
            ,aeo.LastModifiedDate
            ,aeo.Comment
            ,aeo.ApiWideOverride

    FROM config.ApiAuthorizationOverride aeo (nolock)
    LEFT JOIN entity.vw_LocalEducationAgency lea
           ON aeo.EducationOrganizationId = lea.LocalEducationAgencyId
          AND aeo.FiscalYear = lea.FiscalYear
    LEFT JOIN entity.vw_School sch
           ON aeo.EducationOrganizationId = sch.SchoolId
          AND aeo.FiscalYear = sch.FiscalYear

    WHERE aeo.FiscalYear = @FiscalYear

END
