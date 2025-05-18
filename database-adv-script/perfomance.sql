-- Initial Complex Query
-- This query retrieves all bookings with user, property, and payment details
-- and filters by booking date and booking status

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status AS payment_status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-06-01' AND b.status = 'confirmed';


-- Optimized query with selected fields and assumed indexes
SELECT
    b.id AS booking_id,
    b.created_at,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id;
-- Note: The above query assumes that the necessary indexes are already in place on the relevant columns.
-- The indexes would typically be created as follows:
-- CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
-- The actual creation of indexes would depend on the specific database system and its capabilities.
-- The above query is designed to be more efficient by selecting only the necessary fields and leveraging indexes.