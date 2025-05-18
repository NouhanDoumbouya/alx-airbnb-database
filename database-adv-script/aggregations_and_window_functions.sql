-- 1. Total bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY user_id;

-- 2. Rank properties based on number of bookings
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
    ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY COUNT(*) DESC) AS booking_rank
FROM Bookings
GROUP BY property_id;
