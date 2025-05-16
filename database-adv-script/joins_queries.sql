SELECT *
FROM Bookings
INNER JOIN Users ON Bookings.user_id = Users.id;

SELECT *
FROM Properties
LEFT JOIN Reviews ON Properties.id = Reviews.property_id
ORDER BY Reviews.rating DESC;

SELECT *
FROM Users
FULL OUTER JOIN Bookings ON Users.id = Bookings.user_id;