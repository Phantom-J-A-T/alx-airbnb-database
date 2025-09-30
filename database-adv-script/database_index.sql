-- Indexes for Users table
-- High-usage columns: id (PK), name (search), email (unique lookups)
CREATE INDEX idx_users_name ON users(name);
CREATE UNIQUE INDEX idx_users_email ON users(email);

-- Indexes for Bookings table
-- High-usage columns: user_id (JOIN), property_id (JOIN), start_date (filter/search)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Indexes for Properties table
-- High-usage columns: id (PK), name (search), location (filtering)
CREATE INDEX idx_properties_name ON properties(name);
CREATE INDEX idx_properties_location ON properties(location);
