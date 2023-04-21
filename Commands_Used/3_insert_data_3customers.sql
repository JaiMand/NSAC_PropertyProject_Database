USE managingproperties;

ALTER TABLE customers MODIFY COLUMN phone_number char(11) NOT NULL;

INSERT INTO customers (first_name, surname, email, address, postcode, phone_number)
VALUES 
('Maggie', 'Nguyen', 'maggie.nguyen@example.com', '978 Main St', 'M4C 1M9', 07161234567),
('Tom', 'Gupta', 'tom.gupta@example.com', '34 Oak St', 'M6H 2K2', 07471234567),
('Sophia', 'Kim', 'sophia.kim@example.com', '345 Elm St', 'M5R 2G4', 07051234567),
('Ben', 'Patel', 'ben.patel@example.com', '544 Cherry St', 'M8V 1H2', 07472345678),
('Emma', 'Singh', 'emma.singh@example.com', '347 Pine St', 'M4E 1H6', 07162345678),
('Aiden', 'Wong', 'aiden.wong@example.com', '81 Cedar St', 'M6J 1X9', 07052345678),
('Avery', 'Chen', 'avery.chen@example.com', '1 Maple St', 'M5A 1T1', 07163456789),
('Oliver', 'Lee', 'oliver.lee@example.com', '45 Birch St', 'M9W 1H8', 07053456789),
('Isabella', 'Garcia', 'isabella.garcia@example.com', '20 Oak St', 'M3H 1K3', 07474567890),
('Ethan', 'Johnson', 'ethan.johnson@example.com', '92 Beach Ave', 'V6G 1Z4', 07785678901);
