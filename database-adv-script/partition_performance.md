# Partitioning Performance Report

## Objective
Optimize query performance on the large `Bookings` table by implementing table partitioning based on `start_date`.

## Strategy
- Used **RANGE partitioning** on `start_date`.
- Created child tables for each year (2023 and 2024).
- Created indexes on `start_date` in each partition.

## Performance Test Query
```sql
SELECT * FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
