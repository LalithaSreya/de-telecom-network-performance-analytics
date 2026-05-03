-- Missing duration
SELECT COUNT(*) FROM cdr_records WHERE duration_seconds = 'N/A';

-- Zero duration
SELECT COUNT(*) FROM cdr_records WHERE duration_seconds = '0';

-- Technology issues
SELECT COUNT(*) FROM cdr_records WHERE technology = 'N/A';
SELECT COUNT(*) FROM cdr_records WHERE technology IS NULL;
SELECT COUNT(*) FROM cdr_records WHERE technology = 'UNKNOWN';
SELECT COUNT(*) FROM cdr_records WHERE technology = 'nan';

-- Duplicates
SELECT caller_id, called_id, COUNT(*)
FROM cdr_records
GROUP BY caller_id, called_id
HAVING COUNT(*) > 1;

-- Maintenance missing
SELECT COUNT(*) FROM maintenance_log WHERE fault_timestamp = 'N/A';

-- Tower missing
SELECT COUNT(*) FROM tower_metadata WHERE latitude = 'UNKNOWN';
