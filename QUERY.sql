-- Football Ticket Booking System - Database Design & SQL Queries

-- create users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(20)
);

-- create matches table
CREATE TABLE Matches (
    match_id int PRIMARY KEY,
    fixture text NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price int NOT NULL CHECK (base_ticket_price > 0),
    match_status VARCHAR(50) NOT NULL CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

-- create bookings table
CREATE TABLE Bookings (
    booking_id int PRIMARY KEY,
    user_id int NOT NULL,
    match_id int NOT NULL,
    seat_number VARCHAR(20) UNIQUE,
    payment_status VARCHAR(50) CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost int CHECK (total_cost >= 0),

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (match_id)
        REFERENCES Matches(match_id)
);