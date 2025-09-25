-- 1. User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    role ENUM (guest, host, admin) DEFAULT 'guest' NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
);

-- Index for faster email lookups
CREATE INDEX idx_user_email ON User(email);

---------------------------------------------------

-- 2. Location Table
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

---------------------------------------------------

-- 3. Property Table
CREATE TABLE Property (
    property_id INT PRIMARY KEY AUTO_INCREMENT UUID Indexed,
    host_id INT NOT NULL FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10,2) NOT NULL,
    location VARCHAR NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

-- Indexes for common queries: location and price
CREATE INDEX idx_property_location ON Property(location_id);
CREATE INDEX idx_property_price ON Property(price_per_night);

---------------------------------------------------

-- 4. Booking Table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    property_id INT NOT NULL FOREIGN KEY REFERENCES Property(property_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM (pending, confirmed, cancelled) DEFAULT 'pending'NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
);

-- Index for faster lookups by user and property
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);

---------------------------------------------------

-- 5. Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL FOREIGN KEY REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'success',
);

-- Index for booking lookup
CREATE INDEX idx_payment_booking ON Payment(booking_id);

---------------------------------------------------

-- 6. Review Table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT UUID Indexed,
    property_id INT NOT NULL  FOREIGN KEY REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id INT NOT NULL FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
);

-- Index for booking lookup
CREATE INDEX idx_review_booking ON Review(booking_id);


CREATE TABLE Message (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT NOT NULL FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    recipient_id INT NOT NULL FOREIGN KEY REFERENCES User(user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
);