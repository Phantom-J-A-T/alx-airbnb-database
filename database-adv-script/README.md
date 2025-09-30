# SQL Joins - Airbnb Database

This module demonstrates the use of SQL JOINs with example queries for the **Airbnb database project**.

## Queries

### 1. INNER JOIN
Retrieve all bookings and the respective users who made those bookings.
```sql
SELECT b.id AS booking_id, u.id AS user_id, u.name AS user_name, b.property_id, b.start_date, b.end_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;


## Subqueries

### 1. Non-correlated Subquery
Find all properties where the average rating is greater than 4.0.
```sql
SELECT p.id AS property_id, p.name AS property_name
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.id;
