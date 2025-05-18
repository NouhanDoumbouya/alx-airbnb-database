-- Step 1: Rename original Bookings table (optional backup)
ALTER TABLE Bookings RENAME TO Bookings_old;

-- Step 2: Create new parent Bookings table with partitioning
CREATE TABLE Bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP,
    -- other columns ...
    CONSTRAINT bookings_date_check CHECK (start_date IS NOT NULL)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example for 2023 and 2024)
CREATE TABLE Bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 4: Optional: Re-insert old data into new partitioned table
INSERT INTO Bookings (id, user_id, property_id, start_date, end_date, created_at)
SELECT id, user_id, property_id, start_date, end_date, created_at
FROM Bookings_old;

-- Step 5: Create index on partitions (if needed)
CREATE INDEX ON Bookings_2023 (start_date);
CREATE INDEX ON Bookings_2024 (start_date);
