USE ManagingProperties;

INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
SELECT customer_id, property_id, agent_id, CONCAT(CURDATE(), ' 12:00:00')
FROM customers, properties, agents
WHERE properties.property_id = 1
  AND agents.agent_id = 1
  AND properties.fk_seller_id = 1
  AND properties.status = 'FOR SALE'
  AND customers.customer_id = 1
  AND NOT EXISTS (
    SELECT *
    FROM bookings
    WHERE bookings.fk_property_id = properties.property_id
      AND bookings.datetime_placed = CONCAT(CURDATE(), ' 12:00:00')
  )
  AND NOT EXISTS (
    SELECT *
    FROM bookings
    WHERE bookings.fk_agent_id = agents.agent_id
      AND bookings.datetime_placed = CONCAT(CURDATE(), ' 12:00:00')
  );


/* SELECT COUNT(*) as count
FROM properties p
JOIN agents a ON p.fk_seller_id = a.agent_id
JOIN customers c ON c.customer_id = 1
WHERE p.property_id = 1
  AND p.status = 'FOR SALE'
  AND NOT EXISTS (
    SELECT *
    FROM bookings b
    WHERE b.fk_property_id = p.property_id
      AND b.datetime_placed = '2023-04-22 12:00:00'
  )
  AND NOT EXISTS (
    SELECT *
    FROM bookings b
    WHERE b.fk_agent_id = a.agent_id
      AND b.datetime_placed = '2023-04-22 12:00:00'
  )
  AND EXISTS (
    SELECT *
    FROM customers c
    WHERE c.customer_id = 1
  ); */

/* INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
SELECT customer_id, property_id, agent_id, CURDATE(), '10:00:00'
FROM customers, properties, agents
WHERE properties.property_id = 1
  AND agents.agent_id = 1
  AND properties.fk_seller_id = 1
  AND properties.status = 'FOR SALE'
  AND customers.customer_id = 1
  AND NOT EXISTS (
    SELECT *
    FROM bookings
    WHERE bookings.fk_property_id = properties.property_id
      AND bookings.datetime_placed = CURDATE()
      AND TIME(bookings.datetime_placed) = '10:00:00'
  )
  AND NOT EXISTS (
    SELECT *
    FROM bookings
    WHERE bookings.fk_agent_id = agents.agent_id
      AND bookings.datetime_placed = CURDATE()
      AND TIME(bookings.datetime_placed) = '10:00:00'
  ); */


/* DELIMITER //
DROP PROCEDURE book_viewing;
CREATE PROCEDURE book_viewing(
  IN p_property_id INT,
  IN p_buyer_id INT,
  IN p_time_slot DATETIME
)
BEGIN
  -- Check if the property is still available for sale
  DECLARE property_stat ENUM('FOR SALE', 'SOLD', 'WITHDRAWN'); 
  DECLARE v_buyer_registered INT;
  DECLARE v_slot_count INT;
  DECLARE v_agent_id INT;

  SELECT property_status INTO property_stat FROM properties WHERE property_ID = p_property_id;
  IF property_stat = 'SOLD' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Property has been sold';
  END IF;

  -- Check if the buyer is registered
  SELECT count() INTO v_buyer_registered FROM buyers WHERE buyer_id = p_buyer_id;
  IF v_buyer_registered = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Buyer is not registered';
  END IF;

  -- Check if the time slot is available
  SELECT COUNT() INTO v_slot_count FROM bookings WHERE property_id_fk = p_property_id AND timeslot = p_time_slot;
  IF v_slot_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Time slot not available';
  END IF;

  -- Check if there is an available agent
  SELECT agent_id INTO v_agent_id FROM agents WHERE availability = TRUE LIMIT 1;
  IF v_agent_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No available agent';
  END IF;

  -- Create booking
  INSERT INTO bookings (buyer_id_fk, property_id_fk, agent_id_fk, timeslot) VALUES (p_buyer_id, p_property_id, v_agent_id, p_time_slot);
  -- Update agent availability
  UPDATE agents SET availability = FALSE WHERE agent_id = v_agent_id;
END;
//
DELIMITER ;

CALL book_viewing(3, 25, '2023-05-02 11:00:00.000'); */


/* 
INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, date_placed, time_placed)
SELECT c.customer_id, p.property_id, a.agent_id, '2023-05-01', '10:00:00'
FROM properties p

JOIN sellers s ON p.fk_seller_id = s.seller_id
JOIN agents a ON a.agent_id = p.fk_agent_id
LEFT JOIN bookings b ON b.fk_property_id = p.property_id AND b.date_placed = '2023-05-01' AND b.time_placed = '10:00:00'
JOIN customers c ON c.email = 'buyer@example.com'

WHERE p.status = 'FOR SALE' AND b.booking_id IS NULL AND a.agent_id = 1 AND p.address = '123 Main St';
 */

/* INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
SELECT c.customer_id, p.property_id, a.agent_id, '2023-04-22 10:00:00'
FROM customers c
JOIN properties p ON p.postcode = c.postcode
JOIN agents a ON a.agent_id = p.fk_agent_id
WHERE p.status = 'FOR SALE'
AND NOT EXISTS (
  SELECT *
  FROM bookings b
  WHERE b.fk_property_id = p.property_id
  AND b.datetime_placed = '2023-04-22 10:00:00'
)
AND TIME('2023-04-22 10:00:00') BETWEEN '08:00:00' AND '17:00:00'; */

/* INSERT INTO bookings (fk_customer_id, fk_property_id, fk_agent_id, datetime_placed)
SELECT c.customer_id, p.property_id, a.agent_id, '2023-04-22 09:00:00' -- replace with desired time slot
FROM properties p
JOIN agents a ON a.agent_id = p.fk_agent_id
JOIN customers c ON c.email = 'buyer_email@example.com' -- replace with actual buyer email
LEFT JOIN bookings b ON b.fk_property_id = p.property_id AND b.datetime_placed = '2023-04-22 09:00:00' -- replace with desired time slot
WHERE p.status = 'FOR SALE' AND b.booking_id IS NULL
LIMIT 1; */