# ETL Overview

This document describes the Extract, Transform, and Load (ETL) process
used to populate the analytical data mart and Power BI semantic model.

---

## ETL Strategy

The ETL process is intentionally split across two layers:
- SQL Server for structural and relational transformations
- Power Query for advanced text cleansing and normalization

---

## SQL Server Transformations

SQL Server was used for:
- Extracting data from source systems
- Creating staging tables
- Defining dimension and fact tables
- Applying basic data standardization
- Enforcing analytical schema structure

Dimension and fact tables were populated using INSERT-based transformations.

---

## Power Query Transformations

Power Query was used to address data quality issues that could not be fully
resolved at the database level, including:
- Persian and Arabic character inconsistencies
- Invisible Unicode characters (ZWNJ, ZWJ, NBSP, BOM)
- Irregular spacing and hidden separators
- Separation of car brand and car model attributes

---

## Data Quality Approach
- Preserve raw data integrity at the staging level
- Apply non-destructive cleansing transformations
- Ensure consistent analytical grouping and filtering
- Maintain traceability from source to dashboard

---

## Outcome
The combined ETL approach ensures:
- Reliable analytical reporting
- Accurate aggregations and KPIs
- Consistent behavior across dashboards
- A scalable and maintainable BI pipeline
