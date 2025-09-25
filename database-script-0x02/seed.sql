-- 1. Users
INSERT INTO User (first_name, last_name, email, phone_number, password_hash, role)
VALUES 
('John', 'Doe', 'john@example.com', '1234567890', 'hashed_password1', 'guest'),
('Alice', 'Smith', 'alice@example.com', '9876543210', 'hashed_password2', 'host'),
('Michael', 'Brown', 'michael@example.com', '5551112222', 'hashed_password3', 'host'),
('Admin', 'User', 'admin@example.com', '1112223333', 'hashed_password4', 'admin');

---------------------------------------------------

-- 2. Locations
INSERT INTO Location (city, state, country)
VALUES
('Lagos', 'Lagos', 'Nigeria'),
('Abuja', 'FCT', 'Nigeria'),
('Nairobi', 'Nairobi County', 'Kenya'),
('Cape Town', 'Western Cape', 'South Africa');

---------------------------------------------------

-- 3. Properties
INSERT INTO Property (host_id, name, description, price_per_night, location)
VALUES
(2, 'Beachside Villa', 'Luxury villa with ocean view', 250.00, 'Lagos'),
(2, 'City Apartment', 'Modern apartment in city center', 120.00, 'Abuja'),
(3, 'Safari Lodge', 'Close to wildlife reserves', 180.00, 'Nairobi');

---------------------------------------------------

-- 4. Bookings
INSERT INTO Booking (user_id, property_id, start_date, end_date, status, total_price)
VALUES
(1, 1, '2025-10-10', '2025-10-15', 'confirmed', 1250.00),
(1, 2, '2025-11-01', '2025-11-05', 'pending', 480.00),
(1, 3, '2025-12-20', '2025-12-25', 'cancelled', 900.00);

---------------------------------------------------

-- 5. Payments
INSERT INTO Payment (booking_id, amount, payment_date, payment_method, status)
VALUES
(1, 1250.00, '2025-09-20 10:30:00', 'Credit Card', 'success'),
(2, 480.00, '2025-09-21 14:00:00', 'Bank Transfer', 'pending'),
(3, 900.00, '2025-09-22 09:15:00', 'PayPal', 'failed');

---------------------------------------------------

-- 6. Reviews
INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing experience, beautiful villa!'),
(2, 1, 4, 'Great location, a bit noisy though'),
(3, 1, 3, 'Decent stay, but could be cleaner');

---------------------------------------------------

-- 7. Messages
INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
(1, 2, 'Hi Alice, is the villa available for next month?'),
(2, 1, 'Yes, John. It is available for your dates.'),
(3, 1, 'We hope you enjoyed your stay at the Safari Lodge!');
