USE airport_analytics;

CREATE TABLE airlines(
airline_id INT PRIMARY KEY,
airline_name VARCHAR(100) NOT NULL,
country VARCHAR(50),
airline_code VARCHAR(10) UNIQUE
);

CREATE TABLE airports(
airport_id INT PRIMARY KEY,
airport_name VARCHAR(100) NOT NULL,
city VARCHAR(50),
country VARCHAR(50),
airport_code VARCHAR(10) UNIQUE
);

CREATE TABLE aircraft(
aircraft_id INT PRIMARY KEY,
airline_id INT,
aircraft_type VARCHAR(50),
capacity INT,
FOREIGN KEY (airline_id)
REFERENCES airlines (airline_id)
);

CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    aircraft_id INT,
    origin_airport INT,
    destination_airport INT,
    scheduled_departure DATETIME,
    actual_departure DATETIME,
    scheduled_arrival DATETIME,
    actual_arrival DATETIME,
    status VARCHAR(20),

    FOREIGN KEY (airline_id)
        REFERENCES airlines(airline_id),

    FOREIGN KEY (aircraft_id)
        REFERENCES aircraft(aircraft_id),

    FOREIGN KEY (origin_airport)
        REFERENCES airports(airport_id),

    FOREIGN KEY (destination_airport)
        REFERENCES airports(airport_id)
);

CREATE TABLE passengers(
passenger_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(10),
age INT,
nationality VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(10),
    ticket_price DECIMAL(10,2),

    FOREIGN KEY (passenger_id)
        REFERENCES passengers(passenger_id),

    FOREIGN KEY (flight_id)
        REFERENCES flights(flight_id)
);

CREATE TABLE baggage (
    baggage_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    baggage_weight DECIMAL(5,2),
    baggage_status VARCHAR(30),

    FOREIGN KEY (passenger_id)
        REFERENCES passengers(passenger_id),

    FOREIGN KEY (flight_id)
        REFERENCES flights(flight_id)
);

INSERT INTO airlines
(airline_id, airline_name, country, airline_code)
VALUES
(1, 'IndiGo', 'India', '6E'),
(2, 'Air India', 'India', 'AI'),
(3, 'Vistara', 'India', 'UK'),
(4, 'Emirates', 'UAE', 'EK'),
(5, 'Qatar Airways', 'Qatar', 'QR');

INSERT INTO airports
(airport_id, airport_name, city, country, airport_code)
VALUES
(1, 'Indira Gandhi International Airport', 'Delhi', 'India', 'DEL'),
(2, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India', 'BOM'),
(3, 'Kempegowda International Airport', 'Bangalore', 'India', 'BLR'),
(4, 'Dabolim Airport', 'Goa', 'India', 'GOI'),
(5, 'Dubai International Airport', 'Dubai', 'UAE', 'DXB'),
(6, 'Hamad International Airport', 'Doha', 'Qatar', 'DOH');

INSERT INTO aircraft
(aircraft_id, airline_id, aircraft_type, capacity)
VALUES
(101, 1, 'Airbus A320', 180),
(102, 1, 'Airbus A321', 220),
(103, 2, 'Airbus A320neo', 186),
(104, 2, 'Boeing 787', 256),
(105, 3, 'Airbus A320neo', 164),
(106, 4, 'Boeing 777', 350),
(107, 4, 'Airbus A380', 500),
(108, 5, 'Boeing 777', 396);

INSERT INTO flights
(
    flight_id,
    airline_id,
    aircraft_id,
    origin_airport,
    destination_airport,
    scheduled_departure,
    actual_departure,
    scheduled_arrival,
    actual_arrival,
    status
)
VALUES
(1001, 1, 101, 1, 2,
 '2026-08-01 08:00:00',
 '2026-08-01 08:15:00',
 '2026-08-01 10:15:00',
 '2026-08-01 10:30:00',
 'Delayed'),

(1002, 2, 103, 2, 1,
 '2026-08-01 09:00:00',
 '2026-08-01 09:00:00',
 '2026-08-01 11:15:00',
 '2026-08-01 11:10:00',
 'On Time'),

(1003, 3, 105, 1, 3,
 '2026-08-01 10:30:00',
 '2026-08-01 10:45:00',
 '2026-08-01 13:15:00',
 '2026-08-01 13:30:00',
 'Delayed'),

(1004, 1, 102, 3, 4,
 '2026-08-02 07:00:00',
 '2026-08-02 07:00:00',
 '2026-08-02 08:15:00',
 '2026-08-02 08:10:00',
 'On Time'),

(1005, 4, 106, 1, 5,
 '2026-08-02 14:00:00',
 '2026-08-02 14:00:00',
 '2026-08-02 16:30:00',
 '2026-08-02 16:25:00',
 'On Time'),

(1006, 5, 108, 1, 6,
 '2026-08-03 16:00:00',
 '2026-08-03 16:40:00',
 '2026-08-03 19:00:00',
 '2026-08-03 19:40:00',
 'Delayed'),

(1007, 2, 104, 1, 4,
 '2026-08-03 18:00:00',
 '2026-08-03 18:00:00',
 '2026-08-03 20:30:00',
 '2026-08-03 20:20:00',
 'On Time'),

(1008, 1, 101, 4, 1,
 '2026-08-04 12:00:00',
 '2026-08-04 12:20:00',
 '2026-08-04 14:30:00',
 '2026-08-04 14:50:00',
 'Delayed'),

(1009, 4, 107, 5, 1,
 '2026-08-05 09:00:00',
 '2026-08-05 09:00:00',
 '2026-08-05 13:30:00',
 '2026-08-05 13:25:00',
 'On Time'),

(1010, 5, 108, 6, 1,
 '2026-08-05 11:00:00',
 '2026-08-05 11:00:00',
 '2026-08-05 14:00:00',
 '2026-08-05 13:55:00',
 'On Time');
 
INSERT INTO passengers
(passenger_id, first_name, last_name, gender, age, nationality)
VALUES
(1, 'Rahul', 'Sharma', 'Male', 24, 'Indian'),
(2, 'Priya', 'Singh', 'Female', 28, 'Indian'),
(3, 'Arjun', 'Mehta', 'Male', 32, 'Indian'),
(4, 'Sneha', 'Kapoor', 'Female', 26, 'Indian'),
(5, 'Ahmed', 'Khan', 'Male', 41, 'Indian'),
(6, 'Sarah', 'Wilson', 'Female', 35, 'British'),
(7, 'Daniel', 'Brown', 'Male', 29, 'British'),
(8, 'Aisha', 'Rahman', 'Female', 31, 'Qatari'),
(9, 'Vikram', 'Patel', 'Male', 45, 'Indian'),
(10, 'Neha', 'Verma', 'Female', 22, 'Indian');
 
 INSERT INTO bookings
(booking_id, passenger_id, flight_id, booking_date, seat_number, ticket_price)
VALUES
(5001, 1, 1001, '2026-07-20', '12A', 6500),
(5002, 2, 1001, '2026-07-21', '12B', 6500),
(5003, 3, 1002, '2026-07-22', '15C', 7200),
(5004, 4, 1003, '2026-07-23', '18A', 5800),
(5005, 5, 1004, '2026-07-24', '10B', 4200),
(5006, 6, 1005, '2026-07-25', '22A', 32000),
(5007, 7, 1006, '2026-07-26', '25C', 28000),
(5008, 8, 1007, '2026-07-27', '20D', 8500),
(5009, 9, 1008, '2026-07-28', '14A', 6200),
(5010, 10, 1009, '2026-07-29', '30B', 35000),
(5011, 1, 1010, '2026-07-30', '16A', 29000),
(5012, 2, 1003, '2026-07-30', '16B', 5800);

INSERT INTO baggage
(baggage_id, passenger_id, flight_id, baggage_weight, baggage_status)
VALUES
(9001, 1, 1001, 18.5, 'Delivered'),
(9002, 2, 1001, 22.0, 'Delivered'),
(9003, 3, 1002, 15.0, 'Delivered'),
(9004, 4, 1003, 20.5, 'Delivered'),
(9005, 5, 1004, 17.0, 'Delivered'),
(9006, 6, 1005, 25.5, 'Delivered'),
(9007, 7, 1006, 30.0, 'Delayed'),
(9008, 8, 1007, 19.0, 'Delivered'),
(9009, 9, 1008, 21.5, 'Delivered'),
(9010, 10, 1009, 28.0, 'Delivered'),
(9011, 1, 1010, 20.0, 'Delivered'),
(9012, 2, 1003, 18.0, 'Delivered');

SELECT 
    p.passenger_id,
    p.first_name,
    p.last_name,
    b.flight_id,
    b.seat_number,
    b.ticket_price
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id;
    
    SELECT
    b.booking_id,
    b.passenger_id,
    f.flight_id,
    f.scheduled_departure,
    f.status
FROM bookings b
JOIN flights f
    ON b.flight_id = f.flight_id;
    
    SELECT
    p.first_name,
    p.last_name,
    f.flight_id,
    f.status
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
JOIN flights f
    ON b.flight_id = f.flight_id;
    
SELECT
    f.flight_id,
    a.aircraft_type,
    a.capacity,
    f.status
FROM flights f
JOIN aircraft a
    ON f.aircraft_id = a.aircraft_id;

SELECT
    p.first_name,
    p.last_name,
    a.airline_name,
    f.flight_id,
    f.status
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
JOIN flights f
    ON b.flight_id = f.flight_id
JOIN airlines a
    ON f.airline_id = a.airline_id;
    
SELECT
    f.flight_id,
    a.airline_name,
    ac.aircraft_type,
    ac.capacity,
    origin.airport_code AS origin,
    destination.airport_code AS destination,
    f.scheduled_departure,
    f.scheduled_arrival,
    f.status
FROM flights f

JOIN airlines a
    ON f.airline_id = a.airline_id
    
    