-- Index on Users.id (usually already a PRIMARY KEY, but include for completeness)
CREATE INDEX IF NOT EXISTS idx_users_id ON Users(id);

-- Index on Bookings.user_id to speed up JOINs and WHERE filters
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON Bookings(user_id);

-- Index on Bookings.property_id to optimize JOIN with Properties
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON Bookings(property_id);

-- Index on Properties.id (typically PRIMARY KEY, include if not already indexed)
CREATE INDEX IF NOT EXISTS idx_properties_id ON Properties(id);

-- Index on Bookings.created_at to speed up date-based queries
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON Bookings(created_at);
