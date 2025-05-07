## CREATION OF AN ENTITY-RELATIONSHIP (ER) DIAGRAM BASED ON THE DATABASE SPECIFICATION

# 🏠 AirBnB Database Specification

This document outlines the entities, attributes, and relationships that define the backend database schema of an AirBnB-style platform.

---

## 📦 Entities and Attributes

### 👤 User

- `user_id`: Primary Key, UUID, Indexed  
- `first_name`: VARCHAR, NOT NULL  
- `last_name`: VARCHAR, NOT NULL  
- `email`: VARCHAR, UNIQUE, NOT NULL  
- `password_hash`: VARCHAR, NOT NULL  
- `phone_number`: VARCHAR, NULL  
- `role`: ENUM (`guest`, `host`, `admin`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 🏡 Property

- `property_id`: Primary Key, UUID, Indexed  
- `host_id`: Foreign Key, references `User(user_id)`  
- `name`: VARCHAR, NOT NULL  
- `description`: TEXT, NOT NULL  
- `location`: VARCHAR, NOT NULL  
- `pricepernight`: DECIMAL, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 📅 Booking

- `booking_id`: Primary Key, UUID, Indexed  
- `property_id`: Foreign Key, references `Property(property_id)`  
- `user_id`: Foreign Key, references `User(user_id)`  
- `start_date`: DATE, NOT NULL  
- `end_date`: DATE, NOT NULL  
- `total_price`: DECIMAL, NOT NULL  
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💳 Payment

- `payment_id`: Primary Key, UUID, Indexed  
- `booking_id`: Foreign Key, references `Booking(booking_id)`  
- `amount`: DECIMAL, NOT NULL  
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

---

### ⭐ Review

- `review_id`: Primary Key, UUID, Indexed  
- `property_id`: Foreign Key, references `Property(property_id)`  
- `user_id`: Foreign Key, references `User(user_id)`  
- `rating`: INTEGER, CHECK (`rating >= 1 AND rating <= 5`), NOT NULL  
- `comment`: TEXT, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💬 Message

- `message_id`: Primary Key, UUID, Indexed  
- `sender_id`: Foreign Key, references `User(user_id)`  
- `recipient_id`: Foreign Key, references `User(user_id)`  
- `message_body`: TEXT, NOT NULL  
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---


### 🔗 RELATIONSHIP BETWEEN ENTITIES:
1. **User** 🔗 **Property**
    * `Relationship`: __One-to-Many__

    * `Description`: A user with the role of "host" can create multiple properties.

    * `Link`: Property.host_id → User.user_id

2. **__User__** 🔗 **__Booking__**
    * `Relationship`: __One-to-Many__

    * `Description`: A user (typically a guest) can make multiple bookings.

    * `Link`: Booking.user_id → User.user_id

3. **__Property__** 🔗 **__Booking__**
    * `Relationship`: __One-to-Many__

    * `Description`: A property can have multiple bookings (booked for different times usage) by different users.

    * `Link`: Booking.property_id → Property.property_id

4. **__Booking__** 🔗 **__Payment__**
    * `Relationship`: __One-to-One__ (or possibly One-to-Many, if partial payments are allowed)

    * `Description`: Each booking is associated with at least one payment record.

    * `Link`: Payment.booking_id → Booking.booking_id

5. **__User__** 🔗 **__Review__**
    * `Relationship`: __One-to-Many__

    * `Description`: A user can leave multiple reviews (for different properties).

    * `Link`: Review.user_id → User.user_id

6. **__Property__** 🔗 **__Review__**
    * `Relationship`: __One-to-Many__

    * `Description`: A property can have multiple reviews.

    * `Link`: Review.property_id → Property.property_id

7. **__User__** 🔗 **__Message (Self-referential)__**
    * `Relationship`: __Many-to-Many__ (via messages)

    * `Description`: Users can send messages to each other (host-to-guest or guest-to-host).

    * `Links`:

            Message.sender_id → User.user_id

            Message.recipient_id → User.user_id

---

## 🔐 Constraints and Indexing

### 📄 User Table
- Unique constraint on `email`
- Non-null constraints on:
  - `first_name`
  - `last_name`
  - `email`
  - `password_hash`
  - `role`

---

### 🏠 Property Table
- Foreign key constraint on `host_id` (references `User(user_id)`)
- Non-null constraints on:
  - `name`
  - `description`
  - `location`
  - `pricepernight`

---

### 📆 Booking Table
- Foreign key constraints on:
  - `property_id` (references `Property(property_id)`)
  - `user_id` (references `User(user_id)`)
- `status` must be one of: `pending`, `confirmed`, `canceled`
- Non-null constraints on:
  - `start_date`
  - `end_date`
  - `total_price`
  - `status`

---

### 💸 Payment Table
- Foreign key constraint on `booking_id` (references `Booking(booking_id)`)
- Ensures each payment is tied to a valid booking
- Non-null constraints on:
  - `amount`
  - `payment_method`

---

### 📝 Review Table
- Foreign key constraints on:
  - `property_id` (references `Property(property_id)`)
  - `user_id` (references `User(user_id)`)
- `rating` must be an integer between 1 and 5
- Non-null constraints on:
  - `rating`
  - `comment`

---

### 💬 Message Table
- Foreign key constraints on:
  - `sender_id` (references `User(user_id)`)
  - `recipient_id` (references `User(user_id)`)
- Non-null constraint on `message_body`

---

## 📈 Indexing Strategy

### ✅ Primary Keys
- All primary keys (`user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`) are **automatically indexed**

### ➕ Additional Indexes
- `email` in the **User** table (for login and uniqueness checks)
- `property_id` in both **Property** and **Booking** tables (to optimize joins and lookups)
- `booking_id` in **Booking** and **Payment** tables (to link and search efficiently)

---

### ER DIAGRAM USING `LUCID CHART`
![ER_DIAGRAM](https://github.com/NouhanDoumbouya/alx-airbnb-database/blob/main/images/ERD_DIAGRAM.png)
