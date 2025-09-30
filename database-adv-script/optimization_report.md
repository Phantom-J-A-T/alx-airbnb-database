# Query Optimization Report

## Initial Query
We retrieved bookings with user, property, and payment details:
```sql
SELECT b.id, b.start_date, b.end_date,
       u.id, u.name, u.email,
       p.id, p.name, p.location,
       pay.id, pay.amount, pay.payment_date, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;
