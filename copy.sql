--
-- COPY the Join Order Benchmark data FROM csv files into PostgreSQL database.
--
-- Launch this script via a command, like this:
-- psql -vdatadir="'/home/danolivo/jo-bench'" -f /home/danolivo/jo-bench/copy.sql
-- XXX: Don't forget to use the symbol "'" in a value of -vdatadir!
--

CREATE OR REPLACE FUNCTION imdb_copy(path text, tblname text, parts integer) RETURNS bool
LANGUAGE plpgsql AS $$
DECLARE
	full_path text;
	i integer;
BEGIN

	IF (parts = 1)
	THEN
		full_path = '/home/alena/parameterized-jo-bench' || '/csv/' || tblname || '.csv';
		raise NOTICE 'COPY % .', full_path;
		EXECUTE format('COPY %I FROM ''%s'' WITH (FORMAT csv, NULL '''', DELIMITER '','', QUOTE ''"'', ESCAPE ''\'');', tblname, full_path);
		-- '
	ELSE
		FOR i IN 1..parts
		LOOP
			full_path = '/home/alena/parameterized-jo-bench' || '/csv/' || tblname || '/' || tblname || '_' || i || '.csv';
			raise NOTICE 'COPY % .', full_path;
			EXECUTE format('COPY %I FROM ''%s'' WITH (FORMAT csv, NULL '''', DELIMITER '','', QUOTE ''"'', ESCAPE ''\'');', tblname, full_path);
			-- '
		END LOOP;
	END IF;

	RETURN true;
END $$;

BEGIN;
	TRUNCATE aka_title;
	SELECT imdb_copy('', 'aka_title', 1);
	TRUNCATE aka_name;
	SELECT imdb_copy('', 'aka_name', 1);
	TRUNCATE comp_cast_type;
	SELECT imdb_copy('', 'comp_cast_type', 1);
	TRUNCATE company_name;
	SELECT imdb_copy('', 'company_name', 1);
	TRUNCATE company_type;
	SELECT imdb_copy('', 'company_type', 1);
	TRUNCATE complete_cast;
	SELECT imdb_copy('', 'complete_cast', 1);
	TRUNCATE info_type;
	SELECT imdb_copy('', 'info_type', 1);
	TRUNCATE keyword;
	SELECT imdb_copy('', 'keyword', 1);
	TRUNCATE kind_type;
	SELECT imdb_copy('', 'kind_type', 1);
	TRUNCATE link_type;
	SELECT imdb_copy('', 'link_type', 1);
	TRUNCATE movie_companies;
	SELECT imdb_copy('', 'movie_companies', 1);
	TRUNCATE movie_info_idx;
	SELECT imdb_copy('', 'movie_info_idx', 1);
	TRUNCATE movie_keyword;
	SELECT imdb_copy('', 'movie_keyword', 1);
	TRUNCATE movie_link;
	SELECT imdb_copy('', 'movie_link', 1);
	TRUNCATE role_type;
	SELECT imdb_copy('', 'role_type', 1);

	-- Copy large tables
	TRUNCATE movie_info;
	SELECT imdb_copy('', 'movie_info', 15);
	TRUNCATE title;
	SELECT imdb_copy('', 'title', 2);
	TRUNCATE person_info;
	SELECT imdb_copy('', 'person_info', 4);
	TRUNCATE name;
	SELECT imdb_copy('', 'name', 4);
	TRUNCATE char_name;
	SELECT imdb_copy('', 'char_name', 3);
	TRUNCATE cast_info;
	SELECT imdb_copy('', 'cast_info', 20);
COMMIT;

-- Check size of large tables:
SELECT sum(size) FROM (
	SELECT count(*) AS size FROM movie_info
	UNION ALL
	SELECT count(*) AS size FROM title
	UNION ALL
	SELECT count(*) AS size FROM person_info
	UNION ALL
	SELECT count(*) AS size FROM name
	UNION ALL
	SELECT count(*) AS size FROM char_name
	UNION ALL
	SELECT count(*) AS size FROM cast_info
) AS q1;

/* sum: 63879870 */
VACUUM ANALYZE;

