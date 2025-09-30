# Partitioning Performance Report

## Goal
Optimize query performance on the large **Bookings** table by using **partitioning** on the `start_date` column.

---

## Partitioning Strategy
- Used **RANGE partitioning** by `start_date` (yearly partitions: 2023, 2024, 2025).
- Added indexes on `user_id` inside each partition for faster joins and lookups.

---

## Test Query
```sql
EXPLAIN ANALYZE
SELECT * 
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
