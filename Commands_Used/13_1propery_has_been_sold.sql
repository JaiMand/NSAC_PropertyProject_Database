USE ManagingProperties;

DELIMITER //

CREATE TRIGGER IF NOT EXISTS check_sold_property BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
  DECLARE sold INT;
  SELECT COUNT(*) INTO sold FROM properties WHERE property_id = NEW.fk_property_id AND status = 'SOLD';
  IF sold > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The property has been sold and cannot be viewed.';
  END IF;
END //

DELIMITER ;

INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
VALUES (1, 1, 1, '2023-04-21 11:00:00');


/* DELIMITER //
CREATE TRIGGER IF NOT EXISTS property_sold_trigger BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
  DECLARE property_status VARCHAR(50);
  
  SELECT status INTO property_status FROM properties WHERE property_id = NEW.fk_property_id;
  
  IF property_status = 'SOLD' THEN
    SIGNAL SQLSTATE '406' SET MESSAGE_TEXT = 'Property has been sold';
  END IF;
END;//
DELIMITER ; */

/* INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
VALUES (1, 1, 1, '2023-04-22 10:00:00'); */