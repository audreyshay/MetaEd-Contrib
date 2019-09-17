
CREATE VIEW [report].[vw_FormattedEducationorganizationCTDS]
AS
SELECT [EducationOrganizationId]
      ,[FiscalYear]
      ,[OperationalStatusTypeId]
      ,[NameOfInstitution] + ' (' + CONVERT(NVARCHAR(20),[EducationOrganizationId]) + ')'															AS 'NameOfInstitution'
      ,[CTDS]
	  ,SUBSTRING(LTRIM(CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(CTDS), 7, 3)	AS 'FormattedCTDS'
      ,[OperationalStatusEffectiveDate]
  FROM [entity].[EducationOrganization]
