# 🗃️ Airbnb Database Schema – SQL Definition

## 📁 Directory: `database-script-0x01`

This folder contains the SQL script to create and define the Airbnb database schema.

---

## 📌 Objective

Design and implement a relational database schema for Airbnb platform, including:
- Entities: User, Property, Booking, Payment, Review, Message
- Proper constraints (PK, FK, NOT NULL, UNIQUE)
- Data integrity enforcement (ENUMs, CHECKs)
- Performance optimization via indexing

---

## 📂 Files

### `schema.sql`
Defines the entire relational schema with:
- Table creation for all core entities
- Data types and constraints for each column
- Foreign key references for data consistency
- Indexes for optimal query performance

### `README.md`
You are reading it! Describes the purpose and contents of the schema implementation.

---

## ✅ Highlights

- All primary keys use UUIDs for global uniqueness
- Enum types used to enforce valid state values (`role`, `status`, `payment_method`)
- Check constraints ensure valid rating values
- Indexes on all lookup-critical columns like `email`, `booking_id`, `property_id`, `user_id`, etc.

---

## 🛠️ Usage

1. Run the schema script in your PostgreSQL or MySQL-compatible environment:
```bash
mysql -U your_user -d your_database -f schema.sql
