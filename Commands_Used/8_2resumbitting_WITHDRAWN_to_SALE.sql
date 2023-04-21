USE ManagingProperties;

UPDATE properties
SET status = 'FOR SALE'
WHERE property_id = '8' AND status = 'WITHDRAWN';

SELECT*FROM properties WHERE property_id = '8';