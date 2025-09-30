# SQL Joins - Airbnb Database

This module demonstrates the use of SQL JOINs with example queries for the **Airbnb database project**.

## Queries

### 1. INNER JOIN
Retrieve all bookings and the respective users who made those bookings.
```sql
SELECT b.id AS booking_id, u.id AS user_id, u.name AS user_name, b.property_id, b.start_date, b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
