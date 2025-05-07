# ✅ Database Normalization – Airbnb Clone

## 🎯 Objective
Ensure the relational database design is in **Third Normal Form (3NF)** to eliminate redundancy, enhance data integrity, and support efficient querying.

---

## 🔍 Step-by-Step Normalization Process

### 🧱 1NF: First Normal Form
**Rule:** Each column should contain atomic values and each record should be unique.

✅ Achieved by:
- Using **UUIDs** as unique `PRIMARY KEY` values in all tables.
- Ensuring all attributes hold **atomic (indivisible)** data types (e.g., `VARCHAR`, `DATE`, `DECIMAL`).
- No multivalued or composite fields exist.

### 🧱 2NF: Second Normal Form
**Rule:** Must be in 1NF and all non-key attributes must depend on the whole primary key.

✅ Achieved by:
- All tables have a **single-column primary key**, so **no partial dependencies** exist.
- In composite relationships (e.g., `Booking` → `User`, `Property`), all non-key fields depend fully on the primary key.

### 🧱 3NF: Third Normal Form
**Rule:** Must be in 2NF and all attributes must depend **only on the primary key**, not on other non-key attributes.

✅ Achieved by:
- No **transitive dependencies** are present.
- Attributes like `email`, `rating`, `pricepernight`, etc., are dependent **only on their respective primary keys**.
- The `role` attribute in `User` is not split out since it’s a finite ENUM and does not introduce redundancy.
- No calculated fields (e.g., `total_price`) are precomputed unnecessarily; derived values are left for business logic layers or views.

---

## 📋 Summary of Design Compliance with 3NF

| Table      | 1NF | 2NF | 3NF | Notes |
|------------|-----|-----|-----|-------|
| `User`     | ✅  | ✅  | ✅  | All attributes atomic, unique email |
| `Property` | ✅  | ✅  | ✅  | Linked to `User` via `host_id` |
| `Booking`  | ✅  | ✅  | ✅  | No redundant or transitive attributes |
| `Payment`  | ✅  | ✅  | ✅  | All data linked via `booking_id` |
| `Review`   | ✅  | ✅  | ✅  | Rating integrity maintained |
| `Message`  | ✅  | ✅  | ✅  | Bidirectional user messages |

---

## ✅ Conclusion
The current Airbnb database schema has been reviewed and adheres to **Third Normal Form (3NF)** standards. The structure avoids redundancy, supports data integrity, and is well-suited for scalable operations and future extensions.