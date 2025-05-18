-- Non correlated subquery
-- This subquery retrieves all properties that have an average rating greater than 4.
-- It does this by first selecting the property IDs from the Reviews table, grouping them, and calculating the average rating.
-- The outer query then selects all properties that match these IDs.
-- This is useful for finding high-rated properties without needing to join the tables directly.
SELECT *
FROM Properties
WHERE id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4
);

-- Correlated subquery
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.id
) > 3;
