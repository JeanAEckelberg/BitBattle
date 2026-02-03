
-- Enable for future databases
\c template1
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Enable for the default database
\c postgres
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;


CREATE USER otel WITH LOGIN SUPERUSER PASSWORD 'otelpassword';

GRANT pg_read_all_data TO otel;
GRANT pg_read_all_stats TO otel;
GRANT pg_monitor TO otel;

SELECT calls, query FROM pg_stat_statements LIMIT 1;

ALTER ROLE otel SET pg_stat_statements.track = 'none';