USE ManagingProperties;

DELIMITER $$
CREATE TRIGGER check_property_status BEFORE UPDATE ON properties
FOR EACH ROW
BEGIN
    IF OLD.status = 'SOLD' AND NEW.status = 'WITHDRAWN' THEN
        SIGNAL SQLSTATE '406' SET MESSAGE_TEXT = 'Property cannot be withdrawn as it is already sold.';
    END IF;
END$$
DELIMITER ;

UPDATE properties
SET status = 'SOLD'
WHERE property_id = '3';

/* UPDATE PROPERTY SET status = 'WITHDRAWN' WHERE id = 1 AND status != 'SOLD'; */