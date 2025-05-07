-- sample_data.sql
-- Sample Data Population for Airbnb Database
-- Author: Used ChatGPT for this

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('uuid-101', 'Alice', 'Walker', 'alice@example.com', 'hashed_pwd_1', '123-456-7890', 'guest'),
    ('uuid-102', 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', '123-555-7890', 'host'),
    ('uuid-103', 'Carol', 'Johnson', 'carol@example.com', 'hashed_pwd_3', NULL, 'host'),
    ('uuid-104', 'David', 'Brown', 'david@example.com', 'hashed_pwd_4', '123-456-9999', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('prop-201', 'uuid-102', 'Modern Loft', 'Spacious loft in city center', 'New York, NY', 150.00),
    ('prop-202', 'uuid-102', 'Cozy Cabin', 'Peaceful cabin in the woods', 'Asheville, NC', 90.00),
    ('prop-203', 'uuid-103', 'Beachfront Bungalow', 'Ocean view and private beach access', 'Santa Monica, CA', 200.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ('book-301', 'prop-201', 'uuid-101', '2025-06-01', '2025-06-05', 600.00, 'confirmed'),
    ('book-302', 'prop-202', 'uuid-101', '2025-07-10', '2025-07-15', 450.00, 'pending'),
    ('book-303', 'prop-203', 'uuid-101', '2025-08-01', '2025-08-03', 400.00, 'canceled');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    ('pay-401', 'book-301', 600.00, 'credit_card'),
    ('pay-402', 'book-302', 450.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    ('rev-501', 'prop-201', 'uuid-101', 5, 'Amazing stay, clean and modern!'),
    ('rev-502', 'prop-203', 'uuid-101', 4, 'Beautiful views, but a bit noisy at night.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    ('msg-601', 'uuid-101', 'uuid-102', 'Hi, is the loft available in June?'),
    ('msg-602', 'uuid-102', 'uuid-101', 'Yes! It’s free from June 1st to June 5th.');
