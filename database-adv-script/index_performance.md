# Index Performance Analysis

This document analyzes query performance **before and after** adding indexes to the
`users`, `bookings`, and `properties` tables.

---

## 1. Users Table
**High-usage columns:** `id`, `name`, `email`.

### Indexes
```sql
CREATE INDEX idx_users_name ON users(name);
CREATE UNIQUE INDEX idx_users_email ON users(email);
