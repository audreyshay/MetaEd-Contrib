DO $$
BEGIN
    IF NOT EXISTS(
        SELECT schema_name
          FROM information_schema.schemata
          WHERE schema_name = 'tracked_deletes_edfi'
      )
    THEN
      EXECUTE 'CREATE SCHEMA tracked_deletes_edfi AUTHORIZATION postgres';
    END IF;

END
$$;
