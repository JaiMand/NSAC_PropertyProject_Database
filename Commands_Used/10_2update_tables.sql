USE ManagingProperties;

INSERT INTO agents (first_name, surname, email, phone_number)
VALUES 
('John', 'Smith', 'john.smith@example.com', 07777777777),
('Sarah', 'Johnson', 'sarah.johnson@example.com', 07777777778),
('Adam', 'Brown', 'adam.brown@example.com', 07777777779),
('Emily', 'Taylor', 'emily.taylor@example.com', 07777777780),
('David', 'Wilson', 'david.wilson@example.com', 07777777781),
('Jessica', 'Anderson', 'jessica.anderson@example.com', 07777777782),
('Michael', 'Clark', 'michael.clark@example.com', 07777777783),
('Laura', 'Parker', 'laura.parker@example.com', 07777777784),
('Matthew', 'Turner', 'matthew.turner@example.com', 07777777785),
('Emma', 'Adams', 'emma.adams@example.com', 07777777786);

INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
VALUES (1, 1, 2, '2023-04-21 09:00:00'),
       (2, 3, 1, '2023-04-22 10:30:00'),
       (3, 2, 3, '2023-04-23 11:15:00'),
       (4, 1, 2, '2023-04-24 14:00:00'),
       (5, 4, 1, '2023-04-25 09:30:00'),
       (6, 2, 2, '2023-04-26 13:45:00'),
       (7, 3, 3, '2023-04-27 15:30:00'),
       (8, 4, 1, '2023-04-28 08:45:00'),
       (9, 2, 3, '2023-04-29 12:00:00'),
       (10, 1, 2, '2023-04-30 16:15:00');