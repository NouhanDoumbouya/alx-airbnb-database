# Index Optimization Report

## Objective
Improve query performance by creating indexes on high-usage columns in Users, Bookings, and Properties tables.

## Indexed Columns

| Table       | Column        | Index Name                  | Reason                       |
|-------------|---------------|-----------------------------|------------------------------|
| Users       | id            | idx_users_id                | Common JOIN / Primary Key    |
| Bookings    | user_id       | idx_bookings_user_id        | JOIN/WHERE clause filter     |
| Bookings    | property_id   | idx_bookings_property_id    | JOIN with Properties         |
| Properties  | id            | idx_properties_id           | Common JOIN / Primary Key    |
| Bookings    | created_at    | idx_bookings_created_at     | Time-based filtering/order   |

## Performance Test

-- Step 1: Check performance BEFORE indexing (optional if not recorded previously)
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE user_id = 5;

-- Step 2: Create Indexes
CREATE INDEX IF NOT EXISTS idx_users_id ON Users(id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_properties_id ON Properties(id);
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON Bookings(created_at);

-- Step 3: Check performance AFTER indexing
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE user_id = 5;
