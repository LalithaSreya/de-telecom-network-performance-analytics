# Telecom Network Performance Analytics – Profiling Report

## Overview

This report summarizes data profiling performed on telecom datasets using PostgreSQL. The goal is to assess data quality, identify missing values, duplicates, and validate readiness for dimensional modeling.

---

## 1. cdr_records Table

### Row Count

Total rows: ~1,020,000

### Missing / Invalid Values

* duration_seconds = 'N/A' → 6,341 records
* duration_seconds = '0' → 153,028 records
* technology issues:

  * 'N/A' → 8,068
  * 'nan' → 10,183
  * NULL → 6,267
  * UNKNOWN → 6,343

### Duplicate Records

Duplicate caller_id + called_id combinations: 20,230

### Observations

* duration stored as VARCHAR → needs numeric conversion
* inconsistent technology labels (2G, 2g, NULL, etc.)
* duplicate communication pairs present

### Conclusion

Requires cleaning, type conversion, and normalization before modeling.

---

## 2. maintenance_log Table

### Row Count

Total rows: verified

### Missing Values

* fault_timestamp = 'N/A' → 55 records

### Observations

* timestamp inconsistency present

### Conclusion

Requires cleaning for accurate time analysis.

---

## 3. tower_metadata Table

### Missing Values

* latitude = 'UNKNOWN' → 3 records

### Observations

* location data partially incomplete

### Conclusion

Minimal cleaning required.

---

## Overall Conclusion

Data is suitable for warehouse modeling after:

* handling missing values
* standardizing categorical values
* converting data types
* removing duplicates

---


