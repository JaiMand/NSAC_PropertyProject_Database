USE ManagingProperties;

ALTER TABLE sellers MODIFY COLUMN phone_number char(11) NOT NULL;

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '123 Main St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('John', 'Doe', 'john.doe@example.com', '123 Main St', 'M4C 1M9', 07234567890);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '456 Oak St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', 'M6H 2K2', 07987654321);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '789 Elm St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('David', 'Lee', 'david.lee@example.com', '789 Elm St', 'M5R 2G4', 07876543210);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '234 Cherry St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Sarah', 'Brown', 'sarah.brown@example.com', '234 Cherry St', 'M8V 1H2', 07789012345);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '567 Pine St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Michael', 'Chan', 'michael.chan@example.com', '567 Pine St', 'M4E 1H6', 07345678901);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '890 Cedar St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Lisa', 'Kim', 'lisa.kim@example.com', '890 Cedar St', 'M6J 1X9', 07456789012);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '321 Maple St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Robert', 'Nguyen', 'robert.nguyen@example.com', '321 Maple St', 'M5A 1T1', 07567890123);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '654 Birch St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Michelle', 'Garcia', 'michelle.garcia@example.com', '654 Birch St', 'M9W 1H8', 07678901234);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '987 Oak St')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Brian', 'Wong', 'brian.wong@example.com', '987 Oak St', 'M3H 1K3', 07789012345);
END

IF NOT EXISTS(SELECT * FROM PROPERTY WHERE address = '2100 Beach Ave')
BEGIN
INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
VALUES ('Stephanie', 'Chen', 'stephanie.chen@example.com', '2100 Beach Ave', 'V6G 1Z4', 07890123456);
END
