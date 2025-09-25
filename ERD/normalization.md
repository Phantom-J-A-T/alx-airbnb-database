1. User Table
Column	Data Type	Constraints	Description
user_id	INT	PK, Auto Increment	Unique user identifier
name	VARCHAR(100)	NOT NULL	User's full name
email	VARCHAR(150)	NOT NULL, UNIQUE	User's email address
phone	VARCHAR(20)	NULL	User's phone number
password	VARCHAR(255)	NOT NULL	Encrypted password
role	VARCHAR(20)	DEFAULT 'customer'	User role (customer/host)
2. Property Table
Column	Data Type	Constraints	Description
property_id	INT	PK, Auto Increment	Unique property identifier
user_id	INT	FK → User(user_id)	Owner of the property
name	VARCHAR(150)	NOT NULL	Property name/title
description	TEXT	NULL	Property description
price_per_night	DECIMAL(10,2)	NOT NULL	Nightly rental price
location_id	INT	FK → Location(location_id)	Location reference
property_type	VARCHAR(50)	NULL	Apartment, villa, etc.
3. Booking Table
Column	Data Type	Constraints	Description
booking_id	INT	PK, Auto Increment	Unique booking identifier
user_id	INT	FK → User(user_id)	User who made the booking
property_id	INT	FK → Property(property_id)	Booked property
start_date	DATE	NOT NULL	Booking start date
end_date	DATE	NOT NULL	Booking end date
status	VARCHAR(20)	DEFAULT 'pending'	Booking status
4. Payment Table
Column	Data Type	Constraints	Description
payment_id	INT	PK, Auto Increment	Unique payment identifier
booking_id	INT	FK → Booking(booking_id)	Related booking
amount	DECIMAL(10,2)	NOT NULL	Payment amount
payment_date	DATETIME	NOT NULL	Date of payment
payment_method	VARCHAR(50)	NOT NULL	Method: Card, Transfer, etc.
status	VARCHAR(20)	DEFAULT 'success'	Payment status
5. Review Table
Column	Data Type	Constraints	Description
review_id	INT	PK, Auto Increment	Unique review identifier
booking_id	INT	FK → Booking(booking_id)	Related booking
rating	INT	NOT NULL CHECK(rating BETWEEN 1 AND 5)	Rating score (1–5)
comment	TEXT	NULL	Review comment
review_date	DATETIME	NOT NULL	Date of review
6. Location Table
Column	Data Type	Constraints	Description
location_id	INT	PK, Auto Increment	Unique location identifier
city	VARCHAR(100)	NOT NULL	City name
state	VARCHAR(100)	NOT NULL	State name
country	VARCHAR(100)	NOT NULL	Country name