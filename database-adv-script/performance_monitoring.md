# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance using tools like `EXPLAIN ANALYZE`, and improve schema or indexing where needed.

---

## Step 1: Identify Frequently Used Queries

### ✅ Query 1: Fetch bookings by date range
```sql
SELECT * FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
