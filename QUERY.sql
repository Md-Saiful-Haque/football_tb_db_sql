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

-- insert sample data into users table
INSERT INTO
  Users (user_id, full_name, email, role, phone_number)
VALUES
  (
    1,
    'Tanvir Rahman',
    'tanvir@mail.com',
    'Football Fan',
    '+8801711111111'
  ),
  (
    2,
    'Asif Haque',
    'asif@mail.com',
    'Football Fan',
    '+8801722222222'
  ),
  (
    3,
    'Sajjad Rahman',
    'sajjad@mail.com',
    'Ticket Manager',
    '+8801733333333'
  ),
  (
    4,
    'Jannat Ara',
    'jannat@mail.com',
    'Football Fan',
    NULL
  );


-- insert sample data into matches table
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');


-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

SELECT match_id, fixture, base_ticket_price FROM Matches 
WHERE tournament_category = 'Champions League' AND match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

SELECT user_id, full_name, email FROM Users
WHERE full_name ILIKE 'Tanvir%' OR full_name ILIKE '%Haque%';