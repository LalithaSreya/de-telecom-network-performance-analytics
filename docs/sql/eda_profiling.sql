-- ========================
-- DIMENSION TABLES
-- ========================

CREATE TABLE dim_tower (
    tower_key SERIAL PRIMARY KEY,
    tower_id TEXT,
    city TEXT,
    state TEXT,
    location TEXT
);

CREATE TABLE dim_time (
    time_key SERIAL PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE dim_technology (
    technology_key SERIAL PRIMARY KEY,
    technology TEXT
);

-- ========================
-- FACT TABLES
-- ========================

CREATE TABLE fact_call_records (
    call_key SERIAL PRIMARY KEY,
    caller_id TEXT,
    called_id TEXT,
    tower_key INT,
    time_key INT,
    technology_key INT,
    duration_seconds INT
);

CREATE TABLE fact_maintenance (
    maintenance_key SERIAL PRIMARY KEY,
    tower_key INT,
    time_key INT,
    fault_type TEXT
);
