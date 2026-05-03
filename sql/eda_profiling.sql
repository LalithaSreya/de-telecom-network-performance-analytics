-- Total records
SELECT COUNT(*) AS total_rows FROM cdr_records;

-- Missing duration
SELECT COUNT(*) AS missing_duration
FROM cdr_records
WHERE duration_seconds = 'N/A';

-- Zero duration
SELECT COUNT(*) AS zero_duration
FROM cdr_records
WHERE duration_seconds = '0';

-- Technology inconsistencies
SELECT technology, COUNT(*) 
FROM cdr_records
GROUP BY technology
ORDER BY COUNT(*) DESC;

-- Technology issues
SELECT COUNT(*) FROM cdr_records WHERE technology = 'N/A';
SELECT COUNT(*) FROM cdr_records WHERE technology IS NULL;
SELECT COUNT(*) FROM cdr_records WHERE technology = 'UNKNOWN';
SELECT COUNT(*) FROM cdr_records WHERE technology = 'nan';

-- Duplicate records
SELECT caller_id, called_id, COUNT(*) AS duplicate_count
FROM cdr_records
GROUP BY caller_id, called_id
HAVING COUNT(*) > 1;

-- Maintenance missing values
SELECT COUNT(*) AS missing_fault_timestamp
FROM maintenance_log
WHERE fault_timestamp = 'N/A';

-- Tower metadata issues
SELECT COUNT(*) AS invalid_latitude
FROM tower_metadata
WHERE latitude = 'UNKNOWN';
