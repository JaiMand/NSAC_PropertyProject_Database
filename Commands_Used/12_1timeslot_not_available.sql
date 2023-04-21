USE ManagingProperties;

DELIMITER //
CREATE TRIGGER IF NOT EXISTS check_booking_availability
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
  DECLARE booking_count INT;
  SELECT COUNT(*) INTO booking_count
  FROM bookings
  WHERE fk_property_id = NEW.fk_property_id
    AND datetime_placed = NEW.datetime_placed;
  
  IF booking_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '406 Not Acceptable: Booking already exists for this timeslot';
  END IF;
END//
DELIMITER ;

INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
VALUES (1, 1, 1, '2023-04-22 10:00:00');


/* DELIMITER $$
CREATE TRIGGER before_insert_bookings
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
    DECLARE num_bookings INTEGER;
    SET num_bookings = (
        SELECT COUNT(*)
        FROM bookings
        WHERE fk_property_id = NEW.fk_property_id
          AND datetime_placed = NEW.datetime_placed
    );
    IF num_bookings > 0 THEN
        SIGNAL SQLSTATE '406' SET MESSAGE_TEXT = 'Booking already exists for this time slot';
    END IF;
END$$
DELIMITER ; */