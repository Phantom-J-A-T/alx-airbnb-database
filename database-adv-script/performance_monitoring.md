# Database Performance Monitoring and Refinement

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitoring Queries

### Example Query 1: Retrieve bookings with user and property info
```sql
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date,
       u.name AS user_name, p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date DESC;
