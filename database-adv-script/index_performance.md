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

### Query: 
```sql
SELECT * FROM Bookings WHERE user_id = 5;
