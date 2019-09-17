
CREATE VIEW [915].[VwTracksForPostSubmissionWindow]
AS

     SELECT DISTINCT
            tt.TrackNumber,           
		  NULL as CalendarType,
            d.Description,
            d.FiscalYear
     FROM entity.TrackType tt
          JOIN leadata.Descriptor d ON tt.TrackNumber = TRY_CAST(d.CodeValue AS INT)
                                       AND d.Namespace = 'http://www.azed.gov/Descriptor/TrackNumberDescriptor.xml'

    UNION

     SELECT DISTINCT
            0 AS  TrackNumber,         
		  tt.CalendarType as CalendarType,
            d.Description,
            d.FiscalYear
     FROM [Config].[CalendarType] tt
          JOIN leadata.Descriptor d ON tt.CalendarType = d.CodeValue
                                       AND d.Namespace = 'http://www.azed.gov/Descriptor/CalendarTypeDescriptor.xml';
GO

