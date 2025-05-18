# Optimization Report

## Objective
Improve the performance of a complex query that retrieves booking information joined with user, property, and payment details.

## Initial Query Summary
- Used `JOIN` across `Bookings`, `Users`, `Properties`, and `Payments`.
- Selected all fields, including unnecessary ones.
- Performance degraded with larger datasets.

## Performance Analysis (EXPLAIN ANALYZE)
- Used Sequential Scan on `Bookings`, `Users`, and `Payments`.
- Nested Loop joins detected.
- No indexes used on foreign keys (`user_id`, `property_id`, `booking_id`).

## Optimization Steps
- Added indexes on:
  - `Bookings.user_id`
  - `Bookings.property_id`
  - `Payments.booking_id`
- Reduced columns selected in the query to only necessary ones.
- Replaced `SELECT *` with targeted fields.

## Optimized Query Summary
- Query execution time improved significantly.
- Index scans replaced sequential scans.
- Reduced memory and CPU usage.

## Conclusion
With indexing and query refactoring, the optimized query is more efficient and scalable for larger datasets.
