-- Initial complex query with full joins
SELECT
    b.id AS booking_id,
    b.created_at AS booking_date,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount AS payment_amount
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id;


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